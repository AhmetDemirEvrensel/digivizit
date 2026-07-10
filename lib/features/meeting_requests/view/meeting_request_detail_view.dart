import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/appointment/appointment_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/shared/components/bottom_sheet/custom_bottom_sheet_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class MeetingRequestDetailView extends StatefulWidget {
  final AppointmentListItem appointment;
  final Future<bool> Function(int id)? onApprove;
  final Future<bool> Function(int id)? onReject;

  const MeetingRequestDetailView({
    super.key,
    required this.appointment,
    this.onApprove,
    this.onReject,
  });

  @override
  State<MeetingRequestDetailView> createState() =>
      _MeetingRequestDetailViewState();
}

class _MeetingRequestDetailViewState extends State<MeetingRequestDetailView> {
  late AppointmentListItem appointment;
  bool _isSubmitting = false;

  @override
  void initState() {
    super.initState();
    appointment = widget.appointment;
    _loadAppointmentDetail();
  }

  Future<void> _loadAppointmentDetail() async {
    final id = appointment.id;
    if (id == null) return;

    final result = await AppSettings.instance.generalService
        .getAppointmentRequest(id: id, showLoader: false);
    if (!mounted || !result.isSuccess || result.data?.data == null) return;

    final detail = result.data!.data!;
    setState(() {
      appointment = detail.copyWith(
        email: detail.email ?? appointment.email,
        phone: detail.phone ?? appointment.phone,
      );
    });
  }

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

  @override
  Widget build(BuildContext context) {
    final profileData = AppSettings.instance.profile?.data;
    final requesterName = appointment.fullName?.trim().isNotEmpty == true
        ? appointment.fullName!.trim()
        : 'Isimsiz Talep';
    final company = appointment.company?.trim().isNotEmpty == true
        ? appointment.company!.trim()
        : 'Sirket belirtilmedi';
    final title = profileData?.title?.trim().isNotEmpty == true
        ? profileData!.title!.trim()
        : (profileData?.department?.name?.trim().isNotEmpty == true
              ? profileData!.department!.name!.trim()
              : 'Unvan belirtilmedi');
    final statusText = _statusLabel(
      appointment.status,
      appointment.statusLabel,
    );
    final statusColor = _statusColor(appointment.status);
    final appointmentDateTime = _appointmentDateTime(appointment.preferredDate);
    final createdAt = _appointmentDateTime(appointment.createdAt);
    final note = appointment.note?.trim().isNotEmpty == true
        ? appointment.note!.trim()
        : 'Talep notu bulunmuyor.';
    final subject = appointment.subject?.trim().isNotEmpty == true
        ? appointment.subject!.trim()
        : 'Gorusme Talebi';
    final email = appointment.email?.trim() ?? '';
    final phone = appointment.phone?.trim() ?? '';
    final department = profileData?.department?.name?.trim() ?? '';
    final timeTone = _meetingVisualTone(appointmentDateTime);
    final photoUrl = profileData?.photoUrl?.trim() ?? '';
    final canRespond =
        (appointment.status?.trim().toLowerCase() == 'talep edildi');

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Görüşme Talebi Detayı',
          style: AppFonts.xlBold.withColor(AppColors.ink),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.lerp(timeTone.cardColor, AppColors.surface, 0.65)!,
              AppColors.surface,
              AppColors.baseWhite,
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
                photoUrl: photoUrl,
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
                      label: 'Toplantı Saati',
                      value: _formatTime(appointmentDateTime),
                      accentColor: timeTone.accentColor,
                      backgroundColor: timeTone.panelColor,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildStatCard(
                      icon: Icons.calendar_month_rounded,
                      label: 'Toplantı Günü',
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
                  title: 'Talep Oluşturma Zamanı',
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
                  onTap: () => _sendEmail(email),
                ),
              ],
              if (phone.isNotEmpty) ...[
                const SizedBox(height: 12),
                _buildSectionCard(
                  icon: Icons.phone_rounded,
                  title: 'Telefon',
                  content: phone,
                  accentColor: const Color(0xFF34C759),
                  onTap: () => _callPhone(phone),
                ),
              ],
              const SizedBox(height: 12),
              _buildNoteCard(note: note, timeTone: timeTone),
              if (canRespond &&
                  (widget.onApprove != null || widget.onReject != null)) ...[
                const SizedBox(height: 20),
                _buildResponseActions(),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResponseActions() {
    return Row(
      children: [
        if (widget.onReject != null)
          Expanded(
            child: _buildResponseButton(
              label: 'Reddet',
              icon: Icons.close_rounded,
              color: const Color(0xFFFF453A),
              onTap: () => _respond(isApprove: false),
            ),
          ),
        if (widget.onReject != null && widget.onApprove != null)
          const SizedBox(width: 12),
        if (widget.onApprove != null)
          Expanded(
            child: _buildResponseButton(
              label: 'Onayla',
              icon: Icons.check_rounded,
              color: const Color(0xFF34C759),
              onTap: () => _respond(isApprove: true),
            ),
          ),
      ],
    );
  }

  Widget _buildResponseButton({
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: _isSubmitting ? null : onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.16),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withValues(alpha: 0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isSubmitting)
              SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2, color: color),
              )
            else
              Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: AppFonts.baseBold.copyWith(fontSize: 15, color: color),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _respond({required bool isApprove}) async {
    final id = appointment.id;
    if (id == null || _isSubmitting) return;

    setState(() => _isSubmitting = true);

    final callback = isApprove ? widget.onApprove : widget.onReject;
    final success = await callback!(id);

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    if (success) {
      setState(() {
        appointment = appointment.copyWith(
          status: isApprove ? 'planlandı' : 'reddedildi',
          statusLabel: isApprove ? 'Planlandı' : 'Reddedildi',
        );
      });
    } else {
      CustomBottomSheet.errorView(
        text: isApprove ? 'Talep onaylanamadi.' : 'Talep reddedilemedi.',
      );
    }
  }

  Widget _buildHeroCard({
    required String requesterName,
    required String title,
    required String company,
    required String department,
    required String email,
    required String phone,
    required String photoUrl,
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
          colors: [AppColors.baseWhite, AppColors.baseWhite],
        ),
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.hairline),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.06),
            blurRadius: 20,
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
                  color: AppColors.secondary600,
                  backgroundColor: AppColors.surfaceAlt,
                ),
            ],
          ),
          const SizedBox(height: 18),
          Center(child: _buildProfileAvatar(requesterName, photoUrl, timeTone)),
          const SizedBox(height: 16),
          Text(
            requesterName,
            textAlign: TextAlign.center,
            style: AppFonts.baseBold.copyWith(
              fontSize: 24,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppFonts.baseRegular.copyWith(
              fontSize: 16,
              color: AppColors.inkSoft,
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
                      onTap: () => _sendEmail(email),
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
                      onTap: () => _callPhone(phone),
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
    String photoUrl,
    _MeetingVisualTone timeTone,
  ) {
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
        style: AppFonts.baseBold.copyWith(
          fontSize: 30,
          color: AppColors.baseWhite,
        ),
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
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.hairline),
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
                color: AppColors.ink,
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
              color: AppColors.inkSoft,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: AppFonts.baseBold.copyWith(
              fontSize: 15,
              color: AppColors.ink,
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
          color: AppColors.baseWhite,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.hairline),
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
                      color: AppColors.inkSoft,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    content,
                    style: AppFonts.baseSemibold.copyWith(
                      fontSize: 15,
                      color: AppColors.ink,
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
                color: const Color(0xFFCBD5E1),
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
            Color.lerp(timeTone.panelColor, AppColors.baseWhite, 0.45)!,
            AppColors.baseWhite,
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
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Text(
            note,
            style: AppFonts.baseRegular.copyWith(
              fontSize: 15,
              color: const Color(0xFF475569),
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
          accentColor: Color(0xFFE11D48),
          cardColor: Color(0xFFFFF1F2),
          panelColor: Color(0xFFFFE4E6),
          borderColor: Color(0xFFFECDD3),
          softColor: Color(0x26E11D48),
        );
      case _MeetingTimeState.today:
        return const _MeetingVisualTone(
          label: 'Bugun',
          icon: Icons.flash_on_rounded,
          accentColor: Color(0xFF0284C7),
          cardColor: Color(0xFFF0F9FF),
          panelColor: Color(0xFFE0F2FE),
          borderColor: Color(0xFFBAE6FD),
          softColor: Color(0x260284C7),
        );
      case _MeetingTimeState.upcoming:
        return const _MeetingVisualTone(
          label: 'Planli',
          icon: Icons.schedule_rounded,
          accentColor: Color(0xFFD97706),
          cardColor: Color(0xFFFFFBEB),
          panelColor: Color(0xFFFEF3C7),
          borderColor: Color(0xFFFDE68A),
          softColor: Color(0x26D97706),
        );
      case _MeetingTimeState.unknown:
        return const _MeetingVisualTone(
          label: 'Belirsiz',
          icon: Icons.help_outline_rounded,
          accentColor: Color(0xFF64748B),
          cardColor: Color(0xFFF8FAFC),
          panelColor: Color(0xFFF1F5F9),
          borderColor: Color(0xFFE2E8F0),
          softColor: Color(0x1F64748B),
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

  String _statusLabel(String? status, String? statusLabel) {
    if (statusLabel?.trim().isNotEmpty ?? false) {
      return statusLabel!.trim();
    }
    return status?.trim().isNotEmpty == true ? status!.trim() : 'Belirsiz';
  }

  Color _statusColor(String? status) {
    final normalized = status?.trim().toLowerCase() ?? '';
    switch (normalized) {
      case 'planlandı':
      case 'planlandi':
        return const Color(0xFF34C759);
      case 'talep edildi':
        return const Color(0xFFFF9500);
      case 'reddedildi':
      case 'iptal edildi':
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

  Future<void> _sendEmail(String email) async {
    final normalizedEmail = email.trim();
    if (normalizedEmail.isEmpty) return;

    await _launchContactUri(
      Uri(scheme: 'mailto', path: normalizedEmail),
      errorMessage: 'E-posta uygulaması açılamadı.',
    );
  }

  Future<void> _callPhone(String phone) async {
    final normalizedPhone = phone.replaceAll(RegExp(r'[^0-9+]'), '');
    if (normalizedPhone.isEmpty) return;

    await _launchContactUri(
      Uri(scheme: 'tel', path: normalizedPhone),
      errorMessage: 'Telefon uygulaması açılamadı.',
    );
  }

  Future<void> _launchContactUri(
    Uri uri, {
    required String errorMessage,
  }) async {
    try {
      final didLaunch = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (didLaunch) return;
    } catch (_) {
      // Platform uygulamayı açamazsa kullanıcıya aşağıda bilgi verilir.
    }

    CustomBottomSheet.errorView(text: errorMessage);
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
