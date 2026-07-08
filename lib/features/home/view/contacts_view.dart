import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/business_cards/contacts_response.dart';
import 'package:digivizit/core/navigation/navigation_args.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactsView extends StatefulWidget {
  final BusinessCardListResponse contactsResponse;
  const ContactsView({super.key, required this.contactsResponse});

  @override
  State<ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  String _searchQuery = '';
  String _selectedFilter = 'All';
  final HomeViewModel _homeViewModel = HomeViewModel();
  final ScrollController _scrollController = ScrollController();
  late BusinessCardListResponse _contactsResponse;

  Color _topColor = AppColors.info900;
  Color _bottomColor = AppColors.info950;
  @override
  void initState() {
    super.initState();
    _contactsResponse = widget.contactsResponse;
    _homeViewModel.getContactsResponse = _contactsResponse;
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    final savedProfile = AppSettings.instance.profile;
    if (savedProfile != null) {
      _homeViewModel.setInitialProfile(savedProfile);
    }

    _homeViewModel
        .loadBackgroundColors(
          topFallback: _topColor,
          bottomFallback: _bottomColor,
        )
        .then((gradientColors) {
          if (!mounted) return;

          setState(() {
            _topColor = gradientColors.topColor;
            _bottomColor = gradientColors.bottomColor;
          });
        });
    _animationController.forward();
    _scrollController.addListener(_onScroll);
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
    _animationController.dispose();
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
      topColor: _topColor,
      bottomColor: _bottomColor,
      isScrollable: false,
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FigmaBox(height: 75),

              // Başlık
              Text(
                'Bağlantılarım',
                style: AppFonts.baseBold.copyWith(
                  fontSize: 28,
                  color: AppColors.baseWhite,
                  letterSpacing: -0.5,
                ),
              ),
              FigmaBox(height: 24),

              // Arama Kutusu
              _buildSearchBar(),
              FigmaBox(height: 20),

              // Filtre Butonları
              _buildFilterButtons(filters),
              FigmaBox(height: 20),
              if (filteredContacts.isEmpty)
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Center(
                    child: Text(
                      'Baglanti bulunamadi',
                      style: AppFonts.baseSemibold.copyWith(
                        fontSize: 15,
                        color: AppColors.baseWhite.withValues(alpha: 0.72),
                      ),
                    ),
                  ),
                )
              else
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.builder(
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    itemCount:
                        filteredContacts.length +
                        (_homeViewModel.isLoadingMoreContacts ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index >= filteredContacts.length) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        );
                      }
                      final contact = filteredContacts[index];
                      return _buildContactCard(contact);
                    },
                  ),
                ),

              // Alt boşluk (bottom nav için)
              FigmaBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.baseWhite.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.baseWhite.withValues(alpha: 0.15),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColors.baseWhite.withValues(alpha: 0.5),
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              style: AppFonts.baseRegular.copyWith(
                fontSize: 15,
                color: AppColors.baseWhite,
              ),
              decoration: InputDecoration(
                hintText: 'Ara ...',
                hintStyle: AppFonts.baseRegular.copyWith(
                  fontSize: 15,
                  color: AppColors.baseWhite.withValues(alpha: 0.5),
                ),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
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

  Widget _buildFilterButtons(List<String> filters) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Color(0xFF3B82F6)
                      : AppColors.baseWhite.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected
                        ? Color(0xFF3B82F6)
                        : AppColors.baseWhite.withValues(alpha: 0.15),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (filter != 'All') ...[
                      Icon(
                        Icons.label,
                        size: 16,
                        color: isSelected
                            ? AppColors.baseWhite
                            : AppColors.baseWhite.withValues(alpha: 0.7),
                      ),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      filter,
                      style: AppFonts.baseSemibold.copyWith(
                        fontSize: 13,
                        color: isSelected
                            ? AppColors.baseWhite
                            : AppColors.baseWhite.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildContactCard(BusinessCardListItem contact) {
    final name = contact.name;
    final sector = contact.sectorText;

    return GestureDetector(
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
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.baseWhite.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.baseWhite.withValues(alpha: 0.1),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.baseWhite.withValues(alpha: 0.2),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: (contact.thumbnail?.trim().isNotEmpty ?? false)
                    ? Image.network(
                        contact.thumbnail!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _contactAvatarFallback();
                        },
                      )
                    : _contactAvatarFallback(),
              ),
            ),
            const SizedBox(width: 16),

            // Bilgiler
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // İsim
                  Text(
                    name,
                    style: AppFonts.baseBold.copyWith(
                      fontSize: 16,
                      color: AppColors.baseWhite,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Şirket
                  Text(
                    contact.company,
                    style: AppFonts.baseRegular.copyWith(
                      fontSize: 13,
                      color: AppColors.baseWhite.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 2),
                  // Sektör
                  Text(
                    sector,
                    style: AppFonts.baseRegular.copyWith(
                      fontSize: 12,
                      color: AppColors.baseWhite.withValues(alpha: 0.6),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactAvatarFallback() {
    return Container(
      color: Color(0xFF1E3A8A),
      child: Icon(Icons.person, color: AppColors.baseWhite, size: 30),
    );
  }
}
