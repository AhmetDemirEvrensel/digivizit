enum OldShiftType { lastShift, historyShift }

/// ShiftTabType için extension - tüm bilgiler burada
extension OldShiftTypeExtension on OldShiftType {
  /// Tab başlığı (TopBar'da görünen)
  String get title => switch (this) {
    OldShiftType.lastShift => 'Son Vardiya',
    OldShiftType.historyShift => 'Gecmiş Vardiyalar',
  };

  /// WidgetsBackground başlığı
  String get contentTitle => switch (this) {
    OldShiftType.lastShift => 'Vardiya Bilgileri',
    OldShiftType.historyShift => 'Ürün Bilgileri',
  };

  /// WidgetsBackground alt başlığı
  String get contentSubtitle => switch (this) {
    OldShiftType.lastShift => 'Genel vardiya bilgileri',
    OldShiftType.historyShift => 'Aktif vardiyadaki ürün satış özeti',
  };
}
