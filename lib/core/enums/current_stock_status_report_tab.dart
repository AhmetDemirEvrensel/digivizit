import 'package:flutter/material.dart';

enum CurrentStockStatusReportTab { tankBazli, urunBazli }

extension CurrentStockStatusReportTabExtension on CurrentStockStatusReportTab {
  String get title {
    switch (this) {
      case CurrentStockStatusReportTab.tankBazli:
        return 'Tank Bazlı';
      case CurrentStockStatusReportTab.urunBazli:
        return 'Ürün Bazlı';
    }
  }

  IconData get icon {
    switch (this) {
      case CurrentStockStatusReportTab.tankBazli:
        return Icons.storage_rounded;
      case CurrentStockStatusReportTab.urunBazli:
        return Icons.inventory_2_rounded;
    }
  }

  String get subtitle {
    switch (this) {
      case CurrentStockStatusReportTab.tankBazli:
        return 'Tank bazında güncel stok durumu';
      case CurrentStockStatusReportTab.urunBazli:
        return 'Ürün bazında güncel stok durumu';
    }
  }
}
