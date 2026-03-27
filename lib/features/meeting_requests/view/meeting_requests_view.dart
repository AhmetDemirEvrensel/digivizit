import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/models/appointment/appointment_response.dart'
    as appointment_model;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'meeting_request_detail_view.dart';

class MeetingRequestsView extends StatefulWidget {
  final appointment_model.AppointmentResponse appointmentsResponse;

  const MeetingRequestsView({super.key, required this.appointmentsResponse});

  @override
  State<MeetingRequestsView> createState() => _MeetingRequestsViewState();
}

class _MeetingRequestsViewState extends State<MeetingRequestsView> {
  static const List<String> _weekDays = ['P', 'S', 'C', 'P', 'C', 'C', 'P'];
  static const int _initialMonthPage = 1200;

  final DateTime _baseMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
  );

  late final PageController _monthPageController;
  late DateTime selectedDate;
  late DateTime _visibleMonth;
  bool _isMonthExpanded = false;

  List<appointment_model.Datum> get _appointments =>
      widget.appointmentsResponse.data ?? const [];

  @override
  void initState() {
    super.initState();
    selectedDate = _dateOnly(DateTime.now());
    _visibleMonth = DateTime(selectedDate.year, selectedDate.month);
    _monthPageController = PageController(
      initialPage: _pageForMonth(_visibleMonth),
    );
  }

  @override
  void dispose() {
    _monthPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredAppointments =
        _appointments.where((appointment) {
          final appointmentDate = _appointmentDate(appointment);
          return appointmentDate != null &&
              _isSameDay(appointmentDate, selectedDate);
        }).toList()..sort((a, b) {
          final first =
              _appointmentDateTime(a) ?? DateTime.fromMillisecondsSinceEpoch(0);
          final second =
              _appointmentDateTime(b) ?? DateTime.fromMillisecondsSinceEpoch(0);
          return first.compareTo(second);
        });

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
          'Gorusme Talepleri',
          style: AppFonts.baseBold.copyWith(fontSize: 20, color: Colors.white),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          _buildCalendarView(),
          Expanded(
            child: Container(
              color: const Color(0xFF1C1C1E),
              child: filteredAppointments.isEmpty
                  ? _buildEmptyState()
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: filteredAppointments.length,
                      itemBuilder: (context, index) {
                        return _buildMeetingRequestCard(
                          filteredAppointments[index],
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
      decoration: const BoxDecoration(color: Color(0xFF1C1C1E)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.calendar_today,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${_getMonthName(_visibleMonth.month)} ${_visibleMonth.year}',
                style: AppFonts.baseBold.copyWith(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  _isMonthExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: Colors.white,
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
            Icon(
              Icons.event_busy,
              size: 48,
              color: Colors.white.withValues(alpha: 0.45),
            ),
            const SizedBox(height: 16),
            Text(
              'Secili tarihte gorusme talebi yok.',
              textAlign: TextAlign.center,
              style: AppFonts.baseSemibold.copyWith(
                fontSize: 16,
                color: Colors.white.withValues(alpha: 0.72),
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

  DateTime _startOfWeek(DateTime date) =>
      _dateOnly(date).subtract(Duration(days: date.weekday - 1));

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  DateTime? _appointmentDateTime(appointment_model.Datum appointment) {
    final raw = appointment.preferredDate?.trim();
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

  DateTime? _appointmentDate(appointment_model.Datum appointment) {
    final parsed = _appointmentDateTime(appointment);
    return parsed == null ? null : _dateOnly(parsed);
  }

  bool _hasMeeting(DateTime day) {
    return _appointments.any((appointment) {
      final appointmentDate = _appointmentDate(appointment);
      return appointmentDate != null && _isSameDay(appointmentDate, day);
    });
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

  Widget _buildWeekView() {
    final today = _dateOnly(DateTime.now());
    final startOfWeek = _startOfWeek(selectedDate);

    return Row(
      key: const ValueKey('week-view'),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(7, (index) {
        final day = startOfWeek.add(Duration(days: index));
        final isToday = _isSameDay(day, today);
        final isSelected = _isSameDay(day, selectedDate);
        final hasMeeting = _hasMeeting(day);

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedDate = day;
              _visibleMonth = DateTime(day.year, day.month);
            });
          },
          child: Column(
            children: [
              Text(
                _weekDays[index],
                style: AppFonts.baseRegular.copyWith(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF0A84FF)
                      : (isToday
                            ? Colors.white.withValues(alpha: 0.08)
                            : (hasMeeting ? Colors.red : Colors.transparent)),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: AppFonts.baseBold.copyWith(
                      fontSize: 16,
                      color: (isSelected || isToday || hasMeeting)
                          ? Colors.white
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
              if (hasMeeting && !isSelected)
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
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
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 292,
          child: PageView.builder(
            controller: _monthPageController,
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

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: 42,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 10,
        crossAxisSpacing: 8,
      ),
      itemBuilder: (context, index) {
        final day = firstVisibleDay.add(Duration(days: index));
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF0A84FF)
                      : (isToday
                            ? Colors.white.withValues(alpha: 0.08)
                            : Colors.transparent),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    '${day.day}',
                    style: AppFonts.baseBold.copyWith(
                      fontSize: 14,
                      color: isCurrentMonth
                          ? Colors.white
                          : Colors.grey.withValues(alpha: 0.4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              if (hasMeeting)
                Container(
                  width: 4,
                  height: 4,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.white : Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMeetingRequestCard(appointment_model.Datum appointment) {
    final appointmentDateTime = _appointmentDateTime(appointment);
    final requesterName = appointment.fullName?.trim().isNotEmpty == true
        ? appointment.fullName!.trim()
        : 'Isimsiz Talep';
    final company = appointment.company?.trim().isNotEmpty == true
        ? appointment.company!.trim()
        : 'Sirket belirtilmedi';
    final subject = appointment.subject?.trim().isNotEmpty == true
        ? appointment.subject!.trim()
        : 'Gorusme Talebi';
    final department = appointment.employee?.department?.name?.trim() ?? '';
    final statusText = _statusLabel(appointment.status);
    final statusColor = _statusColor(appointment.status);

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                MeetingRequestDetailView(appointment: appointment),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF2C2C2E),
          border: Border(
            bottom: BorderSide(
              color: Colors.white.withValues(alpha: 0.1),
              width: 0.5,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 56,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _formatTime(appointmentDateTime),
                      style: AppFonts.baseRegular.copyWith(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      _formatDate(appointmentDateTime),
                      style: AppFonts.baseRegular.copyWith(
                        fontSize: 11,
                        color: Colors.grey.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 3,
                height: 56,
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha: 0.18),
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            _initials(requesterName),
                            style: AppFonts.baseBold.copyWith(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                subject,
                                style: AppFonts.baseBold.copyWith(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                requesterName,
                                style: AppFonts.baseSemibold.copyWith(
                                  fontSize: 13,
                                  color: Colors.white.withValues(alpha: 0.8),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                company,
                                style: AppFonts.baseRegular.copyWith(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (department.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          department,
                          style: AppFonts.baseRegular.copyWith(
                            fontSize: 11,
                            color: Colors.white.withValues(alpha: 0.75),
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        statusText,
                        style: AppFonts.baseBold.copyWith(
                          fontSize: 11,
                          color: statusColor,
                        ),
                      ),
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
}
