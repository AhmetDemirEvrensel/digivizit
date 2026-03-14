extension DateTimeExtension on DateTime {
  /// Formats DateTime to Turkish date format: dd.MM.yyyy
  /// Example: 2025-11-12T00:00:00 -> 12.11.2025
  String toTurkishDateFormat() {
    final day = this.day.toString().padLeft(2, '0');
    final month = this.month.toString().padLeft(2, '0');
    final year = this.year.toString();
    return '$day.$month.$year';
  }

  /// Formats DateTime to Turkish date and time format: dd.MM.yyyy HH:mm
  /// Example: 2025-11-12T14:30:00 -> 12.11.2025 14:30
  String toTurkishDateTimeFormat() {
    final day = this.day.toString().padLeft(2, '0');
    final month = this.month.toString().padLeft(2, '0');
    final year = this.year.toString();
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    return '$day.$month.$year $hour:$minute';
  }

  /// Formats time only in HH:mm format
  /// Example: 2025-11-03T10:31:26 -> 10:31
  String toTimeFormat() {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// Formats time with seconds in HH:mm:ss format
  /// Example: 2025-11-03T10:31:26 -> 10:31:26
  String toTimeFormatWithSeconds() {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    final second = this.second.toString().padLeft(2, '0');
    return '$hour:$minute:$second';
  }

  String getDateGroupKey(DateTime? date) {
    if (date == null) return 'Bilinmiyor';

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final itemDate = DateTime(date.year, date.month, date.day);

    if (itemDate == today) {
      return 'Bugün';
    } else if (itemDate == yesterday) {
      return 'Dün';
    } else {
      // "Pazartesi, 02 Şubat" formatı
      return formatTurkishDayDate(date);
    }
  }

  String formatTurkishDayDate(DateTime date) {
    const days = ['Pazartesi', 'Salı', 'Çarşamba', 'Perşembe', 'Cuma', 'Cumartesi', 'Pazar'];
    const months = ['Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'];

    final dayName = days[date.weekday - 1];
    final day = date.day.toString().padLeft(2, '0');
    final month = months[date.month - 1];

    return '$dayName, $day $month';
  }
}
