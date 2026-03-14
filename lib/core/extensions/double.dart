import 'package:intl/intl.dart';

extension DoubleExtension on double {
  /// Formats the number with thousand separators using Turkish locale
  /// Example: 21269.0 -> "21,269"
  String toFormattedString({int decimalDigits = 0}) {
    final formatter = NumberFormat('#,##0', 'tr_TR');
    if (decimalDigits > 0) {
      formatter.minimumFractionDigits = decimalDigits;
      formatter.maximumFractionDigits = decimalDigits;
    }
    return formatter.format(this);
  }
}

extension DoubleNullExtension on double? {
  /// Formats the number with thousand separators using Turkish locale, returns empty string if null
  /// Example: 21269.0 -> "21,269"
  String toFormattedString({int decimalDigits = 0}) {
    if (this == null) return '';
    return this!.toFormattedString(decimalDigits: decimalDigits);
  }
}
