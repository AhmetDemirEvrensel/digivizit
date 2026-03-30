import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/appointment/appointment_response.dart'
    as appointment_model;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MeetingRequestDetailView extends StatelessWidget {
  final appointment_model.Datum appointment;

  static const List<String> _monthNames = [
    '',
    'Ocak',
    'Subat',
    'Mart',
    'Nisan',
    'Mayis',
    'Haziran',
    'Temmuz',
    'Agustos',
    'Eylul',
    'Ekim',
    'Kasim',
    'Aralik',
  ];

  const MeetingRequestDetailView({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    final requesterName = appointment.fullName?.trim().isNotEmpty == true
        ? appointment.fullName!.trim()
        : 'Isimsiz Talep';
    final company = appointment.company?.trim().isNotEmpty == true
        ? appointment.company!.trim()
        : 'Sirket belirtilmedi';
    final title = appointment.employee?.title?.trim().isNotEmpty == true
        ? appointment.employee!.title!.trim()
        : (appointment.employee?.department?.name?.trim().isNotEmpty == true
              ? appointment.employee!.department!.name!.trim()
              : 'Unvan belirtilmedi');
    final statusText = _statusLabel(appointment.status);
    final statusColor = _statusColor(appointment.status);
    final appointmentDateTime = _appointmentDateTime(appointment.preferredDate);
    final createdAt = _appointmentDateTime(appointment.createdAt);
    final note = appointment.note?.trim().isNotEmpty == true
        ? appointment.note!.trim()
        : 'Talep notu bulunmuyor.';
    final subject = appointment.subject?.trim().isNotEmpty == true
        ? appointment.subject!.trim()
        : 'Gorusme Talebi';
    final email = appointment.employee?.email?.trim() ?? '';
    final phone = appointment.employee?.phone?.trim() ?? '';
    final department = appointment.employee?.department?.name?.trim() ?? '';
    final timeTone = _meetingVisualTone(appointmentDateTime);

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
          'Gorusme Talebi Detayi',
          style: AppFonts.baseBold.copyWith(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.lerp(timeTone.cardColor, const Color(0xFF1C1C1E), 0.12)!,
              const Color(0xFF1C1C1E),
              const Color(0xFF141416),
            ],
            stops: const [0, 0.38, 1],
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeroCard(
                requesterName: requesterName,
                title: title,
                company: company,
                department: department,
                email: email,
                phone: phone,
                statusText: statusText,
                statusColor: statusColor,
                timeTone: timeTone,
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.schedule_rounded,
                      label: 'Toplanti Saati',
                      value: _formatTime(appointmentDateTime),
                      accentColor: timeTone.accentColor,
                      backgroundColor: timeTone.panelColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.calendar_month_rounded,
                      label: 'Toplanti Gunu',
                      value: _formatDateOnly(appointmentDateTime),
                      accentColor: timeTone.accentColor,
                      backgroundColor: timeTone.panelColor,
                    ),
                  ),
                ],
              ),
              if (createdAt != null) ...[
                const SizedBox(height: 12),
                _buildSectionCard(
                  icon: Icons.history_rounded,
                  title: 'Talep Olusturma Zamani',
                  content: DateFormat('dd.MM.yyyy HH:mm').format(createdAt),
                  accentColor: const Color(0xFF8E8E93),
                ),
              ],
              const SizedBox(height: 12),
              _buildSectionCard(
                icon: Icons.topic_rounded,
                title: 'Konu',
                content: subject,
                accentColor: timeTone.accentColor,
              ),
              const SizedBox(height: 12),
              _buildSectionCard(
                icon: Icons.event_available_rounded,
                title: 'Talep Edilen Tarih ve Saat',
                content: _formatDateTime(appointmentDateTime),
                accentColor: const Color(0xFF5AC8FA),
              ),
              if (department.isNotEmpty) ...[
                const SizedBox(height: 12),
                _buildSectionCard(
                  icon: Icons.apartment_rounded,
                  title: 'Departman',
                  content: department,
                  accentColor: const Color(0xFFBF5AF2),
                ),
              ],
              if (email.isNotEmpty) ...[
                const SizedBox(height: 12),
                _buildSectionCard(
                  icon: Icons.email_rounded,
                  title: 'E-posta',
                  content: email,
                  accentColor: const Color(0xFF0A84FF),
                  onTap: () => _launchUri(Uri.parse('mailto:$email')),
                ),
              ],
              if (phone.isNotEmpty) ...[
                const SizedBox(height: 12),
                _buildSectionCard(
                  icon: Icons.phone_rounded,
                  title: 'Telefon',
                  content: phone,
                  accentColor: const Color(0xFF34C759),
                  onTap: () => _launchUri(Uri(scheme: 'tel', path: phone)),
                ),
              ],
              const SizedBox(height: 12),
              _buildNoteCard(note: note, timeTone: timeTone),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeroCard({
    required String requesterName,
    required String title,
    required String company,
    required String department,
    required String email,
    required String phone,
    required String statusText,
    required Color statusColor,
    required _MeetingVisualTone timeTone,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            timeTone.cardColor,
            Color.lerp(timeTone.cardColor, timeTone.panelColor, 0.82)!,
          ],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: timeTone.borderColor),
        boxShadow: [
          BoxShadow(
            color: timeTone.softColor,
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              _buildMetaChip(
                label: timeTone.label,
                color: timeTone.accentColor,
                backgroundColor: timeTone.panelColor,
                icon: timeTone.icon,
              ),
              _buildMetaChip(
                label: statusText,
                color: statusColor,
                backgroundColor: statusColor.withValues(alpha: 0.16),
              ),
              if (department.isNotEmpty)
                _buildMetaChip(
                  label: department,
                  color: Colors.white.withValues(alpha: 0.9),
                  backgroundColor: Colors.white.withValues(alpha: 0.08),
                ),
            ],
          ),
          const SizedBox(height: 18),
          Center(child: _buildProfileAvatar(requesterName, timeTone)),
          const SizedBox(height: 16),
          Text(
            requesterName,
            textAlign: TextAlign.center,
            style: AppFonts.baseBold.copyWith(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppFonts.baseRegular.copyWith(
              fontSize: 16,
              color: Colors.white.withValues(alpha: 0.72),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            company,
            textAlign: TextAlign.center,
            style: AppFonts.baseSemibold.copyWith(
              fontSize: 15,
              color: timeTone.accentColor,
            ),
          ),
          if (email.isNotEmpty || phone.isNotEmpty) ...[
            const SizedBox(height: 18),
            Row(
              children: [
                if (email.isNotEmpty)
                  Expanded(
                    child: _buildQuickActionButton(
                      icon: Icons.mail_outline_rounded,
                      label: 'E-posta',
                      color: const Color(0xFF0A84FF),
                      onTap: () => _launchUri(Uri.parse('mailto:$email')),
                    ),
                  ),
                if (email.isNotEmpty && phone.isNotEmpty)
                  const SizedBox(width: 12),
                if (phone.isNotEmpty)
                  Expanded(
                    child: _buildQuickActionButton(
                      icon: Icons.call_outlined,
                      label: 'Ara',
                      color: const Color(0xFF34C759),
                      onTap: () => _launchUri(Uri(scheme: 'tel', path: phone)),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildProfileAvatar(
    String requesterName,
    _MeetingVisualTone timeTone,
  ) {
    final photoUrl = appointment.employee?.photo?.originalUrl?.trim() ?? '';
    final avatar = photoUrl.isNotEmpty
        ? ClipOval(
            child: Image.network(
              photoUrl,
              width: 88,
              height: 88,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) =>
                  _buildInitialAvatar(requesterName, timeTone),
            ),
          )
        : _buildInitialAvatar(requesterName, timeTone);

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: timeTone.borderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: timeTone.softColor,
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: avatar,
    );
  }

  Widget _buildInitialAvatar(
    String requesterName,
    _MeetingVisualTone timeTone,
  ) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            timeTone.accentColor,
            Color.lerp(timeTone.accentColor, Colors.black, 0.2)!,
          ],
        ),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        _initials(requesterName),
        style: AppFonts.baseBold.copyWith(fontSize: 30, color: Colors.white),
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppFonts.baseSemibold.copyWith(
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String label,
    required String value,
    required Color accentColor,
    required Color backgroundColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: accentColor.withValues(alpha: 0.18)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: accentColor.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: accentColor, size: 18),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            style: AppFonts.baseRegular.copyWith(
              fontSize: 12,
              color: Colors.white.withValues(alpha: 0.68),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppFonts.baseBold.copyWith(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required IconData icon,
    required String title,
    required String content,
    required Color accentColor,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF252527),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon, color: accentColor, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFonts.baseRegular.copyWith(
                      fontSize: 13,
                      color: Colors.white.withValues(alpha: 0.62),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    content,
                    style: AppFonts.baseSemibold.copyWith(
                      fontSize: 15,
                      color: Colors.white,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            if (onTap != null) ...[
              const SizedBox(width: 8),
              Icon(
                Icons.open_in_new_rounded,
                color: Colors.white.withValues(alpha: 0.35),
                size: 18,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildNoteCard({
    required String note,
    required _MeetingVisualTone timeTone,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.lerp(timeTone.panelColor, const Color(0xFF252527), 0.5)!,
            const Color(0xFF252527),
          ],
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: timeTone.borderColor.withValues(alpha: 0.7)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: timeTone.softColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  Icons.notes_rounded,
                  color: timeTone.accentColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Gorusme Notu',
                style: AppFonts.baseBold.copyWith(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            note,
            style: AppFonts.baseRegular.copyWith(
              fontSize: 15,
              color: Colors.white.withValues(alpha: 0.78),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetaChip({
    required String label,
    required Color color,
    required Color backgroundColor,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 13, color: color),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: AppFonts.baseSemibold.copyWith(fontSize: 11, color: color),
          ),
        ],
      ),
    );
  }

  DateTime? _appointmentDateTime(String? raw) {
    final value = raw?.trim();
    if (value == null || value.isEmpty) return null;

    final parsed =
        DateTime.tryParse(value) ??
        DateTime.tryParse(value.replaceFirst(' ', 'T'));
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

  _MeetingTimeState _meetingTimeState(DateTime? appointmentDateTime) {
    if (appointmentDateTime == null) {
      return _MeetingTimeState.unknown;
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final meetingDay = DateTime(
      appointmentDateTime.year,
      appointmentDateTime.month,
      appointmentDateTime.day,
    );

    if (meetingDay.isBefore(today)) {
      return _MeetingTimeState.past;
    }

    if (meetingDay.isAfter(today)) {
      return _MeetingTimeState.upcoming;
    }

    if (appointmentDateTime.isBefore(now)) {
      return _MeetingTimeState.past;
    }

    return _MeetingTimeState.today;
  }

  _MeetingVisualTone _meetingVisualTone(DateTime? appointmentDateTime) {
    switch (_meetingTimeState(appointmentDateTime)) {
      case _MeetingTimeState.past:
        return const _MeetingVisualTone(
          label: 'Gecmis',
          icon: Icons.history_toggle_off_rounded,
          accentColor: Color(0xFFFF7B72),
          cardColor: Color(0xFF332428),
          panelColor: Color(0xFF442A31),
          borderColor: Color(0x66FF7B72),
          softColor: Color(0x29FF7B72),
        );
      case _MeetingTimeState.today:
        return const _MeetingVisualTone(
          label: 'Bugun',
          icon: Icons.flash_on_rounded,
          accentColor: Color(0xFF64D2FF),
          cardColor: Color(0xFF202F3A),
          panelColor: Color(0xFF233D4A),
          borderColor: Color(0x6664D2FF),
          softColor: Color(0x2964D2FF),
        );
      case _MeetingTimeState.upcoming:
        return const _MeetingVisualTone(
          label: 'Planli',
          icon: Icons.schedule_rounded,
          accentColor: Color(0xFFFFC857),
          cardColor: Color(0xFF342C1F),
          panelColor: Color(0xFF413421),
          borderColor: Color(0x66FFC857),
          softColor: Color(0x29FFC857),
        );
      case _MeetingTimeState.unknown:
        return const _MeetingVisualTone(
          label: 'Belirsiz',
          icon: Icons.help_outline_rounded,
          accentColor: Color(0xFF8E8E93),
          cardColor: Color(0xFF2C2C2E),
          panelColor: Color(0xFF343437),
          borderColor: Color(0x338E8E93),
          softColor: Color(0x1F8E8E93),
        );
    }
  }

  String _formatDateTime(DateTime? dateTime) {
    if (dateTime == null) return 'Tarih belirtilmedi';
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = _monthNames[dateTime.month];
    final time = DateFormat('HH:mm').format(dateTime);
    return '$day $month ${dateTime.year}, $time';
  }

  String _formatDateOnly(DateTime? dateTime) {
    if (dateTime == null) return 'Belirtilmedi';
    final day = dateTime.day.toString().padLeft(2, '0');
    final month = _monthNames[dateTime.month];
    return '$day $month';
  }

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return '--:--';
    return DateFormat('HH:mm').format(dateTime);
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
    final parts = value
        .trim()
        .split(RegExp(r'\s+'))
        .where((part) => part.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first[0].toUpperCase();
    return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
  }

  Future<void> _launchUri(Uri uri) async {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

enum _MeetingTimeState { past, today, upcoming, unknown }

class _MeetingVisualTone {
  const _MeetingVisualTone({
    required this.label,
    required this.icon,
    required this.accentColor,
    required this.cardColor,
    required this.panelColor,
    required this.borderColor,
    required this.softColor,
  });

  final String label;
  final IconData icon;
  final Color accentColor;
  final Color cardColor;
  final Color panelColor;
  final Color borderColor;
  final Color softColor;
}
