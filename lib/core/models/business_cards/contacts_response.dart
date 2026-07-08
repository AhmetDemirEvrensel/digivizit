// To parse this JSON data, do
//
//     final businessCardListResponse = businessCardListResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:digivizit/core/models/common/page_meta.dart';
import 'dart:convert';

part 'contacts_response.freezed.dart';
part 'contacts_response.g.dart';

BusinessCardListResponse businessCardListResponseFromJson(String str) =>
    BusinessCardListResponse.fromJson(json.decode(str));

String businessCardListResponseToJson(BusinessCardListResponse data) =>
    json.encode(data.toJson());

BusinessCardDetailResponse businessCardDetailResponseFromJson(String str) =>
    BusinessCardDetailResponse.fromJson(json.decode(str));

String businessCardDetailResponseToJson(BusinessCardDetailResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class BusinessCardListResponse with _$BusinessCardListResponse {
  const factory BusinessCardListResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") BusinessCardListData? data,
  }) = _BusinessCardListResponse;

  factory BusinessCardListResponse.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardListResponseFromJson(json);
}

@freezed
abstract class BusinessCardListData with _$BusinessCardListData {
  const factory BusinessCardListData({
    @JsonKey(name: "items") List<BusinessCardListItem>? items,
    @JsonKey(name: "meta") PageMeta? meta,
  }) = _BusinessCardListData;

  factory BusinessCardListData.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardListDataFromJson(json);
}

@freezed
abstract class BusinessCardListItem with _$BusinessCardListItem {
  const factory BusinessCardListItem({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "company_name") String? companyName,
    @JsonKey(name: "sector") String? sector,
    @JsonKey(name: "primary_contact") String? primaryContact,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "thumbnail") String? thumbnail,
    @JsonKey(name: "has_image") bool? hasImage,
    @JsonKey(name: "created_at") String? createdAt,
  }) = _BusinessCardListItem;

  factory BusinessCardListItem.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardListItemFromJson(json);
}

@freezed
abstract class BusinessCardDetailResponse with _$BusinessCardDetailResponse {
  const factory BusinessCardDetailResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") BusinessCardDetailData? data,
  }) = _BusinessCardDetailResponse;

  factory BusinessCardDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardDetailResponseFromJson(json);
}

@freezed
abstract class BusinessCardDetailData with _$BusinessCardDetailData {
  const factory BusinessCardDetailData({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "user_id") int? userId,
    @JsonKey(name: "company_name") String? companyName,
    @JsonKey(name: "name_surname") List<String>? nameSurname,
    @JsonKey(name: "unvan") List<String>? unvan,
    @JsonKey(name: "email_list") List<String>? emailList,
    @JsonKey(name: "phone_list") List<String>? phoneList,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "website") String? website,
    @JsonKey(name: "address") String? address,
    @JsonKey(name: "sector") String? sector,
    @JsonKey(name: "country_id") int? countryId,
    @JsonKey(name: "country") String? country,
    @JsonKey(name: "notes") List<BusinessCardNote>? notes,
    @JsonKey(name: "cards") List<BusinessCardImage>? cards,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _BusinessCardDetailData;

  factory BusinessCardDetailData.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardDetailDataFromJson(json);
}

@freezed
abstract class BusinessCardImage with _$BusinessCardImage {
  const factory BusinessCardImage({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "thumbnail") String? thumbnail,
    @JsonKey(name: "preview") String? preview,
    @JsonKey(name: "file_name") String? fileName,
    @JsonKey(name: "mime_type") String? mimeType,
    @JsonKey(name: "size") int? size,
  }) = _BusinessCardImage;

  factory BusinessCardImage.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardImageFromJson(json);
}

@freezed
abstract class BusinessCardNote with _$BusinessCardNote {
  const factory BusinessCardNote({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "tenant_id") int? tenantId,
    @JsonKey(name: "business_card_id") int? businessCardId,
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "created_at") String? createdAt,
    @JsonKey(name: "updated_at") String? updatedAt,
  }) = _BusinessCardNote;

  factory BusinessCardNote.fromJson(Map<String, dynamic> json) =>
      _$BusinessCardNoteFromJson(json);
}

extension BusinessCardListItemSafeFields on BusinessCardListItem {
  String? _normalizedText(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }

  String? get companyValue => _normalizedText(companyName);
  String? get sectorValue => _normalizedText(sector);
  String? get emailValue => _normalizedText(email);
  String? get phoneValue => _normalizedText(phone);
  String? get primaryContactValue => _normalizedText(primaryContact);

  String get name => primaryContactValue ?? 'Isim bulunamadi';
  String get company => companyValue ?? 'Firma adi bulunamadi';
  String get sectorText => sectorValue ?? 'Sektor bulunamadi';

  String get companySummary {
    final company = companyValue;
    final contact = primaryContactValue;
    final summaryParts = <String>[
      if (company != null) company,
      if (contact != null) contact,
    ];

    if (summaryParts.isEmpty) {
      return 'Firma bilgisi bulunamadi';
    }

    return summaryParts.join(' - ');
  }

  List<String> get searchableValues {
    final company = companyValue;
    final email = emailValue;
    final phone = phoneValue;
    final sector = sectorValue;
    final contact = primaryContactValue;

    return [
      if (company != null) company,
      if (email != null) email,
      if (phone != null) phone,
      if (sector != null) sector,
      if (contact != null) contact,
    ];
  }
}

extension BusinessCardDetailDataSafeFields on BusinessCardDetailData {
  String? _normalizedText(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }

  List<String> _normalizedList(List<String>? values) {
    if (values == null) {
      return const [];
    }

    return values
        .map((value) => value.trim())
        .where((value) => value.isNotEmpty)
        .toList();
  }

  String? _firstValue(List<String>? values) {
    final normalizedValues = _normalizedList(values);
    if (normalizedValues.isEmpty) {
      return null;
    }
    return normalizedValues.first;
  }

  String _withFallback(String? value, String fallbackMessage) {
    return _normalizedText(value) ?? fallbackMessage;
  }

  String _firstWithFallback(List<String>? values, String fallbackMessage) {
    return _firstValue(values) ?? fallbackMessage;
  }

  List<String> get businessCardImages =>
      (cards ?? const [])
          .map((card) => card.url?.trim() ?? '')
          .where((url) => url.isNotEmpty)
          .toList();

  String? get companyValue => _normalizedText(companyName);
  String? get positionValue => _firstValue(unvan);
  String? get sectorValue => _normalizedText(sector);
  String? get websiteValue => _normalizedText(website);
  String? get emailValue => _normalizedText(email);
  String? get phoneValue => _normalizedText(phone);
  String? get countryValue => _normalizedText(country);
  String? get locationValue => _normalizedText(address);

  String? get contactPersonValue {
    final names = _normalizedList(nameSurname);
    if (names.length <= 1) {
      return null;
    }
    return names.skip(1).join(', ');
  }

  String? get contactPhoneValue => _firstValue(phoneList) ?? phoneValue;
  String? get contactEmailValue => _firstValue(emailList) ?? emailValue;

  String get name => _firstWithFallback(nameSurname, 'Isim bulunamadi');
  String get company => _withFallback(companyName, 'Firma adi bulunamadi');
  String get position => _firstWithFallback(unvan, 'Pozisyon bulunamadi');
  String get contactPerson => contactPersonValue ?? 'Ilgili kisi bulunamadi';
  String get contactPhone => contactPhoneValue ?? 'Telefon bulunamadi';
  String get contactEmail => contactEmailValue ?? 'E-posta bulunamadi';
  String get location => locationValue ?? 'Adres bulunamadi';
  String get sectorText => sectorValue ?? 'Sektor bulunamadi';
  String get websiteText => websiteValue ?? 'Web sitesi bulunamadi';
  String get countryText => countryValue ?? 'Ulke bilgisi bulunamadi';

  String get companySummary {
    final company = companyValue;
    final position = positionValue;
    final summaryParts = <String>[
      if (company != null) company,
      if (position != null) position,
    ];

    if (summaryParts.isEmpty) {
      return 'Firma bilgisi bulunamadi';
    }

    return summaryParts.join(' - ');
  }

  List<String> get searchableValues {
    final company = companyValue;
    final email = emailValue;
    final phone = phoneValue;
    final website = websiteValue;
    final location = locationValue;
    final sector = sectorValue;

    return [
      if (company != null) company,
      if (email != null) email,
      if (phone != null) phone,
      if (website != null) website,
      if (location != null) location,
      if (sector != null) sector,
      ..._normalizedList(nameSurname),
      ..._normalizedList(unvan),
      ..._normalizedList(emailList),
      ..._normalizedList(phoneList),
    ];
  }
}
