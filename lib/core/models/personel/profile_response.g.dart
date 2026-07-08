// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    _ProfileResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(_ProfileResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) => _ProfileData(
  id: (json['id'] as num?)?.toInt(),
  slug: json['slug'] as String?,
  fullName: json['full_name'] as String?,
  title: json['title'] as String?,
  titleEn: json['title_en'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  extensionNumber: json['extension_number'] as String?,
  instagramUrl: json['instagram_url'] as String?,
  linkedinUrl: json['linkedin_url'] as String?,
  appointmentStatus: json['appointment_status'] as String?,
  photoUrl: json['photo_url'] as String?,
  photoThumbUrl: json['photo_thumb_url'] as String?,
  department: json['department'] == null
      ? null
      : ProfileDepartment.fromJson(json['department'] as Map<String, dynamic>),
  firm: json['firm'] == null
      ? null
      : ProfileFirm.fromJson(json['firm'] as Map<String, dynamic>),
  officeAddress: json['office_address'] == null
      ? null
      : ProfileOfficeAddress.fromJson(
          json['office_address'] as Map<String, dynamic>,
        ),
  editableFields: (json['editable_fields'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ProfileDataToJson(_ProfileData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'full_name': instance.fullName,
      'title': instance.title,
      'title_en': instance.titleEn,
      'email': instance.email,
      'phone': instance.phone,
      'extension_number': instance.extensionNumber,
      'instagram_url': instance.instagramUrl,
      'linkedin_url': instance.linkedinUrl,
      'appointment_status': instance.appointmentStatus,
      'photo_url': instance.photoUrl,
      'photo_thumb_url': instance.photoThumbUrl,
      'department': instance.department,
      'firm': instance.firm,
      'office_address': instance.officeAddress,
      'editable_fields': instance.editableFields,
    };

_ProfileDepartment _$ProfileDepartmentFromJson(Map<String, dynamic> json) =>
    _ProfileDepartment(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      nameEn: json['name_en'] as String?,
    );

Map<String, dynamic> _$ProfileDepartmentToJson(_ProfileDepartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_en': instance.nameEn,
    };

_ProfileFirm _$ProfileFirmFromJson(Map<String, dynamic> json) => _ProfileFirm(
  id: (json['id'] as num?)?.toInt(),
  firmName: json['firm_name'] as String?,
);

Map<String, dynamic> _$ProfileFirmToJson(_ProfileFirm instance) =>
    <String, dynamic>{'id': instance.id, 'firm_name': instance.firmName};

_ProfileOfficeAddress _$ProfileOfficeAddressFromJson(
  Map<String, dynamic> json,
) => _ProfileOfficeAddress(
  id: (json['id'] as num?)?.toInt(),
  addressName: json['address_name'] as String?,
  streetAddress: json['street_address'] as String?,
  phone: json['phone'] as String?,
);

Map<String, dynamic> _$ProfileOfficeAddressToJson(
  _ProfileOfficeAddress instance,
) => <String, dynamic>{
  'id': instance.id,
  'address_name': instance.addressName,
  'street_address': instance.streetAddress,
  'phone': instance.phone,
};
