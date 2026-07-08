import 'package:dio/dio.dart';
import 'package:digivizit/core/constants/app_config.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/core/utils/custom_logger_interceptor.dart';

class DioClient {
  DioClient._();
  static final DioClient instance = DioClient._();

  Dio? _general; // cache

  Dio _build(String baseUrl) {
    final dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
      ),
    );

    // dio.options.contentType = Headers.formUrlEncodedContentType;
    dio.options.contentType = Headers.jsonContentType;
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = AppSettings.instance.apiToken?.trim();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      ),
    );
    dio.interceptors.add(CustomLoggerInterceptor());
    return dio;
  }

  // Base API
  Dio get generalAPI {
    _general = _build(AppConfig.baseUrl);
    return _general!;
  }
}
