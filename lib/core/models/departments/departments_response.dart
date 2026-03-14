// To parse this JSON data, do
//
//     final departmentsResponse = departmentsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'departments_response.freezed.dart';
part 'departments_response.g.dart';

DepartmentsResponse departmentsResponseFromJson(String str) => DepartmentsResponse.fromJson(json.decode(str));

String departmentsResponseToJson(DepartmentsResponse data) => json.encode(data.toJson());

@freezed
class DepartmentsResponse with _$DepartmentsResponse {
    const factory DepartmentsResponse({
        @JsonKey(name: "success")
        required bool success,
        @JsonKey(name: "message")
        required String message,
        @JsonKey(name: "data")
        required List<Datum> data,
    }) = _DepartmentsResponse;

    factory DepartmentsResponse.fromJson(Map<String, dynamic> json) => _$DepartmentsResponseFromJson(json);
}

@freezed
class Datum with _$Datum {
    const factory Datum({
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
        required BannerBackground? bannerBackground,
        @JsonKey(name: "media")
        required List<BannerBackground> media,
    }) = _Datum;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class BannerBackground with _$BannerBackground {
    const factory BannerBackground({
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
        @JsonKey(name: "original_url")
        required String originalUrl,
        @JsonKey(name: "preview_url")
        required String previewUrl,
    }) = _BannerBackground;

    factory BannerBackground.fromJson(Map<String, dynamic> json) => _$BannerBackgroundFromJson(json);
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
