import 'package:digivizit/core/constants/icon_paths.dart';

/// Shift sayfasındaki tab tipleri
enum ShiftTabType { shift, product, sale, mechanic, tank }

/// ShiftTabType için extension - tüm bilgiler burada
extension ShiftTabTypeExtension on ShiftTabType {
  /// Tab başlığı (TopBar'da görünen)
  String get title => switch (this) {
    ShiftTabType.shift => 'Vardiya',
    ShiftTabType.product => 'Ürün',
    ShiftTabType.sale => 'Satış',
    ShiftTabType.mechanic => 'Pompacı',
    ShiftTabType.tank => 'Tank',
  };

  /// Tab ikonu
  String get iconPath => switch (this) {
    ShiftTabType.shift => IconPaths.clock,
    ShiftTabType.product => IconPaths.product,
    ShiftTabType.sale => IconPaths.receipt,
    ShiftTabType.mechanic => IconPaths.person,
    ShiftTabType.tank => IconPaths.tank,
  };

  /// WidgetsBackground başlığı
  String get contentTitle => switch (this) {
    ShiftTabType.shift => 'Vardiya Bilgileri',
    ShiftTabType.product => 'Ürün Bilgileri',
    ShiftTabType.sale => 'Satış Bilgileri',
    ShiftTabType.mechanic => 'Pompacı Bilgileri',
    ShiftTabType.tank => 'Tank Bilgileri',
  };

  /// WidgetsBackground alt başlığı
  String get contentSubtitle => switch (this) {
    ShiftTabType.shift => 'Genel vardiya bilgileri',
    ShiftTabType.product => 'Aktif vardiyadaki ürün satış özeti',
    ShiftTabType.sale => 'Aktif vardiyadaki satış özeti',
    ShiftTabType.mechanic => 'Vardiyadaki pompacı satış bilgileri',
    ShiftTabType.tank => 'Aktif vardiyadaki tank bilgileri',
  };

  /// Scroll edilebilir mi?
  bool get isScrollable => this == ShiftTabType.shift;
}
