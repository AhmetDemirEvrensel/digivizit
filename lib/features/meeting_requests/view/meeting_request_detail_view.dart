import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/appointment/appointment_response.dart' as appointment_model;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MeetingRequestDetailView extends StatelessWidget {
  final appointment_model.Datum appointment;

  static const List<String> _monthNames = ['', 'Ocak', 'Subat', 'Mart', 'Nisan', 'Mayis', 'Haziran', 'Temmuz', 'Agustos', 'Eylul', 'Ekim', 'Kasim', 'Aralik'];

  const MeetingRequestDetailView({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final requesterName = appointment.fullName?.trim().isNotEmpty == true ? appointment.fullName!.trim() : 'Isimsiz Talep';
    final company = appointment.company?.trim().isNotEmpty == true ? appointment.company!.trim() : 'Sirket belirtilmedi';
    final title = appointment.employee?.title?.trim().isNotEmpty == true
        ? appointment.employee!.title!.trim()
        : (appointment.employee?.department?.name?.trim().isNotEmpty == true ? appointment.employee!.department!.name!.trim() : 'Unvan belirtilmedi');
    final statusText = _statusLabel(appointment.status);
    final statusColor = _statusColor(appointment.status);
    final appointmentDateTime = _appointmentDateTime(appointment.preferredDate);
    final note = appointment.note?.trim().isNotEmpty == true ? appointment.note!.trim() : 'Talep notu bulunmuyor.';
    final subject = appointment.subject?.trim().isNotEmpty == true ? appointment.subject!.trim() : 'Gorusme Talebi';
    final email = appointment.employee?.email?.trim() ?? '';
    final phone = appointment.employee?.phone?.trim() ?? '';
    final department = appointment.employee?.department?.name?.trim() ?? '';
    final createdAt = _appointmentDateTime(appointment.createdAt);

    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C1C1E),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Gorusme Talebi Detayi', style: AppFonts.baseBold.copyWith(fontSize: 18, color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: const Color(0xFF2C2C2E), borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Center(child: _buildProfileAvatar(requesterName)),
                        const SizedBox(height: 16),
                        Text(
                          requesterName,
                          textAlign: TextAlign.center,
                          style: AppFonts.baseBold.copyWith(fontSize: 24, color: Colors.white),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: AppFonts.baseRegular.copyWith(fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          company,
                          textAlign: TextAlign.center,
                          style: AppFonts.baseSemibold.copyWith(fontSize: 15, color: const Color(0xFF0A84FF)),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(color: statusColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(999)),
                          child: Text(statusText, style: AppFonts.baseBold.copyWith(fontSize: 12, color: statusColor)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildInfoCard(icon: Icons.topic, title: 'Konu', content: subject, iconColor: const Color(0xFF5AC8FA)),
                  const SizedBox(height: 12),
                  _buildInfoCard(
                    icon: Icons.calendar_today,
                    title: 'Talep Edilen Tarih ve Saat',
                    content: _formatDateTime(appointmentDateTime),
                    iconColor: const Color(0xFFFF9500),
                  ),
                  if (department.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _buildInfoCard(icon: Icons.apartment, title: 'Departman', content: department, iconColor: const Color(0xFFBF5AF2)),
                  ],
                  if (email.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _buildInfoCard(
                      icon: Icons.email,
                      title: 'E-posta',
                      content: email,
                      iconColor: const Color(0xFF0A84FF),
                      onTap: () => _launchUri(Uri.parse('mailto:$email')),
                    ),
                  ],
                  if (phone.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _buildInfoCard(
                      icon: Icons.phone,
                      title: 'Telefon',
                      content: phone,
                      iconColor: const Color(0xFF34C759),
                      onTap: () => _launchUri(Uri(scheme: 'tel', path: phone)),
                    ),
                  ],
                  if (createdAt != null) ...[
                    const SizedBox(height: 12),
                    _buildInfoCard(
                      icon: Icons.schedule,
                      title: 'Talep Olusturma Zamani',
                      content: DateFormat('dd.MM.yyyy HH:mm').format(createdAt),
                      iconColor: const Color(0xFF8E8E93),
                    ),
                  ],
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: const Color(0xFF2C2C2E), borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(color: const Color(0xFFAF52DE).withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
                              child: const Icon(Icons.notes, color: Color(0xFFAF52DE), size: 20),
                            ),
                            const SizedBox(width: 12),
                            Text('Gorusme Notu', style: AppFonts.baseBold.copyWith(fontSize: 16, color: Colors.white)),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(note, style: AppFonts.baseRegular.copyWith(fontSize: 15, color: Colors.grey[300], height: 1.5)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
          /* Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2E),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 20,
                  offset: const Offset(0, -5),
                ),
              ],
            ), */
          /* child: SafeArea(
              top: false,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: _buildActionButton(
                      context: context,
                      icon: Icons.check_circle,
                      text: 'Onayla',
                      color: const Color(0xFF34C759),
                      onTap: () {
                        _showSuccessDialog(context, 'Gorusme onaylandi.');
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
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
          ), */
        ],
      ),
    );
  }

  Widget _buildProfileAvatar(String requesterName) {
    final photoUrl = appointment.employee?.photo?.originalUrl?.trim() ?? '';
    if (photoUrl.isNotEmpty) {
      return ClipOval(
        child: Image.network(photoUrl, width: 80, height: 80, fit: BoxFit.cover, errorBuilder: (_, __, ___) => _buildInitialAvatar(requesterName)),
      );
    }

    return _buildInitialAvatar(requesterName);
  }

  Widget _buildInitialAvatar(String requesterName) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(color: Color(0xFF0A84FF), shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text(_initials(requesterName), style: AppFonts.baseBold.copyWith(fontSize: 28, color: Colors.white)),
    );
  }

  Widget _buildInfoCard({required IconData icon, required String title, required String content, required Color iconColor, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: const Color(0xFF2C2C2E), borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.2), borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppFonts.baseRegular.copyWith(fontSize: 13, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Text(content, style: AppFonts.baseSemibold.copyWith(fontSize: 15, color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({required BuildContext context, required IconData icon, required String text, required Color color, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 24),
            const SizedBox(height: 4),
            Text(text, style: AppFonts.baseBold.copyWith(fontSize: 12, color: Colors.white)),
          ],
        ),
      ),
    );
  }

  DateTime? _appointmentDateTime(String? raw) {
    final value = raw?.trim();
    if (value == null || value.isEmpty) return null;

    final parsed = DateTime.tryParse(value) ?? DateTime.tryParse(value.replaceFirst(' ', 'T'));
    if (parsed != null) {
      return parsed;
    }

    for (final pattern in const [
      'yyyy-MM-dd HH:mm:ss',
      'yyyy-MM-dd HH:mm',
      'yyyy-MM-dd',
      'dd-MM-yyyy HH:mm:ss',
      'dd-MM-yyyy HH:mm',
      'dd-MM-yyyy',
      'dd.MM.yyyy HH:mm',
      'dd.MM.yyyy',
    ]) {
      try {
        return DateFormat(pattern).parseStrict(value);
      } catch (_) {}
    }

    return null;
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'Tarih belirtilmedi';
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = _monthNames[dateTime.month];
    final time = DateFormat('HH:mm').format(dateTime);
    return '$day $month ${dateTime.year}, $time';
  }

  String _statusLabel(String? status) {
    final normalized = status?.trim().toLowerCase() ?? '';
    switch (normalized) {
      case 'approved':
        return 'Onaylandi';
      case 'pending':
        return 'Bekliyor';
      case 'rejected':
        return 'Reddedildi';
      default:
        return status?.trim().isNotEmpty == true ? status!.trim() : 'Belirsiz';
    }
  }

  Color _statusColor(String? status) {
    final normalized = status?.trim().toLowerCase() ?? '';
    switch (normalized) {
      case 'approved':
        return const Color(0xFF34C759);
      case 'pending':
        return const Color(0xFFFF9500);
      case 'rejected':
        return const Color(0xFFFF453A);
      default:
        return const Color(0xFF8E8E93);
    }
  }

  String _initials(String value) {
    final parts = value.trim().split(RegExp(r'\s+')).where((part) => part.isNotEmpty).toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  Future<void> _launchUri(Uri uri) async {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
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
            child: Text('Tamam', style: AppFonts.baseBold.copyWith(fontSize: 16, color: const Color(0xFF0A84FF))),
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
        title: Text('Revize Tarihi Oner', style: AppFonts.baseBold.copyWith(fontSize: 20, color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Yeni bir tarih ve saat onerisi gondermek ister misiniz?', style: AppFonts.baseRegular.copyWith(fontSize: 15, color: Colors.grey[300])),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData.dark().copyWith(
                        colorScheme: const ColorScheme.dark(primary: Color(0xFFFF9500), surface: Color(0xFF2C2C2E)),
                      ),
                      child: child!,
                    );
                  },
                );
                if (date != null && context.mounted) {
                  Navigator.pop(context);
                  _showSuccessDialog(context, 'Revize onerisi gonderildi.');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF9500),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text('Tarih Sec', style: AppFonts.baseBold.copyWith(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Iptal', style: AppFonts.baseBold.copyWith(fontSize: 16, color: Colors.grey)),
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
        title: Text('Gorusmeyi Reddet', style: AppFonts.baseBold.copyWith(fontSize: 20, color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Bu gorusme talebini reddetmek istediginize emin misiniz?', style: AppFonts.baseRegular.copyWith(fontSize: 15, color: Colors.grey[300])),
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
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Iptal', style: AppFonts.baseBold.copyWith(fontSize: 16, color: Colors.grey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSuccessDialog(context, 'Gorusme reddedildi.');
            },
            child: Text('Reddet', style: AppFonts.baseBold.copyWith(fontSize: 16, color: const Color(0xFFFF3B30))),
          ),
        ],
      ),
    );
  }
}
