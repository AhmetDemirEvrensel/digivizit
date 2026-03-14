// To parse this JSON data, do
//
//     final employeesRequest = employeesRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'employees_request.freezed.dart';
part 'employees_request.g.dart';

EmployeesRequest employeesRequestFromJson(String str) => EmployeesRequest.fromJson(json.decode(str));

String employeesRequestToJson(EmployeesRequest data) => json.encode(data.toJson());

@freezed
class EmployeesRequest with _$EmployeesRequest {
    const factory EmployeesRequest({
        @JsonKey(name: "name")
        required String name,
        @JsonKey(name: "surname")
        required String surname,
        @JsonKey(name: "firm_name_id")
        required int firmNameId,
        @JsonKey(name: "department_id")
        required int departmentId,
        @JsonKey(name: "office_address_id")
        required int officeAddressId,
        @JsonKey(name: "title")
        required String title,
        @JsonKey(name: "title_en")
        required String titleEn,
        @JsonKey(name: "email")
        required String email,
        @JsonKey(name: "phone")
        required String phone,
        @JsonKey(name: "extension_number")
        required String extensionNumber,
        @JsonKey(name: "status")
        required String status,
        @JsonKey(name: "appointment_status")
        required String appointmentStatus,
        @JsonKey(name: "instagram_url")
        required String instagramUrl,
        @JsonKey(name: "linkedin_url")
        required String linkedinUrl,
        @JsonKey(name: "photo")
        required String photo,
    }) = _EmployeesRequest;

    factory EmployeesRequest.fromJson(Map<String, dynamic> json) => _$EmployeesRequestFromJson(json);
}
