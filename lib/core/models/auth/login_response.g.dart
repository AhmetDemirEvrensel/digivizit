// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LoginData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_LoginData _$LoginDataFromJson(Map<String, dynamic> json) => _LoginData(
  token: json['token'] as String,
  tokenType: json['token_type'] as String?,
  me: LoginMe.fromJson(json['me'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginDataToJson(_LoginData instance) =>
    <String, dynamic>{
      'token': instance.token,
      'token_type': instance.tokenType,
      'me': instance.me,
    };

_LoginMe _$LoginMeFromJson(Map<String, dynamic> json) => _LoginMe(
  user: LoginUser.fromJson(json['user'] as Map<String, dynamic>),
  employee: json['employee'] == null
      ? null
      : LoginEmployee.fromJson(json['employee'] as Map<String, dynamic>),
  tenant: json['tenant'] == null
      ? null
      : LoginTenant.fromJson(json['tenant'] as Map<String, dynamic>),
  limits: json['limits'] == null
      ? null
      : LoginLimits.fromJson(json['limits'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LoginMeToJson(_LoginMe instance) => <String, dynamic>{
  'user': instance.user,
  'employee': instance.employee,
  'tenant': instance.tenant,
  'limits': instance.limits,
};

_LoginUser _$LoginUserFromJson(Map<String, dynamic> json) => _LoginUser(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String,
  email: json['email'] as String?,
);

Map<String, dynamic> _$LoginUserToJson(_LoginUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };

_LoginEmployee _$LoginEmployeeFromJson(Map<String, dynamic> json) =>
    _LoginEmployee(
      id: (json['id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      title: json['title'] as String?,
      titleEn: json['title_en'] as String?,
      appointmentStatus: json['appointment_status'] as String?,
      photoUrl: json['photo_url'] as String?,
      photoThumbUrl: json['photo_thumb_url'] as String?,
    );

Map<String, dynamic> _$LoginEmployeeToJson(_LoginEmployee instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'title': instance.title,
      'title_en': instance.titleEn,
      'appointment_status': instance.appointmentStatus,
      'photo_url': instance.photoUrl,
      'photo_thumb_url': instance.photoThumbUrl,
    };

_LoginTenant _$LoginTenantFromJson(Map<String, dynamic> json) => _LoginTenant(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  slug: json['slug'] as String?,
);

Map<String, dynamic> _$LoginTenantToJson(_LoginTenant instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };

_LoginLimits _$LoginLimitsFromJson(Map<String, dynamic> json) => _LoginLimits(
  current: (json['current'] as num?)?.toInt(),
  max: (json['max'] as num?)?.toInt(),
  hasLicense: json['has_license'] as bool?,
);

Map<String, dynamic> _$LoginLimitsToJson(_LoginLimits instance) =>
    <String, dynamic>{
      'current': instance.current,
      'max': instance.max,
      'has_license': instance.hasLicense,
    };
