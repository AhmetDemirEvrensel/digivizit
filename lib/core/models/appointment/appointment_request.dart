// To parse this JSON data, do
//
//     final appointmentRequest = appointmentRequestFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'appointment_request.freezed.dart';
part 'appointment_request.g.dart';

AppointmentRequest appointmentRequestFromJson(String str) => AppointmentRequest.fromJson(json.decode(str));

String appointmentRequestToJson(AppointmentRequest data) => json.encode(data.toJson());

@freezed
class AppointmentRequest with _$AppointmentRequest {
    const factory AppointmentRequest({
        @JsonKey(name: "employee_id")
        required int employeeId,
        @JsonKey(name: "full_name")
        required String fullName,
        @JsonKey(name: "company")
        required String company,
        @JsonKey(name: "subject")
        required String subject,
        @JsonKey(name: "note")
        required String note,
        @JsonKey(name: "preferred_date")
        required String preferredDate,
        @JsonKey(name: "status")
        required String status,
    }) = _AppointmentRequest;

    factory AppointmentRequest.fromJson(Map<String, dynamic> json) => _$AppointmentRequestFromJson(json);
}
