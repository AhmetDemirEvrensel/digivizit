// To parse this JSON data, do
//
//     final businessCardScanResponse = businessCardScanResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'business_card_scan_response.freezed.dart';
part 'business_card_scan_response.g.dart';

BusinessCardScanResponse businessCardScanResponseFromJson(String str) =>
    BusinessCardScanResponse.fromJson(json.decode(str));

String businessCardScanResponseToJson(BusinessCardScanResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class BusinessCardScanResponse with _$BusinessCardScanResponse {
  const factory BusinessCardScanResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") BusinessCardScanResult? data,
  }) = _BusinessCardScanResponse;

  factory BusinessCardScanResponse.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardScanResponseFromJson(json);
}

@freezed
abstract class BusinessCardScanResult with _$BusinessCardScanResult {
  const factory BusinessCardScanResult({
    @JsonKey(name: "engine") String? engine,
    @JsonKey(name: "data") BusinessCardScanData? data,
    @JsonKey(name: "image") String? image,
  }) = _BusinessCardScanResult;

  factory BusinessCardScanResult.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardScanResultFromJson(json);
}

@freezed
abstract class BusinessCardScanData with _$BusinessCardScanData {
  const factory BusinessCardScanData({
    @JsonKey(name: "company_name") String? companyName,
    @JsonKey(name: "name_surname") List<String>? nameSurname,
    @JsonKey(name: "unvan") List<String>? unvan,
    @JsonKey(name: "email_list") List<String>? emailList,
    @JsonKey(name: "phone_list") ScanPhoneList? phoneList,
    @JsonKey(name: "sector") String? sector,
    @JsonKey(name: "website") String? website,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "country_id") int? countryId,
    @JsonKey(name: "note") String? note,
  }) = _BusinessCardScanData;

  factory BusinessCardScanData.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardScanDataFromJson(json);
}

@freezed
abstract class ScanPhoneList with _$ScanPhoneList {
  const factory ScanPhoneList({
    @JsonKey(name: "landline") String? landline,
    @JsonKey(name: "mobile") String? mobile,
  }) = _ScanPhoneList;

  factory ScanPhoneList.fromJson(Map<String, dynamic> json) =>
      _$ScanPhoneListFromJson(json);
}
