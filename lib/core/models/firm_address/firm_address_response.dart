// To parse this JSON data, do
//
//     final firmAddressResponse = firmAddressResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'firm_address_response.freezed.dart';
part 'firm_address_response.g.dart';

FirmAddressResponse firmAddressResponseFromJson(String str) => FirmAddressResponse.fromJson(json.decode(str));

String firmAddressResponseToJson(FirmAddressResponse data) => json.encode(data.toJson());

@freezed
class FirmAddressResponse with _$FirmAddressResponse {
    const factory FirmAddressResponse({
        @JsonKey(name: "success")
        required bool success,
        @JsonKey(name: "message")
        required String message,
        @JsonKey(name: "data")
        required List<Datum> data,
    }) = _FirmAddressResponse;

    factory FirmAddressResponse.fromJson(Map<String, dynamic> json) => _$FirmAddressResponseFromJson(json);
}

@freezed
class Datum with _$Datum {
    const factory Datum({
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
    }) = _Datum;

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}
