// To parse this JSON data, do
//
//     final simpleResponse = simpleResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'simple_response.freezed.dart';
part 'simple_response.g.dart';

SimpleResponse simpleResponseFromJson(String str) =>
    SimpleResponse.fromJson(json.decode(str));

String simpleResponseToJson(SimpleResponse data) => json.encode(data.toJson());

/// Generic envelope for endpoints that only return `{ success, message, data: null }`
/// (logout, forgot/reset password, note/media/card deletion, ...).
@freezed
abstract class SimpleResponse with _$SimpleResponse {
  const factory SimpleResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") dynamic data,
  }) = _SimpleResponse;

  factory SimpleResponse.fromJson(Map<String, dynamic> json) =>
      _$SimpleResponseFromJson(json);
}
