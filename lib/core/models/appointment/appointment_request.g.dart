// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppointmentRequest _$AppointmentRequestFromJson(Map<String, dynamic> json) =>
    _AppointmentRequest(
      employeeId: (json['employee_id'] as num).toInt(),
      fullName: json['full_name'] as String,
      company: json['company'] as String,
      subject: json['subject'] as String,
      note: json['note'] as String,
      preferredDate: json['preferred_date'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$AppointmentRequestToJson(_AppointmentRequest instance) =>
    <String, dynamic>{
      'employee_id': instance.employeeId,
      'full_name': instance.fullName,
      'company': instance.company,
      'subject': instance.subject,
      'note': instance.note,
      'preferred_date': instance.preferredDate,
      'status': instance.status,
    };
