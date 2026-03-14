import 'dart:io';

import 'package:dio/dio.dart';
import 'package:digivizit/core/functions/main_functions.dart';

sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;

  T? get data => this is Success<T> ? (this as Success<T>).value : null;
  Failure? get error => this is FailureResult<T> ? (this as FailureResult<T>).failure : null;

  factory Result.success(T value) => Success<T>(value);
  factory Result.failure(Failure failure) => FailureResult<T>(failure);
}

class Success<T> extends Result<T> {
  final T value;
  const Success(this.value);
}

class FailureResult<T> extends Result<T> {
  final Failure failure;
  const FailureResult(this.failure);
}

class Failure {
  final String message;
  final String? code;
  final dynamic raw;

  const Failure({required this.message, this.code, this.raw});
}

/// Doğrudan Failure üretmek istersen - internet kontrolü de yapar
Failure failureFromDio(DioException err) {
  // Internet bağlantısı kontrolü
  if (err.type == DioExceptionType.connectionError || (err.type == DioExceptionType.unknown && err.error.toString().contains('SocketException'))) {
    return noInternetFailure();
  }

  final msg = resolveDioErrorMessage(err);
  return Failure(message: msg, code: err.response?.statusCode?.toString(), raw: err.response?.data ?? err.message);
}

/// Beklenmeyen/boş/formatı tutmayan yanıt durumları için Failure
Failure unexpectedResponseFailure([dynamic raw]) => Failure(message: 'Unexpected response').copyWith(raw: raw);

/// İnternet bağlantısı olmadığında kullanılacak Failure
Failure noInternetFailure() => Failure(message: 'No internet connection');

/// Internet bağlantısını kontrol edip uygun hatayı döndürür
Future<Failure> getAppropriateFailure([dynamic raw]) async {
  try {
    // Basit internet kontrolü - google.com'a DNS lookup yapalım
    final result = await InternetAddress.lookup('google.com').timeout(const Duration(seconds: 3), onTimeout: () => []);

    if (result.isEmpty) {
      return noInternetFailure();
    }
    return unexpectedResponseFailure(raw);
  } catch (e) {
    // Internet bağlantısı yok
    return noInternetFailure();
  }
}

extension on Failure {
  Failure copyWith({String? message, String? code, dynamic raw}) => Failure(message: message ?? this.message, code: code ?? this.code, raw: raw ?? this.raw);
}
