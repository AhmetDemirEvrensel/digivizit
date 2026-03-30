// To parse this JSON data, do
//
//     final ocrResponse = ocrResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'ocr_response.freezed.dart';
part 'ocr_response.g.dart';

OcrResponse ocrResponseFromJson(String str) => OcrResponse.fromJson(json.decode(str));

String ocrResponseToJson(OcrResponse data) => json.encode(data.toJson());

@freezed
abstract class OcrResponse with _$OcrResponse {
    const factory OcrResponse({
        @JsonKey(name: "success")
        bool? success,
        @JsonKey(name: "message")
        String? message,
        @JsonKey(name: "data")
        Data? data,
    }) = _OcrResponse;

    factory OcrResponse.fromJson(Map<String, dynamic> json) => _$OcrResponseFromJson(json);
}

@freezed
abstract class Data with _$Data {
    const factory Data({
        @JsonKey(name: "company_name")
        String? companyName,
        @JsonKey(name: "name_surname")
        List<String>? nameSurname,
        @JsonKey(name: "unvan")
        List<dynamic>? unvan,
        @JsonKey(name: "email_list")
        List<String>? emailList,
        @JsonKey(name: "phone_list")
        PhoneList? phoneList,
        @JsonKey(name: "sector")
        String? sector,
        @JsonKey(name: "website")
        String? website,
        @JsonKey(name: "address")
        String? address,
        @JsonKey(name: "phone")
        String? phone,
        @JsonKey(name: "email")
        String? email,
        @JsonKey(name: "country")
        String? country,
        @JsonKey(name: "note")
        String? note,
        @JsonKey(name: "country_id")
        int? countryId,
    }) = _Data;

    factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
abstract class PhoneList with _$PhoneList {
    const factory PhoneList({
        @JsonKey(name: "landline")
        String? landline,
        @JsonKey(name: "mobile")
        String? mobile,
    }) = _PhoneList;

    factory PhoneList.fromJson(Map<String, dynamic> json) => _$PhoneListFromJson(json);
}
