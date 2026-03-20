// To parse this JSON data, do
//
//     final getPersonelInfoResponse = getPersonelInfoResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_personel_info_response.freezed.dart';
part 'get_personel_info_response.g.dart';

GetPersonelInfoResponse getPersonelInfoResponseFromJson(String str) => GetPersonelInfoResponse.fromJson(json.decode(str));

String getPersonelInfoResponseToJson(GetPersonelInfoResponse data) => json.encode(data.toJson());

@freezed
abstract class GetPersonelInfoResponse with _$GetPersonelInfoResponse {
    const factory GetPersonelInfoResponse({
        @JsonKey(name: "success")
        required bool success,
        @JsonKey(name: "message")
        required String message,
        @JsonKey(name: "data")
        required List<Datum> data,
    }) = _GetPersonelInfoResponse;

    factory GetPersonelInfoResponse.fromJson(Map<String, dynamic> json) => _$GetPersonelInfoResponseFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
    const factory Datum({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "user_id")
        required int userId,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "email")
        required String email,
        @JsonKey(name: "phone")
        required String phone,
        @JsonKey(name: "extension_number")
        required String extensionNumber,
        @JsonKey(name: "qr")
        required int qr,
        @JsonKey(name: "qr_code_url")
        required String qrCodeUrl,
        @JsonKey(name: "instagram_url")
        required dynamic instagramUrl,
        @JsonKey(name: "linkedin_url")
        required dynamic linkedinUrl,
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
        required int departmentId,
        @JsonKey(name: "office_address_id")
        required int officeAddressId,
        @JsonKey(name: "title_en")
        required String titleEn,
        @JsonKey(name: "department")
        required Department department,
        @JsonKey(name: "department_en")
        required dynamic departmentEn,
        @JsonKey(name: "photo")
        required QrPhoto? photo,
        @JsonKey(name: "qr_photo")
        required QrPhoto qrPhoto,
        @JsonKey(name: "firm_name")
        required FirmName firmName,
        @JsonKey(name: "office_address")
        required OfficeAddress officeAddress,
        @JsonKey(name: "media")
        required List<QrPhoto> media,
    }) = _Datum;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
abstract class Department with _$Department {
    const factory Department({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "name_en")
        required String nameEn,
        @JsonKey(name: "created_at")
        required DateTime createdAt,
        @JsonKey(name: "updated_at")
        required DateTime updatedAt,
        @JsonKey(name: "deleted_at")
        required dynamic deletedAt,
        @JsonKey(name: "banner_background")
        required QrPhoto bannerBackground,
        @JsonKey(name: "media")
        required List<QrPhoto> media,
    }) = _Department;

    factory Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);
}

@freezed
abstract class QrPhoto with _$QrPhoto {
    const factory QrPhoto({
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
        required GeneratedConversionsClass generatedConversions,
        @JsonKey(name: "responsive_images")
        required List<dynamic> responsiveImages,
        @JsonKey(name: "order_column")
        required int orderColumn,
        @JsonKey(name: "created_at")
        required DateTime createdAt,
        @JsonKey(name: "updated_at")
        required DateTime updatedAt,
        @JsonKey(name: "original_url")
        required String originalUrl,
        @JsonKey(name: "preview_url")
        required String previewUrl,
        @JsonKey(name: "url")
        String? url,
        @JsonKey(name: "thumbnail")
        String? thumbnail,
        @JsonKey(name: "preview")
        String? preview,
    }) = _QrPhoto;

    factory QrPhoto.fromJson(Map<String, dynamic> json) => _$QrPhotoFromJson(json);
}

@freezed
abstract class GeneratedConversionsClass with _$GeneratedConversionsClass {
    const factory GeneratedConversionsClass({
        @JsonKey(name: "thumb")
        required bool thumb,
        @JsonKey(name: "preview")
        required bool preview,
    }) = _GeneratedConversionsClass;

    factory GeneratedConversionsClass.fromJson(Map<String, dynamic> json) => _$GeneratedConversionsClassFromJson(json);
}

@freezed
abstract class FirmName with _$FirmName {
    const factory FirmName({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "firm_name")
        required String firmName,
        @JsonKey(name: "website")
        required String website,
        @JsonKey(name: "instagram_url")
        required String instagramUrl,
        @JsonKey(name: "linkedin_url")
        required String linkedinUrl,
        @JsonKey(name: "youtube_video_url")
        required String youtubeVideoUrl,
        @JsonKey(name: "created_at")
        required DateTime createdAt,
        @JsonKey(name: "updated_at")
        required DateTime updatedAt,
        @JsonKey(name: "deleted_at")
        required dynamic deletedAt,
        @JsonKey(name: "logo")
        required QrPhoto logo,
        @JsonKey(name: "main_background")
        required QrPhoto mainBackground,
        @JsonKey(name: "catalog_tr")
        required Catalog catalogTr,
        @JsonKey(name: "catalog_en")
        required Catalog catalogEn,
        @JsonKey(name: "media")
        required List<Media> media,
    }) = _FirmName;

    factory FirmName.fromJson(Map<String, dynamic> json) => _$FirmNameFromJson(json);
}

@freezed
abstract class Catalog with _$Catalog {
    const factory Catalog({
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
        required List<dynamic> generatedConversions,
        @JsonKey(name: "responsive_images")
        required List<dynamic> responsiveImages,
        @JsonKey(name: "order_column")
        required int orderColumn,
        @JsonKey(name: "created_at")
        required DateTime createdAt,
        @JsonKey(name: "updated_at")
        required DateTime updatedAt,
        @JsonKey(name: "original_url")
        required String originalUrl,
        @JsonKey(name: "preview_url")
        required String previewUrl,
    }) = _Catalog;

    factory Catalog.fromJson(Map<String, dynamic> json) => _$CatalogFromJson(json);
}

@freezed
abstract class Media with _$Media {
    const factory Media({
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
        required dynamic generatedConversions,
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
    }) = _Media;

    factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}

@freezed
abstract class OfficeAddress with _$OfficeAddress {
    const factory OfficeAddress({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "address_name")
        required String addressName,
        @JsonKey(name: "street_address")
        required String streetAddress,
        @JsonKey(name: "phone")
        required String phone,
        @JsonKey(name: "created_at")
        required DateTime createdAt,
        @JsonKey(name: "updated_at")
        required DateTime updatedAt,
        @JsonKey(name: "deleted_at")
        required dynamic deletedAt,
    }) = _OfficeAddress;

    factory OfficeAddress.fromJson(Map<String, dynamic> json) => _$OfficeAddressFromJson(json);
}
