// To parse this JSON data, do
//
//     final qrResponse = qrResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'qr_response.freezed.dart';
part 'qr_response.g.dart';

QrResponse qrResponseFromJson(String str) =>
    QrResponse.fromJson(json.decode(str));

String qrResponseToJson(QrResponse data) => json.encode(data.toJson());

@freezed
abstract class QrResponse with _$QrResponse {
  const factory QrResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") QrData? data,
  }) = _QrResponse;

  factory QrResponse.fromJson(Map<String, dynamic> json) =>
      _$QrResponseFromJson(json);
}

@freezed
abstract class QrData with _$QrData {
  const factory QrData({
    @JsonKey(name: "qr_code_url") String? qrCodeUrl,
    @JsonKey(name: "qr_photo_url") String? qrPhotoUrl,
    @JsonKey(name: "qr_photo_thumbnail") String? qrPhotoThumbnail,
    @JsonKey(name: "qr_photo_preview") String? qrPhotoPreview,
  }) = _QrData;

  factory QrData.fromJson(Map<String, dynamic> json) =>
      _$QrDataFromJson(json);
}
