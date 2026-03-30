// To parse this JSON data, do
//
//     final employeeQrResponse = employeeQrResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'employee_qr_response.freezed.dart';
part 'employee_qr_response.g.dart';

EmployeeQrResponse employeeQrResponseFromJson(String str) => EmployeeQrResponse.fromJson(json.decode(str));

String employeeQrResponseToJson(EmployeeQrResponse data) => json.encode(data.toJson());

@freezed
abstract class EmployeeQrResponse with _$EmployeeQrResponse {
    const factory EmployeeQrResponse({
        @JsonKey(name: "success")
        bool? success,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        List<EmployeeQrData>? data,
    }) = _EmployeeQrResponse;

    factory EmployeeQrResponse.fromJson(Map<String, dynamic> json) => _$EmployeeQrResponseFromJson(json);
}

@freezed
abstract class EmployeeQrData with _$EmployeeQrData {
    const factory EmployeeQrData({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "user_id")
        int? userId,
        @JsonKey(name: "title")
        String? title,
        @JsonKey(name: "email")
        String? email,
        @JsonKey(name: "phone")
        String? phone,
        @JsonKey(name: "extension_number")
        String? extensionNumber,
        @JsonKey(name: "qr")
        int? qr,
        @JsonKey(name: "qr_code_url")
        String? qrCodeUrl,
        @JsonKey(name: "instagram_url")
        dynamic instagramUrl,
        @JsonKey(name: "linkedin_url")
        dynamic linkedinUrl,
        @JsonKey(name: "appointment_status")
        String? appointmentStatus,
        @JsonKey(name: "date")
        DateTime? date,
        @JsonKey(name: "status")
        String? status,
        @JsonKey(name: "slug")
        String? slug,
        @JsonKey(name: "created_at")
        DateTime? createdAt,
        @JsonKey(name: "updated_at")
        DateTime? updatedAt,
        @JsonKey(name: "deleted_at")
        dynamic deletedAt,
        @JsonKey(name: "firm_name_id")
        int? firmNameId,
        @JsonKey(name: "department_id")
        int? departmentId,
        @JsonKey(name: "office_address_id")
        int? officeAddressId,
        @JsonKey(name: "title_en")
        String? titleEn,
        @JsonKey(name: "department")
        Department? department,
        @JsonKey(name: "department_en")
        dynamic departmentEn,
        @JsonKey(name: "photo")
        Photo? photo,
        @JsonKey(name: "qr_photo")
        Photo? qrPhoto,
        @JsonKey(name: "firm_name")
        FirmName? firmName,
        @JsonKey(name: "office_address")
        OfficeAddress? officeAddress,
        @JsonKey(name: "media")
        List<Photo>? media,
        @JsonKey(name: "qr_photo_url")
        String? qrPhotoUrl,
        @JsonKey(name: "qr_photo_thumbnail")
        String? qrPhotoThumbnail,
        @JsonKey(name: "qr_photo_preview")
        String? qrPhotoPreview,
    }) = _EmployeeQrData;

    factory EmployeeQrData.fromJson(Map<String, dynamic> json) => _$EmployeeQrDataFromJson(json);
}

@freezed
abstract class Department with _$Department {
    const factory Department({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "name_en")
        String? nameEn,
        @JsonKey(name: "created_at")
        DateTime? createdAt,
        @JsonKey(name: "updated_at")
        DateTime? updatedAt,
        @JsonKey(name: "deleted_at")
        dynamic deletedAt,
        @JsonKey(name: "banner_background")
        Photo? bannerBackground,
        @JsonKey(name: "media")
        List<Photo>? media,
    }) = _Department;

    factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
}

@freezed
abstract class Photo with _$Photo {
    const factory Photo({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "model_type")
        String? modelType,
        @JsonKey(name: "model_id")
        int? modelId,
        @JsonKey(name: "uuid")
        String? uuid,
        @JsonKey(name: "collection_name")
        String? collectionName,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "file_name")
        String? fileName,
        @JsonKey(name: "mime_type")
        String? mimeType,
        @JsonKey(name: "disk")
        String? disk,
        @JsonKey(name: "conversions_disk")
        String? conversionsDisk,
        @JsonKey(name: "size")
        int? size,
        @JsonKey(name: "manipulations")
        List<dynamic>? manipulations,
        @JsonKey(name: "custom_properties")
        List<dynamic>? customProperties,
        @JsonKey(name: "generated_conversions")
        GeneratedConversionsClass? generatedConversions,
        @JsonKey(name: "responsive_images")
        List<dynamic>? responsiveImages,
        @JsonKey(name: "order_column")
        int? orderColumn,
        @JsonKey(name: "created_at")
        DateTime? createdAt,
        @JsonKey(name: "updated_at")
        DateTime? updatedAt,
        @JsonKey(name: "original_url")
        String? originalUrl,
        @JsonKey(name: "preview_url")
        String? previewUrl,
        @JsonKey(name: "url")
        String? url,
        @JsonKey(name: "thumbnail")
        String? thumbnail,
        @JsonKey(name: "preview")
        String? preview,
    }) = _Photo;

    factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
}

@freezed
abstract class GeneratedConversionsClass with _$GeneratedConversionsClass {
    const factory GeneratedConversionsClass({
        @JsonKey(name: "thumb")
        bool? thumb,
        @JsonKey(name: "preview")
        bool? preview,
    }) = _GeneratedConversionsClass;

    factory GeneratedConversionsClass.fromJson(Map<String, dynamic> json) => _$GeneratedConversionsClassFromJson(json);
}

@freezed
abstract class FirmName with _$FirmName {
    const factory FirmName({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "firm_name")
        String? firmName,
        @JsonKey(name: "website")
        String? website,
        @JsonKey(name: "instagram_url")
        String? instagramUrl,
        @JsonKey(name: "linkedin_url")
        String? linkedinUrl,
        @JsonKey(name: "youtube_video_url")
        String? youtubeVideoUrl,
        @JsonKey(name: "created_at")
        DateTime? createdAt,
        @JsonKey(name: "updated_at")
        DateTime? updatedAt,
        @JsonKey(name: "deleted_at")
        dynamic deletedAt,
        @JsonKey(name: "logo")
        Photo? logo,
        @JsonKey(name: "main_background")
        Photo? mainBackground,
        @JsonKey(name: "catalog_tr")
        Catalog? catalogTr,
        @JsonKey(name: "catalog_en")
        Catalog? catalogEn,
        @JsonKey(name: "media")
        List<Media>? media,
    }) = _FirmName;

    factory FirmName.fromJson(Map<String, dynamic> json) => _$FirmNameFromJson(json);
}

@freezed
abstract class Catalog with _$Catalog {
    const factory Catalog({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "model_type")
        String? modelType,
        @JsonKey(name: "model_id")
        int? modelId,
        @JsonKey(name: "uuid")
        String? uuid,
        @JsonKey(name: "collection_name")
        String? collectionName,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "file_name")
        String? fileName,
        @JsonKey(name: "mime_type")
        String? mimeType,
        @JsonKey(name: "disk")
        String? disk,
        @JsonKey(name: "conversions_disk")
        String? conversionsDisk,
        @JsonKey(name: "size")
        int? size,
        @JsonKey(name: "manipulations")
        List<dynamic>? manipulations,
        @JsonKey(name: "custom_properties")
        List<dynamic>? customProperties,
        @JsonKey(name: "generated_conversions")
        List<dynamic>? generatedConversions,
        @JsonKey(name: "responsive_images")
        List<dynamic>? responsiveImages,
        @JsonKey(name: "order_column")
        int? orderColumn,
        @JsonKey(name: "created_at")
        DateTime? createdAt,
        @JsonKey(name: "updated_at")
        DateTime? updatedAt,
        @JsonKey(name: "original_url")
        String? originalUrl,
        @JsonKey(name: "preview_url")
        String? previewUrl,
    }) = _Catalog;

    factory Catalog.fromJson(Map<String, dynamic> json) => _$CatalogFromJson(json);
}

@freezed
abstract class Media with _$Media {
    const factory Media({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "model_type")
        String? modelType,
        @JsonKey(name: "model_id")
        int? modelId,
        @JsonKey(name: "uuid")
        String? uuid,
        @JsonKey(name: "collection_name")
        String? collectionName,
        @JsonKey(name: "name")
        String? name,
        @JsonKey(name: "file_name")
        String? fileName,
        @JsonKey(name: "mime_type")
        String? mimeType,
        @JsonKey(name: "disk")
        String? disk,
        @JsonKey(name: "conversions_disk")
        String? conversionsDisk,
        @JsonKey(name: "size")
        int? size,
        @JsonKey(name: "manipulations")
        List<dynamic>? manipulations,
        @JsonKey(name: "custom_properties")
        List<dynamic>? customProperties,
        @JsonKey(name: "generated_conversions")
        dynamic generatedConversions,
        @JsonKey(name: "responsive_images")
        List<dynamic>? responsiveImages,
        @JsonKey(name: "order_column")
        int? orderColumn,
        @JsonKey(name: "created_at")
        DateTime? createdAt,
        @JsonKey(name: "updated_at")
        DateTime? updatedAt,
        @JsonKey(name: "url")
        String? url,
        @JsonKey(name: "thumbnail")
        String? thumbnail,
        @JsonKey(name: "preview")
        String? preview,
        @JsonKey(name: "original_url")
        String? originalUrl,
        @JsonKey(name: "preview_url")
        String? previewUrl,
    }) = _Media;

    factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
abstract class OfficeAddress with _$OfficeAddress {
    const factory OfficeAddress({
        @JsonKey(name: "id")
        int? id,
        @JsonKey(name: "address_name")
        String? addressName,
        @JsonKey(name: "street_address")
        String? streetAddress,
        @JsonKey(name: "phone")
        String? phone,
        @JsonKey(name: "created_at")
        DateTime? createdAt,
        @JsonKey(name: "updated_at")
        DateTime? updatedAt,
        @JsonKey(name: "deleted_at")
        dynamic deletedAt,
    }) = _OfficeAddress;

    factory OfficeAddress.fromJson(Map<String, dynamic> json) => _$OfficeAddressFromJson(json);
}
