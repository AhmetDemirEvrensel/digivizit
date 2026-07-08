// To parse this JSON data, do
//
//     final cardResponse = cardResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'card_response.freezed.dart';
part 'card_response.g.dart';

CardResponse cardResponseFromJson(String str) =>
    CardResponse.fromJson(json.decode(str));

String cardResponseToJson(CardResponse data) => json.encode(data.toJson());

@freezed
abstract class CardResponse with _$CardResponse {
  const factory CardResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") CardData? data,
  }) = _CardResponse;

  factory CardResponse.fromJson(Map<String, dynamic> json) =>
      _$CardResponseFromJson(json);
}

@freezed
abstract class CardData with _$CardData {
  const factory CardData({
    @JsonKey(name: "name") String? name,
    @JsonKey(name: "slug") String? slug,
    @JsonKey(name: "title") String? title,
    @JsonKey(name: "card_url") String? cardUrl,
    @JsonKey(name: "vcard_url") String? vcardUrl,
    @JsonKey(name: "qr_code_url") String? qrCodeUrl,
    @JsonKey(name: "qr_photo_url") String? qrPhotoUrl,
    @JsonKey(name: "photo_url") String? photoUrl,
  }) = _CardData;

  factory CardData.fromJson(Map<String, dynamic> json) =>
      _$CardDataFromJson(json);
}
