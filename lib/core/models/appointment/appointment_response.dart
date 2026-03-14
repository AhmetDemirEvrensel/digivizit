// To parse this JSON data, do
//
//     final appointmentResponse = appointmentResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'appointment_response.freezed.dart';
part 'appointment_response.g.dart';

AppointmentResponse appointmentResponseFromJson(String str) => AppointmentResponse.fromJson(json.decode(str));

String appointmentResponseToJson(AppointmentResponse data) => json.encode(data.toJson());

@freezed
class AppointmentResponse with _$AppointmentResponse {
    const factory AppointmentResponse({
        @JsonKey(name: "success")
        required bool success,
        @JsonKey(name: "message")
        required String message,
        @JsonKey(name: "data")
        required List<Datum> data,
    }) = _AppointmentResponse;

    factory AppointmentResponse.fromJson(Map<String, dynamic> json) => _$AppointmentResponseFromJson(json);
}

@freezed
class Datum with _$Datum {
    const factory Datum({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "employee_id")
        required int employeeId,
        @JsonKey(name: "full_name")
        required String fullName,
        @JsonKey(name: "company")
        required String company,
        @JsonKey(name: "subject")
        required String subject,
        @JsonKey(name: "note")
        required String note,
        @JsonKey(name: "preferred_date")
        required String preferredDate,
        @JsonKey(name: "status")
        required String status,
        @JsonKey(name: "created_at")
        required String createdAt,
        @JsonKey(name: "updated_at")
        required DateTime updatedAt,
        @JsonKey(name: "deleted_at")
        required dynamic deletedAt,
        @JsonKey(name: "employee")
        required Employee employee,
    }) = _Datum;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Employee with _$Employee {
    const factory Employee({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "user")
        required int user,
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "surname")
        required String surname,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "email")
        required String email,
        @JsonKey(name: "phone")
        required String phone,
        @JsonKey(name: "extension_number")
        required dynamic extensionNumber,
        @JsonKey(name: "qr")
        required int qr,
        @JsonKey(name: "qr_code_url")
        required String qrCodeUrl,
        @JsonKey(name: "instagram_url")
        required String instagramUrl,
        @JsonKey(name: "linkedin_url")
        required String linkedinUrl,
        @JsonKey(name: "appointment_status")
        required String appointmentStatus,
        @JsonKey(name: "date")
        required DateTime date,
        @JsonKey(name: "status")
        required String status,
        @JsonKey(name: "slug")
        required String slug,
        @JsonKey(name: "created_at")
        required DateTime createdAt,
        @JsonKey(name: "updated_at")
        required DateTime updatedAt,
        @JsonKey(name: "deleted_at")
        required dynamic deletedAt,
        @JsonKey(name: "firm_name_id")
        required int firmNameId,
        @JsonKey(name: "department_id")
        required dynamic departmentId,
        @JsonKey(name: "office_address_id")
        required int officeAddressId,
        @JsonKey(name: "title_en")
        required String titleEn,
        @JsonKey(name: "department")
        required dynamic department,
        @JsonKey(name: "department_en")
        required String departmentEn,
        @JsonKey(name: "photo")
        required Photo photo,
        @JsonKey(name: "qr_photo")
        required Photo qrPhoto,
        @JsonKey(name: "media")
        required List<Photo> media,
    }) = _Employee;

    factory Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);
}

@freezed
class Photo with _$Photo {
    const factory Photo({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "model_type")
        required String modelType,
        @JsonKey(name: "model_id")
        required int modelId,
        @JsonKey(name: "uuid")
        required String uuid,
        @JsonKey(name: "collection_name")
        required String collectionName,
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "file_name")
        required String fileName,
        @JsonKey(name: "mime_type")
        required String mimeType,
        @JsonKey(name: "disk")
        required String disk,
        @JsonKey(name: "conversions_disk")
        required String conversionsDisk,
        @JsonKey(name: "size")
        required int size,
        @JsonKey(name: "manipulations")
        required List<dynamic> manipulations,
        @JsonKey(name: "custom_properties")
        required List<dynamic> customProperties,
        @JsonKey(name: "generated_conversions")
        required GeneratedConversions generatedConversions,
        @JsonKey(name: "responsive_images")
        required List<dynamic> responsiveImages,
        @JsonKey(name: "order_column")
        required int orderColumn,
        @JsonKey(name: "created_at")
        required DateTime createdAt,
        @JsonKey(name: "updated_at")
        required DateTime updatedAt,
        @JsonKey(name: "url")
        String? url,
        @JsonKey(name: "thumbnail")
        String? thumbnail,
        @JsonKey(name: "preview")
        String? preview,
        @JsonKey(name: "original_url")
        required String originalUrl,
        @JsonKey(name: "preview_url")
        required String previewUrl,
    }) = _Photo;

    factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
class GeneratedConversions with _$GeneratedConversions {
    const factory GeneratedConversions({
        @JsonKey(name: "thumb")
        required bool thumb,
        @JsonKey(name: "preview")
        required bool preview,
    }) = _GeneratedConversions;

    factory GeneratedConversions.fromJson(Map<String, dynamic> json) => _$GeneratedConversionsFromJson(json);
}
