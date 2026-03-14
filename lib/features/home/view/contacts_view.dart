import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/navigation/navigation_args.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/features/home/view/contact_detail_view.dart' as detail;
import 'package:digivizit/shared/components/base_design/base_design.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactsView extends StatefulWidget {
  const ContactsView({super.key});

  @override
  State<ContactsView> createState() => _ContactsViewState();
}

class _ContactsViewState extends State<ContactsView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  String _searchQuery = '';
  String _selectedFilter = 'All';

  final List<ContactModel> _contacts = [
    ContactModel(
      name: 'Balkan Evrensel',
      company: 'ExpoNot',
      position: 'Kurucu & CEO',
      imageUrl: 'https://via.placeholder.com/80',
      phone: '+1 (555) 234-5678',
      email: 'balkan.evrensel@exponot.com',
      website: 'www.exponot.com',
      location: 'Istanbul, Turkey',
      sector: 'Technology & Innovation',
      tags: ['Technology', 'VIP'],
      tagColors: [Color(0xFF3B82F6), Color(0xFFA855F7)],
      businessCardImages: [
        'https://images.unsplash.com/photo-1589330273594-fade1ee91647?w=400',
        'https://images.unsplash.com/photo-1589330694653-356116ee5c86?w=400',
      ],
      activities: [
        ActivityModel(date: 'Feb 14, 2026', description: 'Met at Tech Innovation Summit 2026. Discussed potential partnership for Q2 product launch.'),
        ActivityModel(date: 'Feb 10, 2026', description: 'Follow-up email sent regarding AI integration proposal. Awaiting feedback.'),
        ActivityModel(date: 'Feb 5, 2026', description: 'Initial introduction via LinkedIn. Expressed interest in cloud solutions.'),
      ],
    ),
    ContactModel(
      name: 'Ahmet Demir',
      company: 'Global Solutions',
      position: 'Kıdemli Yatırım Müdürü',
      imageUrl: 'https://via.placeholder.com/80',
      phone: '+90 (532) 123-4567',
      email: 'ahmet.demir@globalsolutions.com',
      website: 'www.globalsolutions.com',
      location: 'Ankara, Turkey',
      sector: 'Finance & Investment',
      tags: ['Finance'],
      tagColors: [Color(0xFF10B981)],
      businessCardImages: ['https://images.unsplash.com/photo-1560179707-f14e90ef3623?w=400'],
      activities: [
        ActivityModel(date: 'Feb 12, 2026', description: 'Discussed investment opportunities in fintech sector. Scheduled Q1 presentation.'),
        ActivityModel(date: 'Jan 28, 2026', description: 'First meeting at Finance Conference. Exchanged contact information.'),
      ],
    ),
    ContactModel(
      name: 'Ayşe Yılmaz',
      company: 'Creative Marketing Hub',
      position: 'Marka Strateji Müdürü',
      imageUrl: 'https://via.placeholder.com/80',
      phone: '+90 (533) 987-6543',
      email: 'ayse.yilmaz@creativehub.com',
      website: 'www.creativehub.com',
      location: 'Izmir, Turkey',
      sector: 'Marketing & Branding',
      tags: ['Marketing', 'Partner'],
      tagColors: [Color(0xFFEC4899), Color(0xFFF59E0B)],
      businessCardImages: ['https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=400'],
      activities: [
        ActivityModel(date: 'Feb 15, 2026', description: 'Brand strategy workshop completed. Received positive feedback on campaign ideas.'),
        ActivityModel(date: 'Feb 8, 2026', description: 'Partnership agreement signed for 2026 marketing initiatives.'),
      ],
    ),
    ContactModel(
      name: 'Mehmet Kaya',
      company: 'Quantum Innovations',
      position: 'Ürün Geliştirme Lideri',
      imageUrl: 'https://via.placeholder.com/80',
      phone: '+90 (534) 456-7890',
      email: 'mehmet.kaya@quantuminnovations.com',
      website: 'www.quantuminnovations.com',
      location: 'Istanbul, Turkey',
      sector: 'Technology & Innovation',
      tags: ['Technology'],
      tagColors: [Color(0xFF3B82F6)],
      businessCardImages: ['https://images.unsplash.com/photo-1557426272-fc759fdf7a8d?w=400'],
      activities: [
        ActivityModel(date: 'Feb 13, 2026', description: 'Product demo scheduled for next week. Preparing presentation materials.'),
        ActivityModel(date: 'Feb 1, 2026', description: 'Initial contact through referral. Discussed collaboration opportunities.'),
      ],
    ),
    ContactModel(
      name: 'Elif Şahin',
      company: 'NextGen Consulting',
      position: 'Kıdemli İş Danışmanı',
      imageUrl: 'https://via.placeholder.com/80',
      phone: '+90 (535) 321-6547',
      email: 'elif.sahin@nextgenconsulting.com',
      website: 'www.nextgenconsulting.com',
      location: 'Bursa, Turkey',
      sector: 'Business Consulting',
      tags: ['Consulting', 'Lead'],
      tagColors: [Color(0xFF8B5CF6), Color(0xFFFBBF24)],
      businessCardImages: ['https://images.unsplash.com/photo-1589330273594-fade1ee91647?w=400'],
      activities: [
        ActivityModel(date: 'Feb 11, 2026', description: 'Consulting session on business strategy. Received valuable insights.'),
        ActivityModel(date: 'Jan 25, 2026', description: 'Connected at Business Leaders Summit. Exploring consulting services.'),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut));

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<ContactModel> get _filteredContacts {
    return _contacts.where((contact) {
      final matchesSearch =
          contact.name.toLowerCase().contains(_searchQuery.toLowerCase()) || contact.company.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesFilter = _selectedFilter == 'All' || contact.tags.contains(_selectedFilter);
      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseDesign(
      backgroundWidget: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF2D1B69), Color(0xFF1A0F3D)]),
        ),
      ),
      children: [
        FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FigmaBox(height: 75),

              // Başlık
              Text('Contact Library', style: AppFonts.baseBold.copyWith(fontSize: 28, color: AppColors.baseWhite, letterSpacing: -0.5)),
              FigmaBox(height: 24),

              // Arama Kutusu
              _buildSearchBar(),
              FigmaBox(height: 20),

              // Filtre Butonları
              _buildFilterButtons(),
              FigmaBox(height: 24),

              // Kişi Listesi
              ..._filteredContacts.map((contact) => _buildContactCard(contact)).toList(),

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
        border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.15), width: 1),
      ),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.baseWhite.withValues(alpha: 0.5), size: 22),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              style: AppFonts.baseRegular.copyWith(fontSize: 15, color: AppColors.baseWhite),
              decoration: InputDecoration(
                hintText: 'Search contacts...',
                hintStyle: AppFonts.baseRegular.copyWith(fontSize: 15, color: AppColors.baseWhite.withValues(alpha: 0.5)),
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

  Widget _buildFilterButtons() {
    final filters = ['All', 'Technology', 'Finance', 'Marketing', 'VIP', 'Partner'];

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
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFF3B82F6) : AppColors.baseWhite.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: isSelected ? Color(0xFF3B82F6) : AppColors.baseWhite.withValues(alpha: 0.15), width: 1),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (filter != 'All') ...[
                      Icon(Icons.label, size: 16, color: isSelected ? AppColors.baseWhite : AppColors.baseWhite.withValues(alpha: 0.7)),
                      const SizedBox(width: 6),
                    ],
                    Text(
                      filter,
                      style: AppFonts.baseSemibold.copyWith(fontSize: 13, color: isSelected ? AppColors.baseWhite : AppColors.baseWhite.withValues(alpha: 0.7)),
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

  Widget _buildContactCard(ContactModel contact) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          NavigationEnums.contactDetail.rawValue,
          arguments: NavigationArgs(
            data: detail.ContactDetailModel(
              name: contact.name,
              company: contact.company,
              position: contact.position,
              contactPerson: contact.contactPerson,
              contactPhone: contact.contactPhone,
              contactEmail: contact.contactEmail,
              phone: contact.phone,
              email: contact.email,
              website: contact.website,
              location: contact.location,
              country: contact.country,
              sector: contact.sector,
              tags: contact.tags,
              tagColors: contact.tagColors,
              businessCardImages: contact.businessCardImages,
              activities: contact.activities.map((activity) => detail.ActivityModel(date: activity.date, description: activity.description)).toList(),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.baseWhite.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.1), width: 1),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.2), width: 2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  contact.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Color(0xFF1E3A8A),
                      child: Icon(Icons.person, color: AppColors.baseWhite, size: 30),
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
                  Text(contact.name, style: AppFonts.baseBold.copyWith(fontSize: 16, color: AppColors.baseWhite)),
                  const SizedBox(height: 4),
                  // Şirket
                  Text(contact.company, style: AppFonts.baseRegular.copyWith(fontSize: 13, color: AppColors.baseWhite.withValues(alpha: 0.7))),
                  const SizedBox(height: 2),
                  // Pozisyon
                  Text(
                    contact.position,
                    style: AppFonts.baseRegular.copyWith(fontSize: 12, color: AppColors.baseWhite.withValues(alpha: 0.6)),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  // Etiketler
                  Wrap(
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
                  ),
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

  Widget _buildActionButton({required IconData icon, required Color color, required VoidCallback onTap}) {
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

// Contact Model
class ContactModel {
  final String name;
  final String company;
  final String position;
  final String imageUrl;
  final String contactPerson;
  final String contactPhone;
  final String contactEmail;
  final String phone;
  final String email;
  final String website;
  final String location;
  final String country;
  final String sector;
  final List<String> tags;
  final List<Color> tagColors;
  final List<String> businessCardImages;
  final List<ActivityModel> activities;

  ContactModel({
    required this.name,
    required this.company,
    required this.position,
    required this.imageUrl,
    this.contactPerson = '',
    this.contactPhone = '',
    this.contactEmail = '',
    required this.phone,
    required this.email,
    required this.website,
    required this.location,
    this.country = '',
    required this.sector,
    required this.tags,
    required this.tagColors,
    required this.businessCardImages,
    required this.activities,
  });
}

// Activity Model (contacts_view için)
class ActivityModel {
  final String date;
  final String description;

  ActivityModel({required this.date, required this.description});
}
