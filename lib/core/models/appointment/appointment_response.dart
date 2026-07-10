// To parse this JSON data, do
//
//     final appointmentListResponse = appointmentListResponseFromJson(jsonString);

import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:digivizit/core/models/common/page_meta.dart';

part 'appointment_response.freezed.dart';
part 'appointment_response.g.dart';

AppointmentListResponse appointmentListResponseFromJson(String str) =>
    AppointmentListResponse.fromJson(json.decode(str));

String appointmentListResponseToJson(AppointmentListResponse data) =>
    json.encode(data.toJson());

AppointmentDetailResponse appointmentDetailResponseFromJson(String str) =>
    AppointmentDetailResponse.fromJson(json.decode(str));

String appointmentDetailResponseToJson(AppointmentDetailResponse data) =>
    json.encode(data.toJson());

@freezed
abstract class AppointmentListResponse with _$AppointmentListResponse {
  const factory AppointmentListResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") AppointmentListData? data,
  }) = _AppointmentListResponse;

  factory AppointmentListResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentListResponseFromJson(json);
}

@freezed
abstract class AppointmentListData with _$AppointmentListData {
  const factory AppointmentListData({
    @JsonKey(name: "items") List<AppointmentListItem>? items,
    @JsonKey(name: "meta") PageMeta? meta,
  }) = _AppointmentListData;

  factory AppointmentListData.fromJson(Map<String, dynamic> json) =>
      _$AppointmentListDataFromJson(json);
}

/// Also used as the `data` shape for Show/Approve/Reject (single-object responses).
@freezed
abstract class AppointmentListItem with _$AppointmentListItem {
  const factory AppointmentListItem({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "email") String? email,
    @JsonKey(name: "phone") String? phone,
    @JsonKey(name: "company") String? company,
    @JsonKey(name: "subject") String? subject,
    @JsonKey(name: "note") String? note,
    @JsonKey(name: "preferred_date") String? preferredDate,
    @JsonKey(name: "status") String? status,
    @JsonKey(name: "status_label") String? statusLabel,
    @JsonKey(name: "created_at") String? createdAt,
  }) = _AppointmentListItem;

  factory AppointmentListItem.fromJson(Map<String, dynamic> json) =>
      _$AppointmentListItemFromJson(json);
}

@freezed
abstract class AppointmentDetailResponse with _$AppointmentDetailResponse {
  const factory AppointmentDetailResponse({
    @JsonKey(name: "success") bool? success,
    @JsonKey(name: "message") String? message,
    @JsonKey(name: "data") AppointmentListItem? data,
  }) = _AppointmentDetailResponse;

  factory AppointmentDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$AppointmentDetailResponseFromJson(json);
}
