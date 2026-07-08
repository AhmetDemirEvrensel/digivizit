// To parse this JSON data, do
//
//     final mediaUploadResponse = mediaUploadResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'media_upload_response.freezed.dart';
part 'media_upload_response.g.dart';

MediaUploadResponse mediaUploadResponseFromJson(String str) =>
    MediaUploadResponse.fromJson(json.decode(str));

String mediaUploadResponseToJson(MediaUploadResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class MediaUploadResponse with _$MediaUploadResponse {
  const factory MediaUploadResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") MediaUploadData? data,
  }) = _MediaUploadResponse;

  factory MediaUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaUploadResponseFromJson(json);
}

@freezed
abstract class MediaUploadData with _$MediaUploadData {
  const factory MediaUploadData({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "original_name") String? originalName,
  }) = _MediaUploadData;

  factory MediaUploadData.fromJson(Map<String, dynamic> json) =>
      _$MediaUploadDataFromJson(json);
}
