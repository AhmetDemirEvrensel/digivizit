import 'dart:io';

import 'package:digivizit/core/enums/app_languages.dart';
import 'package:digivizit/core/providers/app_settings.dart';

// =====================================================================
// NUMBER FORMATTER - Çok Amaçlı Sayı Formatlama Yardımcısı
// =====================================================================

/// Desteklenen birim tipleri
enum UnitType {
  /// Para birimi (₺, TL, $, €)
  currency,

  /// Hacim birimi (LT, L)
  volume,

  /// Ağırlık birimi (KG, G)
  weight,

  /// Adet birimi (ADET)
  quantity,

  /// Birim yok (sadece sayı)
  none,
}

/// Birim tiplerine göre varsayılan semboller
extension UnitTypeExt on UnitType {
  String get defaultSymbol {
    switch (this) {
      case UnitType.currency:
        return Platform.isIOS ? '₺' : 'TL';
      case UnitType.volume:
        return 'LT';
      case UnitType.weight:
        return 'KG';
      case UnitType.quantity:
        return 'ADET';
      case UnitType.none:
        return '';
    }
  }

  /// Varsayılan olarak birim sağda mı gösterilsin
  bool get defaultPositionRight {
    switch (this) {
      case UnitType.currency:
        return true; // ₺ sağda: 1.234,56 ₺
      case UnitType.volume:
        return true; // 1.234,56 LT
      case UnitType.weight:
        return true; // 1.234,56 KG
      case UnitType.quantity:
        return true; // 15 ADET
      case UnitType.none:
        return true;
    }
  }
}

/// Locale bazlı separator ayarları
class NumberSeparators {
  final String thousands;
  final String decimal;

  const NumberSeparators({required this.thousands, required this.decimal});

  /// Türkçe locale: 1.234,56
  static const tr = NumberSeparators(thousands: '.', decimal: ',');

  /// İngilizce locale: 1,234.56
  static const en = NumberSeparators(thousands: ',', decimal: '.');

  /// Mevcut dil ayarına göre separator döndürür
  factory NumberSeparators.fromLocale([AppLanguage? language]) {
    final lang = language ?? AppSettings.instance.language;
    return lang == AppLanguage.tr ? tr : en;
  }
}

/// Sayı formatlama yapılandırması
class NumberFormatConfig {
  /// Ondalık basamak sayısı (null = tamsayı gösterimi)
  final int? decimalPlaces;

  /// Birim tipi
  final UnitType unitType;

  /// Özel birim sembolü (null ise varsayılan kullanılır)
  final String? customSymbol;

  /// Birim sağda mı gösterilsin (null ise varsayılan kullanılır)
  final bool? unitOnRight;

  /// Locale ayarları (null ise mevcut dil ayarı kullanılır)
  final NumberSeparators? separators;

  /// Negatif sayılarda - işareti gösterilsin mi
  final bool showNegativeSign;

  /// Boşluk karakteri birim ile sayı arasında
  final String unitSpacing;

  const NumberFormatConfig({
    this.decimalPlaces = 2,
    this.unitType = UnitType.none,
    this.customSymbol,
    this.unitOnRight,
    this.separators,
    this.showNegativeSign = true,
    this.unitSpacing = ' ',
  });

  /// Para birimi için hazır yapılandırma
  factory NumberFormatConfig.currency({String? symbol, int decimalPlaces = 2, bool? onRight}) {
    return NumberFormatConfig(decimalPlaces: decimalPlaces, unitType: UnitType.currency, customSymbol: symbol, unitOnRight: onRight);
  }

  /// Litre için hazır yapılandırma
  factory NumberFormatConfig.volume({String symbol = 'LT', int decimalPlaces = 2, bool unitOnRight = false}) {
    return NumberFormatConfig(decimalPlaces: decimalPlaces, unitType: UnitType.volume, customSymbol: symbol, unitOnRight: unitOnRight);
  }

  /// Adet için hazır yapılandırma (ondalık yok)
  factory NumberFormatConfig.quantity({String symbol = 'ADET'}) {
    return NumberFormatConfig(decimalPlaces: null, unitType: UnitType.quantity, customSymbol: symbol);
  }

  /// Sadece sayı (birim yok)
  factory NumberFormatConfig.plain({int? decimalPlaces = 2}) {
    return NumberFormatConfig(decimalPlaces: decimalPlaces, unitType: UnitType.none);
  }
}

/// Ana formatlama sınıfı
class NumberFormatter {
  NumberFormatter._();

  // =====================================================================
  // CONVENIENCE STATIC METHODS - Pratik Kullanım
  // =====================================================================

  /// Para birimi olarak formatla
  ///
  /// Örnek:
  /// ```dart
  /// NumberFormatter.currency(1234.56);                     // "1.234,56 ₺"
  /// NumberFormatter.currency(1234.56, symbol: '$');        // "1.234,56 $"
  /// NumberFormatter.currency(1234.56, decimals: 0);        // "1.235 ₺"
  /// NumberFormatter.currency(1234.56, symbolOnLeft: true); // "₺ 1.234,56"
  /// ```
  static String currency(num? value, {String? symbol, int decimals = 2, bool symbolOnLeft = false, bool showNegativeSign = true}) {
    return format(
      value,
      NumberFormatConfig(
        decimalPlaces: decimals,
        unitType: UnitType.currency,
        customSymbol: symbol,
        unitOnRight: !symbolOnLeft,
        showNegativeSign: showNegativeSign,
      ),
    );
  }

  /// Litre olarak formatla
  ///
  /// Örnek:
  /// ```dart
  /// NumberFormatter.volume(1500.5);                    // "1.500,50 LT"
  /// NumberFormatter.volume(1500.5, symbol: 'L');       // "1.500,50 L"
  /// NumberFormatter.volume(1500.5, decimals: 0);       // "1.501 LT"
  /// NumberFormatter.volume(1500.5, symbolOnLeft: true);// "LT 1.500,50"
  /// ```
  static String volume(num? value, {String symbol = 'LT', int decimals = 2, bool symbolOnLeft = false, bool showNegativeSign = true}) {
    return format(
      value,
      NumberFormatConfig(
        decimalPlaces: decimals,
        unitType: UnitType.volume,
        customSymbol: symbol,
        unitOnRight: !symbolOnLeft,
        showNegativeSign: showNegativeSign,
      ),
    );
  }

  /// Kilogram olarak formatla
  ///
  /// Örnek:
  /// ```dart
  /// NumberFormatter.weight(250.5);                    // "250,50 KG"
  /// NumberFormatter.weight(250.5, symbol: 'kg');      // "250,50 kg"
  /// NumberFormatter.weight(250.5, decimals: 0);       // "251 KG"
  /// ```
  static String weight(num? value, {String symbol = 'KG', int decimals = 2, bool symbolOnLeft = false, bool showNegativeSign = true}) {
    return format(
      value,
      NumberFormatConfig(
        decimalPlaces: decimals,
        unitType: UnitType.weight,
        customSymbol: symbol,
        unitOnRight: !symbolOnLeft,
        showNegativeSign: showNegativeSign,
      ),
    );
  }

  /// Adet olarak formatla (ondalık yok)
  ///
  /// Örnek:
  /// ```dart
  /// NumberFormatter.quantity(42);                     // "42 ADET"
  /// NumberFormatter.quantity(42, symbol: 'Adet');     // "42 Adet"
  /// NumberFormatter.quantity(42, symbolOnLeft: true); // "ADET 42"
  /// ```
  static String quantity(num? value, {String symbol = 'ADET', bool symbolOnLeft = false}) {
    return format(value, NumberFormatConfig(decimalPlaces: null, unitType: UnitType.quantity, customSymbol: symbol, unitOnRight: !symbolOnLeft));
  }

  /// Sadece binlik ayırıcı ile formatla (birim yok)
  ///
  /// Örnek:
  /// ```dart
  /// NumberFormatter.plain(1234567.89);              // "1.234.567,89"
  /// NumberFormatter.plain(1234567.89, decimals: 0); // "1.234.568"
  /// NumberFormatter.plain(1234567);                 // "1.234.567,00"
  /// ```
  static String plain(num? value, {int? decimals = 2, bool showNegativeSign = true}) {
    return format(value, NumberFormatConfig(decimalPlaces: decimals, unitType: UnitType.none, showNegativeSign: showNegativeSign));
  }

  /// Yüzde olarak formatla
  ///
  /// Örnek:
  /// ```dart
  /// NumberFormatter.percent(0.156);                  // "15,60 %"
  /// NumberFormatter.percent(0.156, decimals: 0);    // "16 %"
  /// NumberFormatter.percent(0.156, symbolOnLeft: true); // "% 15,60"
  /// ```
  static String percent(num? value, {int decimals = 2, bool symbolOnLeft = false, bool multiply = true}) {
    final actualValue = multiply ? (value ?? 0) * 100 : value;
    return format(actualValue, NumberFormatConfig(decimalPlaces: decimals, unitType: UnitType.none, customSymbol: '%', unitOnRight: !symbolOnLeft));
  }

  // =====================================================================
  // CORE FORMAT METHOD
  // =====================================================================

  /// Sayıyı yapılandırmaya göre formatlar
  ///
  /// Örnek kullanımlar:
  /// ```dart
  /// // Para birimi
  /// NumberFormatter.format(1234.56, NumberFormatConfig.currency());
  /// // Sonuç (TR): "1.234,56 ₺"
  ///
  /// // Litre
  /// NumberFormatter.format(1500.5, NumberFormatConfig.volume());
  /// // Sonuç (TR): "1.500,50 LT"
  ///
  /// // Adet
  /// NumberFormatter.format(42, NumberFormatConfig.quantity());
  /// // Sonuç (TR): "42 ADET"
  ///
  /// // Sadece sayı
  /// NumberFormatter.format(1234.56, NumberFormatConfig.plain());
  /// // Sonuç (TR): "1.234,56"
  /// ```
  static String format(num? value, [NumberFormatConfig config = const NumberFormatConfig()]) {
    if (value == null) return '-';

    final double amount = value.toDouble();
    final bool isNegative = amount.isNegative;
    final double absAmount = amount.abs();

    // Separators
    final separators = config.separators ?? NumberSeparators.fromLocale();

    // Ondalık formatlama
    String formatted;
    if (config.decimalPlaces != null && config.decimalPlaces! > 0) {
      formatted = absAmount.toStringAsFixed(config.decimalPlaces!);
    } else {
      formatted = absAmount.toInt().toString();
    }

    // Tam sayı ve ondalık kısmı ayır
    final parts = formatted.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : null;

    // Binlik ayırıcı ekle
    final formattedInteger = _addThousandsSeparator(integerPart, separators.thousands);

    // Sonucu birleştir
    String result;
    if (decimalPart != null) {
      result = '$formattedInteger${separators.decimal}$decimalPart';
    } else {
      result = formattedInteger;
    }

    // Negatif işareti
    if (isNegative && config.showNegativeSign) {
      result = '-$result';
    }

    // Birim ekleme
    final symbol = config.customSymbol ?? config.unitType.defaultSymbol;
    if (symbol.isNotEmpty) {
      final onRight = config.unitOnRight ?? config.unitType.defaultPositionRight;
      final spacing = config.unitSpacing;

      if (onRight) {
        result = '$result$spacing$symbol';
      } else {
        result = '$symbol$spacing$result';
      }
    }

    return result;
  }

  /// Binlik ayırıcı ekler
  static String _addThousandsSeparator(String number, String separator) {
    final buffer = StringBuffer();
    final length = number.length;

    for (int i = 0; i < length; i++) {
      final reverseIndex = length - i;
      if (reverseIndex % 3 == 0 && i != 0) {
        buffer.write(separator);
      }
      buffer.write(number[i]);
    }

    return buffer.toString();
  }
}

// =====================================================================
// CONVENIENCE EXTENSIONS & FUNCTIONS
// =====================================================================

/// num üzerinde extension metodları
extension NumberFormatterExt on num {
  /// Para birimi olarak formatla
  /// Örnek: 1234.56.toCurrency() => "1.234,56 ₺"
  String toCurrency({String? symbol, int decimals = 2, bool isSymbolRight = false}) {
    return NumberFormatter.format(this, NumberFormatConfig.currency(symbol: symbol, decimalPlaces: decimals, onRight: isSymbolRight));
  }

  /// Litre olarak formatla
  /// Örnek: 1500.5.toVolume() => "1.500,50 LT"
  String toVolume({String symbol = 'LT', int decimals = 2, bool unitOnRight = true}) {
    return NumberFormatter.format(this, NumberFormatConfig.volume(symbol: symbol, decimalPlaces: decimals, unitOnRight: unitOnRight));
  }

  /// Adet olarak formatla
  /// Örnek: 42.toQuantity() => "42 ADET"
  String toQuantity({String symbol = 'ADET'}) {
    return NumberFormatter.format(this, NumberFormatConfig.quantity(symbol: symbol));
  }

  /// Sadece binlik ayırıcı ile formatla (birim yok)
  /// Örnek: 1234567.89.toFormatted() => "1.234.567,89"
  String toFormatted({int? decimals = 2}) {
    return NumberFormatter.format(this, NumberFormatConfig.plain(decimalPlaces: decimals));
  }
}

/// Nullable num için extension
extension NullableNumberFormatterExt on num? {
  String toCurrency({String? symbol, int decimals = 2, String fallback = '-', bool isSymbolRight = false}) {
    if (this == null) return fallback;
    return this!.toCurrency(symbol: symbol, decimals: decimals, isSymbolRight: isSymbolRight);
  }

  String toVolume({String symbol = 'LT', int decimals = 2, String fallback = '-', bool unitOnRight = true}) {
    if (this == null) return fallback;
    return this!.toVolume(symbol: symbol, decimals: decimals, unitOnRight: unitOnRight);
  }

  String toQuantity({String symbol = 'ADET', String fallback = '-'}) {
    if (this == null) return fallback;
    return this!.toQuantity(symbol: symbol);
  }

  String toFormatted({int? decimals = 2, String fallback = '-'}) {
    if (this == null) return fallback;
    return this!.toFormatted(decimals: decimals);
  }
}

// =====================================================================
// LEGACY SUPPORT - Geriye dönük uyumluluk için
// =====================================================================

/// Eski amountConverter fonksiyonunun yerine kullanılabilir
/// @deprecated NumberFormatter.format veya extension metodlarını kullanın
String amountConverter(double? amount, {bool doubleView = true, String? currency, bool currencyOnRight = true, String androidCurrency = ' TL'}) {
  final resolvedCurrency = (currency == '₺' && Platform.isAndroid) ? androidCurrency : currency;

  return NumberFormatter.format(
    amount,
    NumberFormatConfig(
      decimalPlaces: doubleView ? 2 : null,
      unitType: resolvedCurrency != null ? UnitType.currency : UnitType.none,
      customSymbol: resolvedCurrency,
      unitOnRight: currencyOnRight,
    ),
  );
}

/// TL sembolü - platform bazlı
String get tlCurrencySymbol => Platform.isIOS ? '₺' : 'TL';

/// Binlik ayırıcı - locale bazlı
String get thousandsSeparator => NumberSeparators.fromLocale().thousands;

/// Ondalık ayırıcı - locale bazlı
String get decimalSeparator => NumberSeparators.fromLocale().decimal;
