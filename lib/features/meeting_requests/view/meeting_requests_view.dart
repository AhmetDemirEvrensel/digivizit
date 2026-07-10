import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/appointment/appointment_response.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/features/meeting_requests/view_model/meeting_request_view_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'meeting_request_detail_view.dart';

class MeetingRequestsView extends StatefulWidget {
  final AppointmentListResponse appointmentsResponse;

  const MeetingRequestsView({super.key, required this.appointmentsResponse});

  @override
  State<MeetingRequestsView> createState() => _MeetingRequestsViewState();
}

class _MeetingRequestsViewState extends State<MeetingRequestsView> {
  static const List<String> _weekDays = ['P', 'S', 'C', 'P', 'C', 'C', 'P'];
  static const int _initialMonthPage = 1200;
  static const double _weekDayCellHeight = 84;
  static const double _monthRowSpacing = 8;
  static const double _monthColumnSpacing = 8;
  static const double _monthDayCellHeight = 48;
  static const double _monthDayCircleSize = 38;
  static const double _meetingMarkerSize = 6;

  final DateTime _baseMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
  );

  late final PageController _monthPageController;
  late DateTime selectedDate;
  late DateTime _visibleMonth;
  late Map<int, List<_AppointmentCalendarEntry>> _appointmentsByDayKey;
  late Set<int> _meetingDayKeys;
  bool _isMonthExpanded = false;
  final MeetingRequestViewModel _viewModel = MeetingRequestViewModel();

  List<AppointmentListItem> get _appointments =>
      _viewModel.appointments?.data?.items ?? const [];

  @override
  void initState() {
    super.initState();
    _viewModel.appointments = widget.appointmentsResponse;
    selectedDate = _dateOnly(DateTime.now());
    _visibleMonth = DateTime(selectedDate.year, selectedDate.month);
    _rebuildAppointmentCache();
    _monthPageController = PageController(
      initialPage: _pageForMonth(_visibleMonth),
    );
  }

  @override
  void didUpdateWidget(covariant MeetingRequestsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.appointmentsResponse != widget.appointmentsResponse) {
      _viewModel.appointments = widget.appointmentsResponse;
      _rebuildAppointmentCache();
    }
  }

  Future<bool> _handleApprove(int id) async {
    final result = await _viewModel.approveAppointment(id);
    if (result.isSuccess && mounted) {
      setState(_rebuildAppointmentCache);
    }
    return result.isSuccess;
  }

  Future<bool> _handleReject(int id) async {
    final result = await _viewModel.rejectAppointment(id);
    if (result.isSuccess && mounted) {
      setState(_rebuildAppointmentCache);
    }
    return result.isSuccess;
  }

  @override
  void dispose() {
    _monthPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredAppointments =
        _appointmentsByDayKey[_dayKey(selectedDate)] ??
        const <_AppointmentCalendarEntry>[];

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Görüşme Talepleri',
          style: AppFonts.xlBold.withColor(AppColors.ink),
        ),
      ),
      body: Column(
        children: [
          _buildCalendarView(),
          Expanded(
            child: Container(
              color: AppColors.surface,
              child: filteredAppointments.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount:
                          filteredAppointments.length +
                          (_viewModel.hasMoreAppointments ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index >= filteredAppointments.length) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Center(
                              child: _viewModel.isLoadingMoreAppointments
                                  ? const CircularProgressIndicator(
                                      strokeWidth: 2,
                                    )
                                  : TextButton(
                                      onPressed: () async {
                                        await _viewModel.loadMoreAppointments();
                                        if (mounted) {
                                          setState(_rebuildAppointmentCache);
                                        }
                                      },
                                      child: const Text('Daha fazla yükle'),
                                    ),
                            ),
                          );
                        }

                        return _buildMeetingRequestCard(
                          filteredAppointments[index].appointment,
                          appointmentDateTime:
                              filteredAppointments[index].dateTime,
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarView() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
        border: const Border(bottom: BorderSide(color: AppColors.hairline)),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary500.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.calendar_today,
                  color: AppColors.primary600,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${_getMonthName(_visibleMonth.month)} ${_visibleMonth.year}',
                style: AppFonts.baseBold.copyWith(
                  fontSize: 24,
                  color: AppColors.ink,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  _isMonthExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: AppColors.ink,
                ),
                onPressed: _toggleCalendarMode,
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onVerticalDragEnd: _handleCalendarDragEnd,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              child: _isMonthExpanded ? _buildMonthView() : _buildWeekView(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.event_busy_rounded,
              size: 48,
              color: AppColors.inkFaint,
            ),
            const SizedBox(height: 16),
            Text(
              'Seçili tarihte görüşme talebi yok.',
              textAlign: TextAlign.center,
              style: AppFonts.baseSemibold.copyWith(
                fontSize: 16,
                color: AppColors.inkSoft,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
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
    return months[month];
  }

  void _toggleCalendarMode() {
    setState(() {
      _isMonthExpanded = !_isMonthExpanded;
    });

    if (_isMonthExpanded && _monthPageController.hasClients) {
      _monthPageController.animateToPage(
        _pageForMonth(_visibleMonth),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  void _handleCalendarDragEnd(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;
    if (velocity > 200 && !_isMonthExpanded) {
      _toggleCalendarMode();
    } else if (velocity < -200 && _isMonthExpanded) {
      _toggleCalendarMode();
    }
  }

  DateTime _dateOnly(DateTime date) =>
      DateTime(date.year, date.month, date.day);

  int _dayKey(DateTime date) =>
      (date.year * 10000) + (date.month * 100) + date.day;

  DateTime _startOfWeek(DateTime date) =>
      _dateOnly(date).subtract(Duration(days: date.weekday - 1));

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  DateTime? _parseAppointmentDateTime(String? rawValue) {
    final raw = rawValue?.trim();
    if (raw == null || raw.isEmpty) return null;

    final parsed =
        DateTime.tryParse(raw) ?? DateTime.tryParse(raw.replaceFirst(' ', 'T'));
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
        return DateFormat(pattern).parseStrict(raw);
      } catch (_) {}
    }

    return null;
  }

  bool _hasMeeting(DateTime day) {
    return _meetingDayKeys.contains(_dayKey(day));
  }

  void _rebuildAppointmentCache() {
    final indexedAppointments = <int, List<_AppointmentCalendarEntry>>{};

    for (final appointment in _appointments) {
      final dateTime = _parseAppointmentDateTime(appointment.preferredDate);
      if (dateTime == null) continue;

      final normalizedDate = _dateOnly(dateTime);
      final dayKey = _dayKey(normalizedDate);

      indexedAppointments
          .putIfAbsent(dayKey, () => [])
          .add(
            _AppointmentCalendarEntry(
              appointment: appointment,
              dateTime: dateTime,
              dayKey: dayKey,
            ),
          );
    }

    for (final entries in indexedAppointments.values) {
      entries.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    }

    _appointmentsByDayKey = indexedAppointments;
    _meetingDayKeys = indexedAppointments.keys.toSet();
  }

  DateTime _monthForPage(int page) {
    final monthOffset = page - _initialMonthPage;
    return DateTime(_baseMonth.year, _baseMonth.month + monthOffset);
  }

  int _pageForMonth(DateTime month) {
    return _initialMonthPage +
        ((month.year - _baseMonth.year) * 12) +
        (month.month - _baseMonth.month);
  }

  String _formatTime(DateTime? dateTime) {
    if (dateTime == null) return '--:--';
    return DateFormat('HH:mm').format(dateTime);
  }

  String _formatDate(DateTime? dateTime) {
    if (dateTime == null) return 'Tarih belirtilmedi';
    return '${dateTime.day.toString().padLeft(2, '0')} ${_getMonthName(dateTime.month)} ${dateTime.year}';
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

  _MeetingTimeState _meetingTimeState(DateTime? appointmentDateTime) {
    if (appointmentDateTime == null) {
      return _MeetingTimeState.unknown;
    }

    final now = DateTime.now();
    final today = _dateOnly(now);
    final meetingDay = _dateOnly(appointmentDateTime);

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
          label: 'Geçmiş',
          icon: Icons.history_toggle_off_rounded,
          accentColor: Color(0xFFE11D48),
          cardColor: Color(0xFFFFF1F2),
          panelColor: Color(0xFFFFE4E6),
          borderColor: Color(0xFFFECDD3),
          softColor: Color(0x26E11D48),
        );
      case _MeetingTimeState.today:
        return const _MeetingVisualTone(
          label: 'Bugün',
          icon: Icons.flash_on_rounded,
          accentColor: Color(0xFF0284C7),
          cardColor: Color(0xFFF0F9FF),
          panelColor: Color(0xFFE0F2FE),
          borderColor: Color(0xFFBAE6FD),
          softColor: Color(0x260284C7),
        );
      case _MeetingTimeState.upcoming:
        return const _MeetingVisualTone(
          label: 'Planlı',
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

  Widget _buildWeekView() {
    final today = _dateOnly(DateTime.now());
    final startOfWeek = _startOfWeek(selectedDate);

    return Row(
      key: const ValueKey('week-view'),
      children: List.generate(7, (index) {
        final day = startOfWeek.add(Duration(days: index));
        final isToday = _isSameDay(day, today);
        final isSelected = _isSameDay(day, selectedDate);
        final hasMeeting = _hasMeeting(day);

        return Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = day;
                _visibleMonth = DateTime(day.year, day.month);
              });
            },
            child: SizedBox(
              height: _weekDayCellHeight,
              child: Column(
                children: [
                  Text(
                    _weekDays[index],
                    style: AppFonts.baseRegular.copyWith(
                      fontSize: 12,
                      color: AppColors.inkFaint,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary500
                          : (isToday
                                ? AppColors.hairline
                                : (hasMeeting
                                      ? const Color(0xFFFECDD3)
                                      : Colors.transparent)),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: Center(
                      child: Text(
                        '${day.day}',
                        style: AppFonts.baseBold.copyWith(
                          fontSize: 16,
                          color: isSelected
                              ? AppColors.baseWhite
                              : AppColors.ink,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    height: _meetingMarkerSize,
                    child: hasMeeting && !isSelected
                        ? Container(
                            width: _meetingMarkerSize,
                            height: _meetingMarkerSize,
                            decoration: const BoxDecoration(
                              color: Color(0xFFE11D48),
                              shape: BoxShape.circle,
                            ),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildMonthView() {
    return Column(
      key: const ValueKey('month-view'),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _weekDays
              .map(
                (day) => Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: AppFonts.baseRegular.copyWith(
                        fontSize: 12,
                        color: AppColors.inkFaint,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: (_monthDayCellHeight * 6) + (_monthRowSpacing * 5),
          child: PageView.builder(
            controller: _monthPageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (page) {
              setState(() {
                _visibleMonth = _monthForPage(page);
              });
            },
            itemBuilder: (context, page) {
              final month = _monthForPage(page);
              return _buildMonthPage(month);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMonthPage(DateTime month) {
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final firstVisibleDay = firstDayOfMonth.subtract(
      Duration(days: firstDayOfMonth.weekday - 1),
    );
    final today = _dateOnly(DateTime.now());

    return Column(
      children: List.generate(6, (rowIndex) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: rowIndex == 5 ? 0 : _monthRowSpacing,
          ),
          child: Row(
            children: List.generate(7, (columnIndex) {
              final index = (rowIndex * 7) + columnIndex;
              final day = firstVisibleDay.add(Duration(days: index));

              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: columnIndex == 6 ? 0 : _monthColumnSpacing,
                  ),
                  child: _buildMonthDayCell(
                    day: day,
                    month: month,
                    today: today,
                  ),
                ),
              );
            }),
          ),
        );
      }),
    );
  }

  Widget _buildMonthDayCell({
    required DateTime day,
    required DateTime month,
    required DateTime today,
  }) {
    final isCurrentMonth = day.month == month.month;
    final isSelected = _isSameDay(day, selectedDate);
    final isToday = _isSameDay(day, today);
    final hasMeeting = _hasMeeting(day);

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = day;
          _visibleMonth = DateTime(day.year, day.month);
          _isMonthExpanded = false;
        });

        if (_monthPageController.hasClients) {
          _monthPageController.jumpToPage(_pageForMonth(_visibleMonth));
        }
      },
      child: SizedBox(
        height: _monthDayCellHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: _monthDayCircleSize,
              height: _monthDayCircleSize,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary500
                    : (isToday ? AppColors.hairline : Colors.transparent),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '${day.day}',
                  style: AppFonts.baseBold.copyWith(
                    fontSize: 14,
                    color: isSelected
                        ? AppColors.baseWhite
                        : (isCurrentMonth
                              ? AppColors.ink
                              : AppColors.secondary300),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              height: _meetingMarkerSize,
              child: hasMeeting
                  ? Container(
                      width: _meetingMarkerSize,
                      height: _meetingMarkerSize,
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.baseWhite
                            : const Color(0xFFE11D48),
                        shape: BoxShape.circle,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMeetingRequestCard(
    AppointmentListItem appointment, {
    DateTime? appointmentDateTime,
  }) {
    final requesterName = appointment.fullName?.trim().isNotEmpty == true
        ? appointment.fullName!.trim()
        : 'İsimsiz Talep';
    final company = appointment.company?.trim().isNotEmpty == true
        ? appointment.company!.trim()
        : 'Şirket belirtilmedi';
    final subject = appointment.subject?.trim().isNotEmpty == true
        ? appointment.subject!.trim()
        : 'Görüşme Talebi';
    final department =
        AppSettings.instance.profile?.data?.department?.name?.trim() ?? '';
    final timeTone = _meetingVisualTone(appointmentDateTime);
    final statusText = _statusLabel(
      appointment.status,
      appointment.statusLabel,
    );
    final statusColor = _statusColor(appointment.status);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MeetingRequestDetailView(
              appointment: appointment,
              onApprove: _handleApprove,
              onReject: _handleReject,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.baseWhite,
          border: Border.all(color: AppColors.hairline),
          borderRadius: BorderRadius.circular(22),
          boxShadow: [
            BoxShadow(
              color: AppColors.ink.withValues(alpha: 0.05),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        margin: const EdgeInsets.fromLTRB(16, 12, 16, 0),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: timeTone.panelColor,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: timeTone.borderColor),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      _initials(requesterName),
                      style: AppFonts.baseBold.copyWith(
                        fontSize: 14,
                        color: timeTone.accentColor,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          subject,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.lgBold.copyWith(color: AppColors.ink),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          requesterName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.baseSemibold.copyWith(
                            color: AppColors.secondary600,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Text(
                          company,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.smRegular.copyWith(
                            color: AppColors.inkFaint,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                      color: AppColors.inkFaint,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  _buildMetaChip(
                    label: statusText,
                    color: statusColor,
                    backgroundColor: statusColor.withValues(alpha: 0.14),
                  ),
                  if (department.isNotEmpty)
                    _buildMetaChip(
                      label: department,
                      color: AppColors.secondary600,
                      backgroundColor: AppColors.surfaceAlt,
                      icon: Icons.business_center_outlined,
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 11,
                ),
                decoration: BoxDecoration(
                  color: AppColors.surfaceAlt,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.hairline),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: timeTone.panelColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.calendar_today_rounded,
                        size: 18,
                        color: timeTone.accentColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _formatDate(appointmentDateTime),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppFonts.baseSemibold.copyWith(
                          color: AppColors.ink,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          _formatTime(appointmentDateTime),
                          style: AppFonts.lgBold.copyWith(
                            color: timeTone.accentColor,
                          ),
                        ),
                        const SizedBox(height: 1),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              timeTone.icon,
                              size: 13,
                              color: timeTone.accentColor,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              timeTone.label,
                              style: AppFonts.xsSemibold.copyWith(
                                color: timeTone.accentColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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
}

class _AppointmentCalendarEntry {
  const _AppointmentCalendarEntry({
    required this.appointment,
    required this.dateTime,
    required this.dayKey,
  });

  final AppointmentListItem appointment;
  final DateTime dateTime;
  final int dayKey;
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
