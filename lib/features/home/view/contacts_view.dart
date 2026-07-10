import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/navigation/navigation_args.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/buttons/pressable_scale.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/loader/shimmer_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

class ContactsView extends StatefulWidget {
  final BusinessCardListResponse contactsResponse;
  const ContactsView({super.key, required this.contactsResponse});

  @override
  State<ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView> {
  static const _ink = Color(0xFF0F172A);
  static const _inkSoft = Color(0xFF64748B);
  static const _hairline = Color(0xFFE2E8F0);

  /// Baş-harf avatarları için isimden hash'lenerek seçilen pastel paleti.
  static const List<(Color, Color)> _avatarPalette = [
    (Color(0xFFDBEAFE), Color(0xFF2563EB)),
    (Color(0xFFDCFCE7), Color(0xFF16A34A)),
    (Color(0xFFFEF3C7), Color(0xFFD97706)),
    (Color(0xFFFCE7F3), Color(0xFFDB2777)),
    (Color(0xFFEDE9FE), Color(0xFF7C3AED)),
    (Color(0xFFCCFBF1), Color(0xFF0D9488)),
    (Color(0xFFFFE4E6), Color(0xFFE11D48)),
  ];

  String _searchQuery = '';
  String _selectedFilter = 'All';
  bool _searchFocused = false;
  final HomeViewModel _homeViewModel = HomeViewModel();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();
  late BusinessCardListResponse _contactsResponse;

  @override
  void initState() {
    super.initState();
    _contactsResponse = widget.contactsResponse;
    _homeViewModel.getContactsResponse = _contactsResponse;
    _scrollController.addListener(_onScroll);
    _searchFocusNode.addListener(() {
      setState(() => _searchFocused = _searchFocusNode.hasFocus);
    });
  }

  @override
  void didUpdateWidget(covariant ContactsView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.contactsResponse != widget.contactsResponse) {
      _contactsResponse = widget.contactsResponse;
      _homeViewModel.getContactsResponse = widget.contactsResponse;
    }
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final threshold = _scrollController.position.maxScrollExtent - 200;
    if (_scrollController.position.pixels >= threshold) {
      _loadMore();
    }
  }

  Future<void> _refreshAfterDetailChange() async {
    final refreshed = await _homeViewModel.refreshContactsInfo(
      showLoader: false,
    );
    if (mounted && refreshed != null) {
      setState(() {
        _contactsResponse = refreshed;
      });
    }
  }

  Future<void> _loadMore() async {
    await _homeViewModel.loadMoreContacts();
    final updated = _homeViewModel.getContactsResponse;
    if (mounted && updated != null) {
      setState(() {
        _contactsResponse = updated;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contacts =
        _contactsResponse.data?.items ?? const <BusinessCardListItem>[];
    final filters = _buildSectorFilters(contacts);
    final normalizedQuery = _searchQuery.trim().toLowerCase();
    final filteredContacts = contacts.where((contact) {
      final matchesFilter =
          _selectedFilter == 'All' || contact.sectorValue == _selectedFilter;
      if (!matchesFilter) return false;

      if (normalizedQuery.isEmpty) {
        return true;
      }

      return contact.searchableValues.any(
        (value) => value.toLowerCase().contains(normalizedQuery),
      );
    }).toList();

    return BaseDesign(
      topColor: const Color(0xFFF8F9FB),
      bottomColor: const Color(0xFFFFFFFF),
      isScrollable: false,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FigmaBox(height: 68),

            Text('Bağlantılarım', style: AppFonts.xl2Bold.withColor(_ink))
                .animate()
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.08, end: 0, curve: Curves.easeOutCubic),
            const SizedBox(height: 4),
            Text(
                  '${contacts.length} kayıtlı kartvizit',
                  style: AppFonts.smRegular.withColor(_inkSoft),
                )
                .animate(delay: 60.ms)
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.08, end: 0, curve: Curves.easeOutCubic),
            FigmaBox(height: 20),

            _buildSearchBar()
                .animate(delay: 120.ms)
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.08, end: 0, curve: Curves.easeOutCubic),
            FigmaBox(height: 14),

            _buildFilterChips(filters)
                .animate(delay: 180.ms)
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.08, end: 0, curve: Curves.easeOutCubic),
            FigmaBox(height: 18),

            if (filteredContacts.isEmpty)
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.contact_page_outlined,
                        size: 44,
                        color: _inkSoft.withValues(alpha: 0.5),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Bağlantı bulunamadı',
                        style: AppFonts.base2Semibold.withColor(_inkSoft),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 350.ms),
              )
            else
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.62,
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(bottom: 120),
                  itemCount:
                      filteredContacts.length +
                      (_homeViewModel.isLoadingMoreContacts ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= filteredContacts.length) {
                      return const Padding(
                        padding: EdgeInsets.only(bottom: 14),
                        child: ShimmerBox(
                          height: 84,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                      );
                    }
                    final contact = filteredContacts[index];
                    final card = _buildContactCard(contact, index);

                    // Sadece ilk görünen satırlara giriş animasyonu —
                    // sayfalama ile gelenler animasyonsuz eklenir.
                    if (index < 10) {
                      return card
                          .animate(delay: (240 + index * 45).ms)
                          .fadeIn(duration: 380.ms)
                          .slideX(
                            begin: 0.05,
                            end: 0,
                            curve: Curves.easeOutCubic,
                          );
                    }
                    return card;
                  },
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeOut,
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(
          color: _searchFocused ? AppColors.primary500 : _hairline,
          width: _searchFocused ? 1.6 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: _searchFocused
                ? AppColors.primary500.withValues(alpha: 0.12)
                : _ink.withValues(alpha: 0.04),
            blurRadius: _searchFocused ? 18 : 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.search_rounded,
            color: _searchFocused ? AppColors.primary500 : _inkSoft,
            size: 21,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              focusNode: _searchFocusNode,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              style: AppFonts.base2Regular.withColor(_ink),
              decoration: InputDecoration(
                filled: false,
                hintText: 'İsim, firma veya sektör ara...',
                hintStyle: AppFonts.base2Regular.withColor(
                  _inkSoft.withValues(alpha: 0.7),
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<String> _buildSectorFilters(List<BusinessCardListItem> contacts) {
    final uniqueSectors = <String>[];
    final seenSectors = <String>{};

    for (final contact in contacts) {
      final sector = contact.sectorValue;
      if (sector == null) continue;
      if (sector.isEmpty) continue;

      final normalizedSector = sector.toLowerCase();
      if (seenSectors.add(normalizedSector)) {
        uniqueSectors.add(sector);
      }
    }

    return ['All', ...uniqueSectors];
  }

  Widget _buildFilterChips(List<String> filters) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          final label = filter == 'All' ? 'Tümü' : filter;

          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeOutCubic,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary500
                      : AppColors.baseWhite,
                  borderRadius: BorderRadius.circular(999),
                  border: Border.all(
                    color: isSelected ? AppColors.primary500 : _hairline,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary500.withValues(
                        alpha: isSelected ? 0.3 : 0,
                      ),
                      blurRadius: isSelected ? 12 : 0,
                      offset: Offset(0, isSelected ? 4 : 0),
                    ),
                  ],
                ),
                child: Text(
                  label,
                  style: AppFonts.smSemibold.withColor(
                    isSelected ? AppColors.baseWhite : _inkSoft,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  (Color, Color) _avatarColorsFor(String name) {
    final hash = name.codeUnits.fold<int>(0, (acc, code) => acc + code);
    return _avatarPalette[hash % _avatarPalette.length];
  }

  String _initialsOf(String name) {
    final parts = name
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  Widget _buildContactCard(BusinessCardListItem contact, int index) {
    final name = contact.name;
    final sector = contact.sectorValue;
    final (avatarBg, avatarFg) = _avatarColorsFor(name);

    return PressableScale(
      onTap: () async {
        final changed = await Get.toNamed(
          NavigationEnums.contactDetail.rawValue,
          arguments: NavigationArgs(data: contact),
        );
        if (changed == true) {
          await _refreshAfterDetailChange();
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: _hairline),
          boxShadow: [
            BoxShadow(
              color: _ink.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildAvatar(contact, name, avatarBg, avatarFg),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppFonts.base2Bold.withColor(_ink),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    contact.company,
                    style: AppFonts.smRegular.withColor(_inkSoft),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (sector != null && sector.isNotEmpty) ...[
                    const SizedBox(height: 7),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: avatarBg.withValues(alpha: 0.6),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        sector,
                        style: AppFonts.xsSemibold.withColor(avatarFg),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: _inkSoft.withValues(alpha: 0.35),
              size: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar(
    BusinessCardListItem contact,
    String name,
    Color avatarBg,
    Color avatarFg,
  ) {
    final thumbnail = contact.thumbnail?.trim() ?? '';
    final hasThumb = (contact.hasImage ?? false) && thumbnail.isNotEmpty;

    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: avatarBg,
        borderRadius: BorderRadius.circular(17),
      ),
      clipBehavior: Clip.antiAlias,
      child: hasThumb
          ? Image.network(
              thumbnail,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child;
                return const ShimmerBox(
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                );
              },
              errorBuilder: (context, error, stackTrace) =>
                  _buildInitials(name, avatarFg),
            )
          : _buildInitials(name, avatarFg),
    );
  }

  Widget _buildInitials(String name, Color color) {
    return Center(
      child: Text(_initialsOf(name), style: AppFonts.lgBold.withColor(color)),
    );
  }
}
