// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employees_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeesRequest _$EmployeesRequestFromJson(Map<String, dynamic> json) =>
    _EmployeesRequest(
      name: json['name'] as String,
      surname: json['surname'] as String,
      firmNameId: (json['firm_name_id'] as num).toInt(),
      departmentId: (json['department_id'] as num).toInt(),
      officeAddressId: (json['office_address_id'] as num).toInt(),
      title: json['title'] as String,
      titleEn: json['title_en'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      extensionNumber: json['extension_number'] as String,
      status: json['status'] as String,
      appointmentStatus: json['appointment_status'] as String,
      instagramUrl: json['instagram_url'] as String,
      linkedinUrl: json['linkedin_url'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$EmployeesRequestToJson(_EmployeesRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'firm_name_id': instance.firmNameId,
      'department_id': instance.departmentId,
      'office_address_id': instance.officeAddressId,
      'title': instance.title,
      'title_en': instance.titleEn,
      'email': instance.email,
      'phone': instance.phone,
      'extension_number': instance.extensionNumber,
      'status': instance.status,
      'appointment_status': instance.appointmentStatus,
      'instagram_url': instance.instagramUrl,
      'linkedin_url': instance.linkedinUrl,
      'photo': instance.photo,
    };
