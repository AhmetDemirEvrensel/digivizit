import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/buttons/custom_app_button.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';

/// Tarih seçici modları
enum CustomDatePickerMode {
  /// Gün seçici (Saatlik ve Günlük periyotlar için)
  day,

  /// Hafta seçici (Haftalık periyot için)
  week,

  /// Ay seçici (Aylık periyot için)
  month,

  /// Yıl seçici (Yıllık periyot için)
  year,

  /// Saat seçici (Saat:Dakika - 5 dakika katları)
  time,
}

class CustomDatePicker {
  static Future<DateTime?> show({
    required BuildContext context,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String title = 'Tarih Seç',
    CustomDatePickerMode mode = CustomDatePickerMode.day,
  }) async {
    DateTime selectedDate = initialDate ?? DateTime.now();
    final first = firstDate ?? DateTime(2020);
    final last = lastDate ?? DateTime(2030);

    return await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withValues(alpha: 0.6),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
      builder: (context) => _DatePickerContent(title: title, initialDate: selectedDate, firstDate: first, lastDate: last, mode: mode),
    );
  }
}

class _DatePickerContent extends StatefulWidget {
  final String title;
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final CustomDatePickerMode mode;

  const _DatePickerContent({required this.title, required this.initialDate, required this.firstDate, required this.lastDate, required this.mode});

  @override
  State<_DatePickerContent> createState() => _DatePickerContentState();
}

class _DatePickerContentState extends State<_DatePickerContent> {
  late DateTime _selectedDate;
  late int _currentMonth;
  late int _currentYear;
  late int _selectedWeek;
  late int _selectedHour;
  late int _selectedMinute;

  // Animasyon yönü: true = sağa (önceki ay), false = sola (sonraki ay)
  bool _slideToRight = false;

  // Ay/Yıl seçici modları: 0 = takvim, 1 = ay seçici, 2 = yıl seçici
  int _pickerMode = 0;

  final List<String> _months = ['Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'];

  final List<String> _weekDays = ['Pt', 'Sa', 'Ça', 'Pe', 'Cu', 'Ct', 'Pz'];

  // Yıl listesi
  List<int> get _years => List.generate(widget.lastDate.year - widget.firstDate.year + 1, (i) => widget.firstDate.year + i);

  // Saat listesi (0-23)
  List<int> get _hours => List.generate(24, (i) => i);

  // Dakika listesi (5 dakika katları: 0, 5, 10, ..., 55)
  List<int> get _minutes => List.generate(12, (i) => i * 5);

  /// 5'in katına yuvarla (aşağı)
  int _roundToNearest5(int minute) => (minute ~/ 5) * 5;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    _currentMonth = _selectedDate.month;
    _currentYear = _selectedDate.year;
    _selectedWeek = _getWeekOfYear(_selectedDate);
    _selectedHour = _selectedDate.hour;
    _selectedMinute = _roundToNearest5(_selectedDate.minute);
  }

  int _getWeekOfYear(DateTime date) {
    final firstDayOfYear = DateTime(date.year, 1, 1);
    final daysDiff = date.difference(firstDayOfYear).inDays;
    return ((daysDiff + firstDayOfYear.weekday) / 7).ceil();
  }

  DateTime _getFirstDayOfWeek(int year, int week) {
    final firstDayOfYear = DateTime(year, 1, 1);
    final daysOffset = (week - 1) * 7 - firstDayOfYear.weekday + 1;
    return firstDayOfYear.add(Duration(days: daysOffset));
  }

  List<DateTime?> _getDaysInMonth() {
    final firstDayOfMonth = DateTime(_currentYear, _currentMonth, 1);
    final lastDayOfMonth = DateTime(_currentYear, _currentMonth + 1, 0);

    // Haftanın hangi gününden başlıyor (1 = Pazartesi, 7 = Pazar)
    int startingWeekday = firstDayOfMonth.weekday;

    List<DateTime?> days = [];

    // Önceki ayın boş günleri
    for (int i = 1; i < startingWeekday; i++) {
      days.add(null);
    }

    // Bu ayın günleri
    for (int i = 1; i <= lastDayOfMonth.day; i++) {
      days.add(DateTime(_currentYear, _currentMonth, i));
    }

    return days;
  }

  bool _canGoPrevious() {
    final firstMonth = DateTime(widget.firstDate.year, widget.firstDate.month, 1);
    final currentMonth = DateTime(_currentYear, _currentMonth, 1);
    return currentMonth.isAfter(firstMonth);
  }

  bool _canGoNext() {
    final lastMonth = DateTime(widget.lastDate.year, widget.lastDate.month, 1);
    final currentMonth = DateTime(_currentYear, _currentMonth, 1);
    return currentMonth.isBefore(lastMonth);
  }

  void _previousMonth() {
    if (!_canGoPrevious()) return;
    setState(() {
      _slideToRight = true;
      if (_currentMonth == 1) {
        _currentMonth = 12;
        _currentYear--;
      } else {
        _currentMonth--;
      }
    });
  }

  void _nextMonth() {
    if (!_canGoNext()) return;
    setState(() {
      _slideToRight = false;
      if (_currentMonth == 12) {
        _currentMonth = 1;
        _currentYear++;
      } else {
        _currentMonth++;
      }
    });
  }

  bool _isSelected(DateTime date) {
    return date.year == _selectedDate.year && date.month == _selectedDate.month && date.day == _selectedDate.day;
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year && date.month == now.month && date.day == now.day;
  }

  bool _isInRange(DateTime date) {
    return !date.isBefore(widget.firstDate) && !date.isAfter(widget.lastDate);
  }

  bool _isInSelectedWeek(DateTime date) {
    final weekStart = _getFirstDayOfWeek(_currentYear, _selectedWeek);
    final weekEnd = weekStart.add(const Duration(days: 6));
    return !date.isBefore(weekStart) && !date.isAfter(weekEnd);
  }

  DateTime _getResultDate() {
    switch (widget.mode) {
      case CustomDatePickerMode.day:
        return _selectedDate;
      case CustomDatePickerMode.week:
        return _getFirstDayOfWeek(_currentYear, _selectedWeek);
      case CustomDatePickerMode.month:
        return DateTime(_currentYear, _currentMonth, 1);
      case CustomDatePickerMode.year:
        return DateTime(_currentYear, 1, 1);
      case CustomDatePickerMode.time:
        return DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day, _selectedHour, _selectedMinute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: FigmaContainer(
          decoration: BoxDecoration(
            color: AppColors.primary500.withValues(alpha: 0.15),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
            border: Border.all(color: AppColors.baseWhite.withValues(alpha: 0.1), width: 2),
          ),
          child: Padding(
            padding: appSizer.paddingSymmetric(horizontal: 24, vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Drag handle
                FigmaContainer(
                  height: 4,
                  width: 40,
                  decoration: BoxDecoration(color: AppColors.neutral500, borderRadius: BorderRadius.circular(2)),
                ),
                32.spacerV,

                // Title
                Text(widget.title, style: AppFonts.xl2Bold.copyWith(color: AppColors.baseWhite)),
                24.spacerV,

                // Content based on mode
                _buildContent(),
                24.spacerV,

                // Buttons
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: CustomAppButton.outlined(
                        text: 'İptal',
                        onTap: () => Navigator.pop(context),
                        borderColor: AppColors.baseWhite.withValues(alpha: 0.5),
                        textColor: AppColors.baseWhite,
                      ),
                    ),
                    Expanded(
                      child: CustomAppButton(
                        text: _pickerMode == 0 ? 'Seç' : 'Tarihi Uygula',
                        onTap: _pickerMode == 0 ? () => Navigator.pop(context, _getResultDate()) : () => setState(() => _pickerMode = 0),
                      ),
                    ),
                  ],
                ),
                (MediaQuery.of(context).padding.bottom > 0 ? 8 : 24).spacerV,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (widget.mode) {
      case CustomDatePickerMode.day:
        return _buildDayPicker();
      case CustomDatePickerMode.week:
        return _buildWeekPicker();
      case CustomDatePickerMode.month:
        return _buildMonthOnlyPicker();
      case CustomDatePickerMode.year:
        return _buildYearOnlyPicker();
      case CustomDatePickerMode.time:
        return _buildTimePicker();
    }
  }

  Widget _buildDayPicker() {
    return Column(
      children: [
        _buildMonthNavigation(),
        16.spacerV,
        if (_pickerMode == 0) ...[_buildWeekDaysHeader(), 8.spacerV, _buildCalendarGrid()] else ...[_buildMonthYearPicker()],
      ],
    );
  }

  Widget _buildWeekPicker() {
    return Column(children: [_buildMonthNavigation(), 16.spacerV, _buildWeekDaysHeader(), 8.spacerV, _buildWeekCalendarGrid()]);
  }

  Widget _buildMonthOnlyPicker() {
    final now = DateTime.now();
    final canGoNextYear = _currentYear < now.year;

    return Column(
      children: [
        // Yıl Navigasyonu
        FigmaContainer(
          padding: appSizer.paddingSymmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(color: AppColors.baseWhite.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: _currentYear > widget.firstDate.year
                    ? () => setState(() {
                        _slideToRight = true;
                        _currentYear--;
                      })
                    : null,
                child: FigmaContainer(
                  padding: appSizer.paddingAll(8),
                  decoration: BoxDecoration(color: AppColors.baseWhite.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                  child: Icon(
                    Icons.chevron_left,
                    color: _currentYear > widget.firstDate.year ? AppColors.baseWhite : AppColors.baseWhite.withValues(alpha: 0.3),
                    size: 24,
                  ),
                ),
              ),
              Text('$_currentYear', style: AppFonts.lgBold.copyWith(color: AppColors.baseWhite)),
              GestureDetector(
                onTap: canGoNextYear
                    ? () => setState(() {
                        _slideToRight = false;
                        _currentYear++;
                      })
                    : null,
                child: FigmaContainer(
                  padding: appSizer.paddingAll(8),
                  decoration: BoxDecoration(color: AppColors.baseWhite.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.chevron_right, color: canGoNextYear ? AppColors.baseWhite : AppColors.neutral600, size: 24),
                ),
              ),
            ],
          ),
        ),
        16.spacerV,
        // Ay Grid'i - Swipe ile yıl değiştirme
        GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity != null) {
              if (details.primaryVelocity! < -100 && canGoNextYear) {
                // Sola kaydır = sonraki yıl
                setState(() {
                  _slideToRight = false;
                  _currentYear++;
                });
              } else if (details.primaryVelocity! > 100 && _currentYear > widget.firstDate.year) {
                // Sağa kaydır = önceki yıl
                setState(() {
                  _slideToRight = true;
                  _currentYear--;
                });
              }
            }
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              final offsetAnimation = Tween<Offset>(
                begin: Offset(_slideToRight ? -1.0 : 1.0, 0.0),
                end: Offset.zero,
              ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

              return SlideTransition(
                position: offsetAnimation,
                child: FadeTransition(opacity: animation, child: child),
              );
            },
            child: GridView.builder(
              key: ValueKey('month-picker-$_currentYear'),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 2.5,
              ),
              itemCount: 12,
              itemBuilder: (context, index) {
                final monthIndex = index + 1;
                final isSelected = monthIndex == _currentMonth;
                // Gelecek ayları engelle
                final isFutureMonth = _currentYear == now.year && monthIndex > now.month;
                final isFutureYear = _currentYear > now.year;
                final isDisabled = isFutureMonth || isFutureYear;

                return GestureDetector(
                  onTap: isDisabled ? null : () => setState(() => _currentMonth = monthIndex),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary500
                          : isDisabled
                          ? AppColors.neutral700.withValues(alpha: 0.3)
                          : AppColors.baseWhite.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(_months[index], style: AppFonts.baseSemibold.copyWith(color: isDisabled ? AppColors.neutral600 : AppColors.baseWhite)),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildYearOnlyPicker() {
    return Column(
      children: [
        Text('Yıl Seçin', style: AppFonts.lgBold.copyWith(color: AppColors.baseWhite)),
        16.spacerV,
        SizedBox(
          height: 200,
          child: _buildWheelPicker(
            itemCount: _years.length,
            initialItem: _years.indexOf(_currentYear),
            onSelectedItemChanged: (index) => setState(() => _currentYear = _years[index]),
            itemBuilder: (index) => '${_years[index]}',
          ),
        ),
      ],
    );
  }

  Widget _buildTimePicker() {
    // Sonsuz döngü için büyük sayıda item kullan
    const int loopMultiplier = 100;
    final int hourItemCount = _hours.length * loopMultiplier;
    final int minuteItemCount = _minutes.length * loopMultiplier;

    // Başlangıç pozisyonunu ortaya al (döngünün ortasında başla)
    final int hourInitialItem = (loopMultiplier ~/ 2) * _hours.length + _selectedHour;
    final int minuteInitialItem = (loopMultiplier ~/ 2) * _minutes.length + _minutes.indexOf(_selectedMinute);

    return Column(
      children: [
        Text('Saat Seçin', style: AppFonts.lgBold.copyWith(color: AppColors.baseWhite)),
        16.spacerV,
        SizedBox(
          height: 200,
          child: Row(
            children: [
              // Saat Seçici (Looping)
              Expanded(
                child: _buildLoopingWheelPicker(
                  itemCount: hourItemCount,
                  realItemCount: _hours.length,
                  initialItem: hourInitialItem,
                  onSelectedItemChanged: (index) {
                    final realIndex = index % _hours.length;
                    setState(() => _selectedHour = _hours[realIndex]);
                  },
                  itemBuilder: (index) {
                    final realIndex = index % _hours.length;
                    return _hours[realIndex].toString().padLeft(2, '0');
                  },
                ),
              ),
              // Ayırıcı
              Padding(
                padding: appSizer.paddingSymmetric(horizontal: 8),
                child: Text(':', style: AppFonts.xl2Bold.copyWith(color: AppColors.baseWhite)),
              ),
              // Dakika Seçici (Looping - 5 dakika katları)
              Expanded(
                child: _buildLoopingWheelPicker(
                  itemCount: minuteItemCount,
                  realItemCount: _minutes.length,
                  initialItem: minuteInitialItem,
                  onSelectedItemChanged: (index) {
                    final realIndex = index % _minutes.length;
                    setState(() => _selectedMinute = _minutes[realIndex]);
                  },
                  itemBuilder: (index) {
                    final realIndex = index % _minutes.length;
                    return _minutes[realIndex].toString().padLeft(2, '0');
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLoopingWheelPicker({
    required int itemCount,
    required int realItemCount,
    required int initialItem,
    required Function(int) onSelectedItemChanged,
    required String Function(int) itemBuilder,
  }) {
    return Stack(
      children: [
        // Seçili item highlight
        Center(
          child: FigmaContainer(
            height: 44,
            decoration: BoxDecoration(color: AppColors.tertiary500.withValues(alpha: 0.35), borderRadius: BorderRadius.circular(12)),
          ),
        ),
        // Looping Wheel
        ListWheelScrollView.useDelegate(
          controller: FixedExtentScrollController(initialItem: initialItem),
          itemExtent: 44,
          perspective: 0.005,
          diameterRatio: 1.5,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: onSelectedItemChanged,
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: itemCount,
            builder: (context, index) {
              return Center(
                child: Text(itemBuilder(index), style: AppFonts.lgBold.copyWith(color: AppColors.baseWhite)),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeekCalendarGrid() {
    final days = _getDaysInMonth();

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! < -100) {
            _nextMonth();
          } else if (details.primaryVelocity! > 100) {
            _previousMonth();
          }
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          final offsetAnimation = Tween<Offset>(
            begin: Offset(_slideToRight ? -1.0 : 1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: GridView.builder(
          key: ValueKey('week-$_currentMonth-$_currentYear'),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemCount: days.length,
          itemBuilder: (context, index) {
            final date = days[index];
            if (date == null) return const SizedBox.shrink();

            final isInSelectedWeek = _isInSelectedWeek(date);
            final isToday = _isToday(date);
            final isInRange = _isInRange(date);

            return GestureDetector(
              onTap: isInRange
                  ? () => setState(() {
                      _selectedWeek = _getWeekOfYear(date);
                      _selectedDate = date;
                    })
                  : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isInSelectedWeek
                      ? AppColors.tertiary500.withValues(alpha: 0.5)
                      : isToday
                      ? AppColors.tertiary500.withValues(alpha: 0.30)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: isToday && !isInSelectedWeek ? Border.all(color: AppColors.tertiary500, width: 2) : null,
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: AppFonts.baseSemibold.copyWith(
                      color: isInSelectedWeek
                          ? AppColors.baseWhite
                          : isInRange
                          ? AppColors.baseWhite
                          : AppColors.neutral600,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMonthNavigation() {
    return FigmaContainer(
      padding: appSizer.paddingSymmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(color: AppColors.baseWhite.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(16)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: _pickerMode == 0 && _canGoPrevious() ? _previousMonth : null,
            child: FigmaContainer(
              padding: appSizer.paddingAll(8),
              decoration: BoxDecoration(color: AppColors.baseWhite.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
              child: Icon(
                Icons.chevron_left,
                color: _pickerMode == 0 && _canGoPrevious() ? AppColors.baseWhite : AppColors.baseWhite.withValues(alpha: 0.3),
                size: 24,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _pickerMode = _pickerMode == 0 ? 1 : 0),
            child: FigmaContainer(
              padding: appSizer.paddingSymmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: _pickerMode != 0 ? AppColors.tertiary500.withValues(alpha: 0.35) : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('${_months[_currentMonth - 1]} $_currentYear', style: AppFonts.lgBold.copyWith(color: AppColors.baseWhite)),
                  4.spacerH,
                  Icon(_pickerMode == 0 ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up, color: AppColors.baseWhite, size: 20),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: _pickerMode == 0 && _canGoNext() ? _nextMonth : null,
            child: FigmaContainer(
              padding: appSizer.paddingAll(8),
              decoration: BoxDecoration(color: AppColors.baseWhite.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
              child: Icon(
                Icons.chevron_right,
                color: _pickerMode == 0 && _canGoNext() ? AppColors.baseWhite : AppColors.baseWhite.withValues(alpha: 0.3),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthYearPicker() {
    return SizedBox(
      height: 200,
      child: Row(
        children: [
          // Ay Seçici
          Expanded(
            child: _buildWheelPicker(
              itemCount: 12,
              initialItem: _currentMonth - 1,
              onSelectedItemChanged: (index) => setState(() => _currentMonth = index + 1),
              itemBuilder: (index) => _months[index],
            ),
          ),
          16.spacerH,
          // Yıl Seçici
          Expanded(
            child: _buildWheelPicker(
              itemCount: _years.length,
              initialItem: _years.indexOf(_currentYear),
              onSelectedItemChanged: (index) => setState(() => _currentYear = _years[index]),
              itemBuilder: (index) => '${_years[index]}',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWheelPicker({
    required int itemCount,
    required int initialItem,
    required Function(int) onSelectedItemChanged,
    required String Function(int) itemBuilder,
  }) {
    return Stack(
      children: [
        // Seçili item highlight
        Center(
          child: FigmaContainer(
            height: 44,
            decoration: BoxDecoration(color: AppColors.tertiary500.withValues(alpha: 0.35), borderRadius: BorderRadius.circular(12)),
          ),
        ),
        // Wheel
        ListWheelScrollView.useDelegate(
          controller: FixedExtentScrollController(initialItem: initialItem),
          itemExtent: 44,
          perspective: 0.005,
          diameterRatio: 1.5,
          physics: const FixedExtentScrollPhysics(),
          onSelectedItemChanged: onSelectedItemChanged,
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: itemCount,
            builder: (context, index) {
              return Center(
                child: Text(itemBuilder(index), style: AppFonts.lgBold.copyWith(color: AppColors.baseWhite)),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeekDaysHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: _weekDays
          .map(
            (day) => SizedBox(
              width: 40.pxh,
              child: Text(
                day,
                textAlign: TextAlign.center,
                style: AppFonts.smSemibold.copyWith(color: AppColors.neutral400),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final days = _getDaysInMonth();

    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity != null) {
          if (details.primaryVelocity! < -100 && _canGoNext()) {
            _nextMonth();
          } else if (details.primaryVelocity! > 100 && _canGoPrevious()) {
            _previousMonth();
          }
        }
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation) {
          final offsetAnimation = Tween<Offset>(
            begin: Offset(_slideToRight ? -1.0 : 1.0, 0.0),
            end: Offset.zero,
          ).animate(CurvedAnimation(parent: animation, curve: Curves.easeInOut));

          return SlideTransition(
            position: offsetAnimation,
            child: FadeTransition(opacity: animation, child: child),
          );
        },
        child: GridView.builder(
          key: ValueKey('$_currentMonth-$_currentYear'),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, mainAxisSpacing: 8, crossAxisSpacing: 8),
          itemCount: days.length,
          itemBuilder: (context, index) {
            final date = days[index];
            if (date == null) return const SizedBox.shrink();

            final isSelected = _isSelected(date);
            final isToday = _isToday(date);
            final isInRange = _isInRange(date);

            return GestureDetector(
              onTap: isInRange ? () => setState(() => _selectedDate = date) : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.tertiary500
                      : isToday
                      ? AppColors.tertiary500.withValues(alpha: 0.30)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  border: isToday && !isSelected ? Border.all(color: AppColors.tertiary500, width: 2) : null,
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: AppFonts.baseSemibold.copyWith(
                      color: isSelected
                          ? AppColors.baseWhite
                          : isInRange
                          ? AppColors.baseWhite
                          : AppColors.neutral600,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
