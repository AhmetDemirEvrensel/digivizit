// To parse this JSON data, do
//
//     final profileResponse = profileResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'profile_response.freezed.dart';
part 'profile_response.g.dart';

ProfileResponse profileResponseFromJson(String str) =>
    ProfileResponse.fromJson(json.decode(str));

String profileResponseToJson(ProfileResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class ProfileResponse with _$ProfileResponse {
  const factory ProfileResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") ProfileData? data,
  }) = _ProfileResponse;

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}

@freezed
abstract class ProfileData with _$ProfileData {
  const factory ProfileData({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "title_en") String? titleEn,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "extension_number") String? extensionNumber,
    @JsonKey(name: "instagram_url") String? instagramUrl,
    @JsonKey(name: "linkedin_url") String? linkedinUrl,
    @JsonKey(name: "appointment_status") String? appointmentStatus,
    @JsonKey(name: "photo_url") String? photoUrl,
    @JsonKey(name: "photo_thumb_url") String? photoThumbUrl,
    @JsonKey(name: "department") ProfileDepartment? department,
    @JsonKey(name: "firm") ProfileFirm? firm,
    @JsonKey(name: "office_address") ProfileOfficeAddress? officeAddress,
    @JsonKey(name: "editable_fields") List<String>? editableFields,
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataFromJson(json);
}

@freezed
abstract class ProfileDepartment with _$ProfileDepartment {
  const factory ProfileDepartment({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "name_en") String? nameEn,
  }) = _ProfileDepartment;

  factory ProfileDepartment.fromJson(Map<String, dynamic> json) =>
      _$ProfileDepartmentFromJson(json);
}

@freezed
abstract class ProfileFirm with _$ProfileFirm {
  const factory ProfileFirm({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "firm_name") String? firmName,
  }) = _ProfileFirm;

  factory ProfileFirm.fromJson(Map<String, dynamic> json) =>
      _$ProfileFirmFromJson(json);
}

@freezed
abstract class ProfileOfficeAddress with _$ProfileOfficeAddress {
  const factory ProfileOfficeAddress({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "address_name") String? addressName,
    @JsonKey(name: "street_address") String? streetAddress,
    @JsonKey(name: "phone") String? phone,
  }) = _ProfileOfficeAddress;

  factory ProfileOfficeAddress.fromJson(Map<String, dynamic> json) =>
      _$ProfileOfficeAddressFromJson(json);
}
