import 'dart:ui';

class AppConfig {
  static List<Locale> get supportedLanguages => [Locale('tr', 'TR'), Locale('en', 'US')];
  static bool isTestMode = true;
  static const String baseUrl = "https://oats.com.tr/Petech.Mobile.Api.Core/";
  static const String testUrl = "https://oats.com.tr/Petech.Mobile.Api.Core.Test/";
  /* static String basicAuth =
      'Basic ${base64Encode(utf8.encode('RabbitAsis:19821982'))}'; */
}
