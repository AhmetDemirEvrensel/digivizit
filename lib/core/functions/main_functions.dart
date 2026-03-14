import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

ButtonStyle zeroPaddingTextButton() {
  return TextButton.styleFrom(minimumSize: Size.zero, padding: EdgeInsets.zero, tapTargetSize: MaterialTapTargetSize.shrinkWrap);
}

/// Sunucudan dönen gömülü hata mesajını yakalamaya çalışır
String? _tryExtractServerMessage(dynamic data) {
  if (data is Map) {
    for (final k in const ['message', 'error', 'detail', 'title', 'description']) {
      final v = data[k];
      if (v is String && v.trim().isNotEmpty) return v;
    }
  }
  return null;
}

String resolveDioErrorMessage(DioException err) {
  switch (err.type) {
    case DioExceptionType.connectionTimeout:
      return 'Bağlantı zaman aşımına uğradı – Sunucuya ulaşılamıyor olabilir.';
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return 'Yanıt süresi aşıldı – Sunucu yavaş yanıt veriyor olabilir ya da internet bağlantısı zayıf.';
    case DioExceptionType.badResponse:
      final status = err.response?.statusCode ?? 0;
      final serverMsg = _tryExtractServerMessage(err.response?.data);
      final errorDetail = serverMsg != null ? '\nTeknik Detay: $serverMsg' : '';

      if (status >= 400 && status < 500) {
        return 'İstemci Hatası [$status] – Hatalı istek veya yetkilendirme sorunu.$errorDetail';
      } else if (status >= 500) {
        return 'Sunucu Hatası [$status] – Sunucu tarafında bir sorun oluştu.$errorDetail';
      }
      return 'Beklenmeyen bir yanıt hatası.';
    case DioExceptionType.unknown:
      final e = err.error?.toString() ?? '';
      if (e.contains('SocketException')) {
        return 'İnternet Bağlantısı Yok – Wi-Fi veya mobil veriyi kontrol edin.';
      } else if (e.contains('HandshakeException')) {
        return 'SSL el sıkışması başarısız – VPN ya da proxy etkisi olabilir.';
      }
      // Sunucu mesajı varsa yine dene
      final serverMsg = _tryExtractServerMessage(err.response?.data);
      return serverMsg ?? 'Bilinmeyen ağ hatası.';
    case DioExceptionType.connectionError:
      return 'Sunucuya bağlanılamıyor – DNS, firewall veya ağ bağlantısı kesilmiş olabilir.';
    case DioExceptionType.cancel:
      return 'İstek istemci tarafından iptal edildi.';
    default:
      return 'Tanımlanamayan bir hata oluştu.';
  }
}
