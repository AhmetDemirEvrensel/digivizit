// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

LoginResponse loginResponseFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") LoginData? data,
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class LoginData with _$LoginData {
  const factory LoginData({
    @JsonKey(name: "token") required String token,
    @JsonKey(name: "token_type") String? tokenType,
    @JsonKey(name: "me") required LoginMe me,
  }) = _LoginData;

  factory LoginData.fromJson(Map<String, dynamic> json) =>
      _$LoginDataFromJson(json);
}

@freezed
abstract class LoginMe with _$LoginMe {
  const factory LoginMe({
    @JsonKey(name: "user") required LoginUser user,
    @JsonKey(name: "employee") LoginEmployee? employee,
    @JsonKey(name: "tenant") LoginTenant? tenant,
    @JsonKey(name: "limits") LoginLimits? limits,
  }) = _LoginMe;

  factory LoginMe.fromJson(Map<String, dynamic> json) =>
      _$LoginMeFromJson(json);
}

@freezed
abstract class LoginUser with _$LoginUser {
  const factory LoginUser({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") required String name,
    @JsonKey(name: "email") String? email,
  }) = _LoginUser;

  factory LoginUser.fromJson(Map<String, dynamic> json) =>
      _$LoginUserFromJson(json);
}

@freezed
abstract class LoginEmployee with _$LoginEmployee {
  const factory LoginEmployee({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "title_en") String? titleEn,
    @JsonKey(name: "appointment_status") String? appointmentStatus,
    @JsonKey(name: "photo_url") String? photoUrl,
    @JsonKey(name: "photo_thumb_url") String? photoThumbUrl,
  }) = _LoginEmployee;

  factory LoginEmployee.fromJson(Map<String, dynamic> json) =>
      _$LoginEmployeeFromJson(json);
}

@freezed
abstract class LoginTenant with _$LoginTenant {
  const factory LoginTenant({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
  }) = _LoginTenant;

  factory LoginTenant.fromJson(Map<String, dynamic> json) =>
      _$LoginTenantFromJson(json);
}

@freezed
abstract class LoginLimits with _$LoginLimits {
  const factory LoginLimits({
    @JsonKey(name: "current") int? current,
    @JsonKey(name: "max") int? max,
    @JsonKey(name: "has_license") bool? hasLicense,
  }) = _LoginLimits;

  factory LoginLimits.fromJson(Map<String, dynamic> json) =>
      _$LoginLimitsFromJson(json);
}
