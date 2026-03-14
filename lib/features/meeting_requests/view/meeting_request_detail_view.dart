import 'package:flutter/material.dart';
import '../../../core/constants/app_fonts.dart';

class MeetingRequestDetailView extends StatelessWidget {
  final int index;

  const MeetingRequestDetailView({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // Örnek datalar
    final names = ['Ahmet Yılmaz', 'Mehmet Çalışma', 'Ebru Korkmaz', 'Deniz Kaya'];
    final companies = ['Turcaf Teknoloji A.Ş.', 'Hepta Yazılım', 'ExpoNot Danışmanlık', 'Gözen Holding'];
    final titles = ['Yazılım Müdürü', 'Proje Koordinatörü', 'İş Geliştirme Uzmanı', 'Lead Yöneticisi'];
    final dates = ['26 Şubat 2026', '26 Şubat 2026', '26 Şubat 2026', '26 Şubat 2026'];
    final times = ['09:00 - 10:00', '10:00 - 11:00', '13:00 - 14:00', '14:00 - 14:45'];
    final notes = [
      'Yeni proje görüşmesi yapmak istiyorum. Dijital dönüşüm süreçlerimiz ve ExpoNot platformu hakkında detaylı bilgi almak istiyorum. Özellikle mobil uygulama entegrasyonları konusunda görüşmek isterim.',
      'Hepta yazılım projesi için görüşme talebi. Mevcut sistemlerimizin entegrasyonu ve yeni özelliklerin eklenmesi konusunda fikir alışverişinde bulunmak istiyoruz.',
      'Potansiyel iş birliği fırsatlarını değerlendirmek istiyoruz. ExpoNot platformunun danışmanlık hizmetlerimize entegrasyonu hakkında konuşalım.',
      'Gözen Holding bünyesindeki lead yönetim sistemi için görüşme talebi. Mevcut CRM sistemimizle entegrasyon olanaklarını değerlendirmek istiyoruz.'
    ];
    final emails = [
      'ahmet.yilmaz@turcaf.com',
      'mehmet.bulbul@hepta.com.tr',
      'ebru.korkmaz@exponot.com',
      'deniz.kaya@gozen.com.tr'
    ];
    final phones = [
      '+90 (532) 123 45 67',
      '+90 (535) 234 56 78',
      '+90 (538) 345 67 89',
      '+90 (533) 456 78 90'
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Görüşme Talebi Detayı',
          style: AppFonts.baseBold.copyWith(fontSize: 18, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profil Kartı
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        // Profil resmi
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFF0A84FF),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              names[index].split(' ').map((e) => e[0]).join(),
                              style: AppFonts.baseBold.copyWith(
                                fontSize: 28,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        // İsim
                        Text(
                          names[index],
                          style: AppFonts.baseBold.copyWith(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Ünvan
                        Text(
                          titles[index],
                          style: AppFonts.baseRegular.copyWith(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 2),
                        // Firma
                        Text(
                          companies[index],
                          style: AppFonts.baseSemibold.copyWith(
                            fontSize: 15,
                            color: const Color(0xFF0A84FF),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Tarih ve Saat Kartı
                  _buildInfoCard(
                    icon: Icons.calendar_today,
                    title: 'Talep Edilen Tarih ve Saat',
                    content: '${dates[index]}\n${times[index]}',
                    iconColor: const Color(0xFFFF9500),
                  ),

                  const SizedBox(height: 12),

                  // İletişim Bilgileri
                  _buildInfoCard(
                    icon: Icons.email,
                    title: 'E-posta',
                    content: emails[index],
                    iconColor: const Color(0xFF0A84FF),
                  ),

                  const SizedBox(height: 12),

                  _buildInfoCard(
                    icon: Icons.phone,
                    title: 'Telefon',
                    content: phones[index],
                    iconColor: const Color(0xFF34C759),
                  ),

                  const SizedBox(height: 12),

                  // Not Kartı
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2C2C2E),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFAF52DE).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.notes,
                                color: Color(0xFFAF52DE),
                                size: 20,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Görüşme Notu',
                              style: AppFonts.baseBold.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          notes[index],
                          style: AppFonts.baseRegular.copyWith(
                            fontSize: 15,
                            color: Colors.grey[300],
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),

          // Alt Butonlar
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Row(
                children: [
                  // Onayla Butonu
                  Expanded(
                    flex: 2,
                    child: _buildActionButton(
                      context: context,
                      icon: Icons.check_circle,
                      text: 'Onayla',
                      color: const Color(0xFF34C759),
                      onTap: () {
                        _showSuccessDialog(context, 'Görüşme onaylandı!');
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Revize Öner Butonu
                  Expanded(
                    child: _buildActionButton(
                      context: context,
                      icon: Icons.edit_calendar,
                      text: 'Revize',
                      color: const Color(0xFFFF9500),
                      onTap: () {
                        _showReviseDialog(context);
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Reddet Butonu
                  Expanded(
                    child: _buildActionButton(
                      context: context,
                      icon: Icons.cancel,
                      text: 'Reddet',
                      color: const Color(0xFFFF3B30),
                      onTap: () {
                        _showRejectDialog(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
    required Color iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppFonts.baseRegular.copyWith(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: AppFonts.baseSemibold.copyWith(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    required String text,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(height: 4),
            Text(
              text,
              style: AppFonts.baseBold.copyWith(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Icon(Icons.check_circle, color: Color(0xFF34C759), size: 60),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: AppFonts.baseBold.copyWith(fontSize: 18, color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              'Tamam',
              style: AppFonts.baseBold.copyWith(fontSize: 16, color: const Color(0xFF0A84FF)),
            ),
          ),
        ],
      ),
    );
  }

  void _showReviseDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Revize Tarihi Öner',
          style: AppFonts.baseBold.copyWith(fontSize: 20, color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Yeni bir tarih ve saat önerisi göndermek ister misiniz?',
              style: AppFonts.baseRegular.copyWith(fontSize: 15, color: Colors.grey[300]),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Tarih seçici
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.dark().copyWith(
                        colorScheme: const ColorScheme.dark(
                          primary: Color(0xFFFF9500),
                          surface: Color(0xFF2C2C2E),
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (date != null) {
                  if (context.mounted) {
                    Navigator.pop(context);
                    _showSuccessDialog(context, 'Revize önerisi gönderildi!');
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9500),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                'Tarih Seç',
                style: AppFonts.baseBold.copyWith(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'İptal',
              style: AppFonts.baseBold.copyWith(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  void _showRejectDialog(BuildContext context) {
    final reasonController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2C2C2E),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text(
          'Görüşmeyi Reddet',
          style: AppFonts.baseBold.copyWith(fontSize: 20, color: Colors.white),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Bu görüşme talebini reddetmek istediğinize emin misiniz?',
              style: AppFonts.baseRegular.copyWith(fontSize: 15, color: Colors.grey[300]),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: reasonController,
              maxLines: 3,
              style: AppFonts.baseRegular.copyWith(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Ret sebebi (opsiyonel)',
                hintStyle: AppFonts.baseRegular.copyWith(color: Colors.grey),
                filled: true,
                fillColor: const Color(0xFF1C1C1E),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'İptal',
              style: AppFonts.baseBold.copyWith(fontSize: 16, color: Colors.grey),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSuccessDialog(context, 'Görüşme reddedildi');
            },
            child: Text(
              'Reddet',
              style: AppFonts.baseBold.copyWith(fontSize: 16, color: const Color(0xFFFF3B30)),
            ),
          ),
        ],
      ),
    );
  }
}
