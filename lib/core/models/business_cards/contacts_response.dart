// To parse this JSON data, do
//
//     final contactsResponse = contactsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'contacts_response.freezed.dart';
part 'contacts_response.g.dart';

ContactsResponse contactsResponseFromJson(String str) =>
    ContactsResponse.fromJson(json.decode(str));

String contactsResponseToJson(ContactsResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class ContactsResponse with _$ContactsResponse {
  const factory ContactsResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") List<ContactsData>? data,
  }) = _ContactsResponse;

  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);
}

@freezed
abstract class ContactsData with _$ContactsData {
  const factory ContactsData({
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
    @JsonKey(name: "notes") List<Note>? notes,
    @JsonKey(name: "cards") List<Card>? cards,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _ContactsData;

  factory ContactsData.fromJson(Map<String, dynamic> json) =>
      _$ContactsDataFromJson(json);
}

@freezed
abstract class Card with _$Card {
  const factory Card({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "url") String? url,
    @JsonKey(name: "thumbnail") String? thumbnail,
    @JsonKey(name: "preview") String? preview,
    @JsonKey(name: "file_name") String? fileName,
    @JsonKey(name: "mime_type") String? mimeType,
    @JsonKey(name: "size") int? size,
  }) = _Card;

  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);
}

@freezed
abstract class Note with _$Note {
  const factory Note({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
  }) = _Note;

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
}

extension ContactsDataSafeFields on ContactsData {
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
