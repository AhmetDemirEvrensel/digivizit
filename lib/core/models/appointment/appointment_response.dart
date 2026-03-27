// To parse this JSON data, do
//
//     final appointmentResponse = appointmentResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'appointment_response.freezed.dart';
part 'appointment_response.g.dart';

AppointmentResponse appointmentResponseFromJson(String str) => AppointmentResponse.fromJson(json.decode(str));

String appointmentResponseToJson(AppointmentResponse data) => json.encode(data.toJson());

@freezed
abstract class AppointmentResponse with _$AppointmentResponse {
  const factory AppointmentResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<Datum>? data,
  }) = _AppointmentResponse;

  factory AppointmentResponse.fromJson(Map<String, dynamic> json) => _$AppointmentResponseFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "employee_id") int? employeeId,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "company") String? company,
    @JsonKey(name: "subject") String? subject,
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "preferred_date") String? preferredDate,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "deleted_at") dynamic deletedAt,
    @JsonKey(name: "employee") Employee? employee,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
abstract class Employee with _$Employee {
  const factory Employee({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "extension_number") String? extensionNumber,
    @JsonKey(name: "qr") int? qr,
    @JsonKey(name: "qr_code_url") String? qrCodeUrl,
    @JsonKey(name: "instagram_url") dynamic instagramUrl,
    @JsonKey(name: "linkedin_url") dynamic linkedinUrl,
    @JsonKey(name: "appointment_status") String? appointmentStatus,
    @JsonKey(name: "date") DateTime? date,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "deleted_at") dynamic deletedAt,
    @JsonKey(name: "firm_name_id") int? firmNameId,
    @JsonKey(name: "department_id") int? departmentId,
    @JsonKey(name: "office_address_id") int? officeAddressId,
    @JsonKey(name: "title_en") String? titleEn,
    @JsonKey(name: "department") Department? department,
    @JsonKey(name: "department_en") dynamic departmentEn,
    @JsonKey(name: "photo") Photo? photo,
    @JsonKey(name: "qr_photo") Photo? qrPhoto,
    @JsonKey(name: "media") List<Photo>? media,
  }) = _Employee;

  factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
}

@freezed
abstract class Department with _$Department {
  const factory Department({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "name_en") String? nameEn,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "deleted_at") dynamic deletedAt,
    @JsonKey(name: "banner_background") Photo? bannerBackground,
    @JsonKey(name: "media") List<Photo>? media,
  }) = _Department;

  factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
}

@freezed
abstract class Photo with _$Photo {
  const factory Photo({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "model_type") String? modelType,
    @JsonKey(name: "model_id") int? modelId,
    @JsonKey(name: "uuid") String? uuid,
    @JsonKey(name: "collection_name") String? collectionName,
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "file_name") String? fileName,
    @JsonKey(name: "mime_type") String? mimeType,
    @JsonKey(name: "disk") String? disk,
    @JsonKey(name: "conversions_disk") String? conversionsDisk,
    @JsonKey(name: "size") int? size,
    @JsonKey(name: "manipulations") List<dynamic>? manipulations,
    @JsonKey(name: "custom_properties") List<dynamic>? customProperties,
    @JsonKey(name: "generated_conversions") GeneratedConversions? generatedConversions,
    @JsonKey(name: "responsive_images") List<dynamic>? responsiveImages,
    @JsonKey(name: "order_column") int? orderColumn,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "original_url") String? originalUrl,
    @JsonKey(name: "preview_url") String? previewUrl,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "thumbnail") String? thumbnail,
    @JsonKey(name: "preview") String? preview,
  }) = _Photo;

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
abstract class GeneratedConversions with _$GeneratedConversions {
  const factory GeneratedConversions({@JsonKey(name: "thumb") bool? thumb, @JsonKey(name: "preview") bool? preview}) = _GeneratedConversions;

  factory GeneratedConversions.fromJson(Map<String, dynamic> json) => _$GeneratedConversionsFromJson(json);
}
