import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:digivizit/core/functions/main_functions.dart';
import 'package:digivizit/core/providers/app_settings.dart';

class CustomLoggerInterceptor extends Interceptor {
  final Logger logger = AppSettings.instance.logger;

  CustomLoggerInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = AppSettings.instance.apiToken?.trim();
    final hasAuthHeader = options.headers['Authorization'] != null;

    if ((token?.isNotEmpty ?? false) &&
        !hasAuthHeader &&
        !_isLoginRequest(options.path)) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    if (!kReleaseMode) {
      final serviceName = options.path.split("/").last.toUpperCase();
      final buffer = StringBuffer();
      final now = DateTime.now();
      final time =
          "${now.hour.toString().padLeft(2, '0')}:"
          "${now.minute.toString().padLeft(2, '0')}:"
          "${now.second.toString().padLeft(2, '0')}:"
          "${(now.millisecond).toString().padLeft(3, '0')}";

      buffer.writeln("╔══════════ 📤 $serviceName REQUEST [$time] ══════════");
      buffer.writeln("║ 📎 Path    : ${options.path}");
      buffer.writeln("║ 🔁 Method  : ${options.method}");
      buffer.writeln("║ 🧾 Headers :\n${_indent(prettyJson(options.headers))}");
      buffer.writeln("║ 🧩 Body    :\n${_indent(prettyJson(options.data))}");
      buffer.writeln("╚═════════════════════════════════════════════════════");

      AppSettings.instance.logDebug(buffer.toString());
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!kReleaseMode) {
      final serviceName = response.requestOptions.path.split("/").last.toUpperCase();
      final buffer = StringBuffer();
      final now = DateTime.now();
      final time =
          "${now.hour.toString().padLeft(2, '0')}:"
          "${now.minute.toString().padLeft(2, '0')}:"
          "${now.second.toString().padLeft(2, '0')}:"
          "${(now.millisecond).toString().padLeft(3, '0')}";

      buffer.writeln("╔══════════ ✅ $serviceName RESPONSE [$time] ══════════");
      buffer.writeln("║ 📎 Path        : ${response.requestOptions.path}");
      buffer.writeln("║ 📟 Status Code : ${response.statusCode}");
      buffer.writeln("║ 📦 Data        :\n${_indent(prettyJson(response.data, limitLength: true))}");
      buffer.writeln("╚══════════════════════════════════════════════════════");

      AppSettings.instance.logInfo(buffer.toString());
    }
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!kReleaseMode) {
      final serviceName = err.requestOptions.path.split("/").last.toUpperCase();
      final buffer = StringBuffer();
      final now = DateTime.now();
      final time =
          "${now.hour.toString().padLeft(2, '0')}:"
          "${now.minute.toString().padLeft(2, '0')}:"
          "${now.second.toString().padLeft(2, '0')}:"
          "${(now.millisecond).toString().padLeft(3, '0')}";
      final reason = resolveDioErrorMessage(err);

      buffer.writeln("╔══════════ ❌ $serviceName ERROR [$time] ════════════");
      buffer.writeln("║ 📎 Path        : ${err.requestOptions.path}");
      buffer.writeln("║ 📟 Status Code : ${err.response?.statusCode ?? 'N/A'}");
      buffer.writeln("║ 📢 Reason      : $reason");
      buffer.writeln("║ 🧨 Error       :\n${_indent(prettyJson(err.response?.data ?? err.message))}");
      buffer.writeln("╚══════════════════════════════════════════════════════");

      AppSettings.instance.logError(buffer.toString());
    }

    final statusCode = err.response?.statusCode;
    final shouldResetSession =
        statusCode == 401 &&
        !_isLoginRequest(err.requestOptions.path) &&
        AppSettings.instance.hasActiveToken;

    if (shouldResetSession) {
      AppSettings.instance.handleUnauthorizedSession();
    }

    handler.next(err);
  }

  bool _isLoginRequest(String path) {
    final normalizedPath = path.toLowerCase().split('?').first;
    return normalizedPath == 'login' || normalizedPath.endsWith('/login');
  }

  String prettyJson(dynamic json, {int indent = 2, int limit = 1600, bool limitLength = false}) {
    if (json == null) return '🧨 NULL 🧨';
    if (json is Map && json.isEmpty) return '🧨 NULL 🧨';
    if (json is Iterable && json.isEmpty) return '🧨 NULL 🧨';
    if (json is String && json.trim().isEmpty) return '🧨 NULL 🧨';

    String stringified;

    try {
      if (json is String) {
        json = jsonDecode(json);
      }
      final encoder = JsonEncoder.withIndent(' ' * indent);
      stringified = encoder.convert(json);
    } catch (_) {
      stringified = json.toString();
    }

    /* if (limitLength && stringified.length > limit) {
      return '${stringified.substring(0, limit)}...';
    } */

    return stringified;
  }

  String _indent(String input, {String prefix = '║    '}) {
    return input.split('\n').map((line) => '$prefix$line').join('\n');
  }

  /* dynamic customDecrypt({required dynamic encryptedData, bool isResponse = false}) {
    try {
      final decryptedResponse = ascrypter.decryptString(encryptedData[isResponse ? 'Response' : 'Request']);
      final jsonResponse = jsonDecode(decryptedResponse);
      return jsonResponse;
    } catch (_) {
      return encryptedData;
    }
  } */

  /* String _resolveErrorReason(DioException err) {
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        return '🌐 Bağlantı zaman aşımına uğradı – Sunucuya ulaşılamıyor olabilir.';
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return '⏱️ Yanıt süresi aşıldı – Sunucu yavaş yanıt veriyor olabilir ya da internet bağlantısı zayıf.';
      case DioExceptionType.badResponse:
        final statusCode = err.response?.statusCode ?? 0;
        if (statusCode >= 400 && statusCode < 500) {
          return '❌ İstemci Hatası [$statusCode] – Hatalı istek veya yetkilendirme sorunu.';
        } else if (statusCode >= 500) {
          return '💥 Sunucu Hatası [$statusCode] – Sunucu tarafında bir sorun oluştu.';
        }
        return '❗ Beklenmeyen bir yanıt hatası.';
      case DioExceptionType.unknown:
        if (err.error.toString().contains('SocketException')) {
          return '📴 İnternet Bağlantısı Yok – Wi-Fi veya mobil veriyi kontrol edin.';
        } else if (err.error.toString().contains('HandshakeException')) {
          return '🔐 SSL el sıkışması başarısız – VPN ya da proxy etkisi olabilir.';
        }
        return '❓ Bilinmeyen ağ hatası.';
      case DioExceptionType.connectionError:
        return '🚫 Sunucuya bağlanılamıyor – DNS, firewall veya ağ bağlantısı kesilmiş olabilir.';
      case DioExceptionType.cancel:
        return '🛑 İstek istemci tarafından iptal edildi.';
      default:
        return '⚠️ Tanımlanamayan bir hata oluştu.';
    }
  } */
}
