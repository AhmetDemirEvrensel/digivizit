// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppointmentListResponse _$AppointmentListResponseFromJson(
  Map<String, dynamic> json,
) => _AppointmentListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : AppointmentListData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppointmentListResponseToJson(
  _AppointmentListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_AppointmentListData _$AppointmentListDataFromJson(Map<String, dynamic> json) =>
    _AppointmentListData(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => AppointmentListItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] == null
          ? null
          : PageMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppointmentListDataToJson(
  _AppointmentListData instance,
) => <String, dynamic>{'items': instance.items, 'meta': instance.meta};

_AppointmentListItem _$AppointmentListItemFromJson(Map<String, dynamic> json) =>
    _AppointmentListItem(
      id: (json['id'] as num?)?.toInt(),
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      company: json['company'] as String?,
      subject: json['subject'] as String?,
      note: json['note'] as String?,
      preferredDate: json['preferred_date'] as String?,
      status: json['status'] as String?,
      statusLabel: json['status_label'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$AppointmentListItemToJson(
  _AppointmentListItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'full_name': instance.fullName,
  'email': instance.email,
  'phone': instance.phone,
  'company': instance.company,
  'subject': instance.subject,
  'note': instance.note,
  'preferred_date': instance.preferredDate,
  'status': instance.status,
  'status_label': instance.statusLabel,
  'created_at': instance.createdAt,
};

_AppointmentDetailResponse _$AppointmentDetailResponseFromJson(
  Map<String, dynamic> json,
) => _AppointmentDetailResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : AppointmentListItem.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AppointmentDetailResponseToJson(
  _AppointmentDetailResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
