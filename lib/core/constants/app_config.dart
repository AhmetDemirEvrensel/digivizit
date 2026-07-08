import 'dart:ui';

class AppConfig {
  static List<Locale> get supportedLanguages => [Locale('tr', 'TR'), Locale('en', 'US')];
  static bool isTestMode = true;
  static const String baseUrl = "https://dbc.hepta.com.tr/api/v2/";
  /* static String basicAuth =
      'Basic ${base64Encode(utf8.encode('RabbitAsis:19821982'))}'; */
}
