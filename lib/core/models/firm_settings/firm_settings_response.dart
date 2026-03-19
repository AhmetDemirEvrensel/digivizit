// To parse this JSON data, do
//
//     final firmSettingsResponse = firmSettingsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'firm_settings_response.freezed.dart';
part 'firm_settings_response.g.dart';

FirmSettingsResponse firmSettingsResponseFromJson(String str) => FirmSettingsResponse.fromJson(json.decode(str));

String firmSettingsResponseToJson(FirmSettingsResponse data) => json.encode(data.toJson());

@freezed
abstract class FirmSettingsResponse with _$FirmSettingsResponse {
    const factory FirmSettingsResponse({
        @JsonKey(name: "success")
        required bool success,
        @JsonKey(name: "message")
        required String message,
        @JsonKey(name: "data")
        required List<Datum> data,
    }) = _FirmSettingsResponse;

    factory FirmSettingsResponse.fromJson(Map<String, dynamic> json) => _$FirmSettingsResponseFromJson(json);
}

@freezed
abstract class Datum with _$Datum {
    const factory Datum({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "firm_name")
        required String firmName,
        @JsonKey(name: "website")
        required String? website,
        @JsonKey(name: "instagram_url")
        required String instagramUrl,
        @JsonKey(name: "linkedin_url")
        required String linkedinUrl,
        @JsonKey(name: "youtube_video_url")
        required String? youtubeVideoUrl,
        @JsonKey(name: "created_at")
        required DateTime createdAt,
        @JsonKey(name: "updated_at")
        required DateTime updatedAt,
        @JsonKey(name: "deleted_at")
        required dynamic deletedAt,
        @JsonKey(name: "logo")
        required Logo logo,
        @JsonKey(name: "main_background")
        required Logo mainBackground,
        @JsonKey(name: "catalog_tr")
        required Catalog? catalogTr,
        @JsonKey(name: "catalog_en")
        required Catalog? catalogEn,
        @JsonKey(name: "media")
        required List<Media> media,
    }) = _Datum;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
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
abstract class Logo with _$Logo {
    const factory Logo({
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
    }) = _Logo;

    factory Logo.fromJson(Map<String, dynamic> json) => _$LogoFromJson(json);
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
