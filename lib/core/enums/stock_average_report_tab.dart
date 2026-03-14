import 'package:flutter/material.dart';

enum StockAverageReportTab { tankBazli, urunBazli }

extension StockAverageReportTabExtension on StockAverageReportTab {
  String get title {
    switch (this) {
      case StockAverageReportTab.tankBazli:
        return 'Tank Bazlı';
      case StockAverageReportTab.urunBazli:
        return 'Ürün Bazlı';
    }
  }

  IconData get icon {
    switch (this) {
      case StockAverageReportTab.tankBazli:
        return Icons.storage_rounded;
      case StockAverageReportTab.urunBazli:
        return Icons.inventory_2_rounded;
    }
  }

  String get subtitle {
    switch (this) {
      case StockAverageReportTab.tankBazli:
        return 'Tank bazında son 1 ay gün sonu stok durumu';
      case StockAverageReportTab.urunBazli:
        return 'Ürün bazında son 1 ay gün sonu stok durumu';
    }
  }
}
