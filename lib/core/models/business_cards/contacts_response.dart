// To parse this JSON data, do
//
//     final contactsResponse = contactsResponseFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'contacts_response.freezed.dart';
part 'contacts_response.g.dart';

ContactsResponse contactsResponseFromJson(String str) => ContactsResponse.fromJson(json.decode(str));

String contactsResponseToJson(ContactsResponse data) => json.encode(data.toJson());

@freezed
abstract class ContactsResponse with _$ContactsResponse {
    const factory ContactsResponse({
        @JsonKey(name: "success")
        required bool success,
        @JsonKey(name: "message")
        required String message,
        @JsonKey(name: "data")
        required List<ContactsData> data,
    }) = _ContactsResponse;

    factory ContactsResponse.fromJson(Map<String, dynamic> json) => _$ContactsResponseFromJson(json);
}

@freezed
abstract class ContactsData with _$ContactsData {
    const factory ContactsData({
        @JsonKey(name: "id")
        required int id,
        @JsonKey(name: "user_id")
        required int userId,
        @JsonKey(name: "company_name")
        required String companyName,
        @JsonKey(name: "name_surname")
        required List<String> nameSurname,
        @JsonKey(name: "unvan")
        required List<String> unvan,
        @JsonKey(name: "email_list")
        required List<String> emailList,
        @JsonKey(name: "phone_list")
        required List<String> phoneList,
        @JsonKey(name: "email")
        required String email,
        @JsonKey(name: "phone")
        required String phone,
        @JsonKey(name: "website")
        required String website,
        @JsonKey(name: "address")
        required String address,
        @JsonKey(name: "sector")
        required String sector,
        @JsonKey(name: "country_id")
        required int countryId,
        @JsonKey(name: "country")
        required String country,
        @JsonKey(name: "note")
        required dynamic note,
        @JsonKey(name: "cards")
        required List<dynamic> cards,
        @JsonKey(name: "created_at")
        required DateTime createdAt,
        @JsonKey(name: "updated_at")
        required DateTime updatedAt,
    }) = _ContactsData;

    factory ContactsData.fromJson(Map<String, dynamic> json) => _$ContactsDataFromJson(json);
}
