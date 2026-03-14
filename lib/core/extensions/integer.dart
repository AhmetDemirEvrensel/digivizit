import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';

extension IntExtension on int {
  double get pxv => appSizer.px(toDouble(), Axis.vertical);
  double get pxh => appSizer.px(toDouble(), Axis.horizontal);
  Widget get spacerV => FigmaBox(height: toDouble());
  Widget get spacerH => FigmaBox(width: toDouble());

  /// Formats the number with thousand separators using Turkish locale
  /// Example: 21269 -> "21,269"
  String toFormattedString({int decimalDigits = 0}) {
    final formatter = NumberFormat('#,##0', 'tr_TR');
    if (decimalDigits > 0) {
      formatter.minimumFractionDigits = decimalDigits;
      formatter.maximumFractionDigits = decimalDigits;
    }
    return formatter.format(this);
  }
}
