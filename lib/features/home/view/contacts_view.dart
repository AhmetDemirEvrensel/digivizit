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
  final ContactsResponse contactsResponse;
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

  Color _topColor = AppColors.info900;
  Color _bottomColor = AppColors.info950;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    final savedPersonelInfo = AppSettings.instance.personelInfo;
    if (savedPersonelInfo != null) {
      _homeViewModel.setInitialPersonelInfo(savedPersonelInfo);
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contacts = widget.contactsResponse.data ?? const <ContactsData>[];
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
                    padding: EdgeInsets.zero,
                    itemCount: filteredContacts.length,
                    itemBuilder: (context, index) {
                      final contact = filteredContacts[index];
                      return _buildContactCard(contact);
                    },
                  ),
                ),

              /* // Kişi Listesi
              ..._filteredContacts
                  .map((contact) => _buildContactCard(contact))
                  .toList(), */

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

  List<String> _buildSectorFilters(List<ContactsData> contacts) {
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

  Widget _buildContactCard(ContactsData contact) {
    final name = contact.name;
    final position = contact.position;

    return GestureDetector(
      onTap: () {
        Get.toNamed(
          NavigationEnums.contactDetail.rawValue,
          arguments: NavigationArgs(data: contact),
        );
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
                child: Image.network(
                  "https://via.placeholder.com/150",
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Color(0xFF1E3A8A),
                      child: Icon(
                        Icons.person,
                        color: AppColors.baseWhite,
                        size: 30,
                      ),
                    );
                  },
                ),
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
                  // Pozisyon
                  Text(
                    position,
                    style: AppFonts.baseRegular.copyWith(
                      fontSize: 12,
                      color: AppColors.baseWhite.withValues(alpha: 0.6),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Etiketler
                  /* Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: List.generate(
                      contact.tags.length,
                      (index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: contact.tagColors[index].withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: contact.tagColors[index].withValues(alpha: 0.3), width: 1),
                        ),
                        child: Text(contact.tags[index], style: AppFonts.baseSemibold.copyWith(fontSize: 11, color: contact.tagColors[index])),
                      ),
                    ),
                  ), */
                ],
              ),
            ),

            // Aksiyon Butonları
            _buildActionButton(
              icon: Icons.save_alt,
              color: Color(0xFF10B981),
              onTap: () {
                // Telefon arama
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}
