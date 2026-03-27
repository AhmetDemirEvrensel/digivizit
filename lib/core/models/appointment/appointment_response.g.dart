// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppointmentResponse _$AppointmentResponseFromJson(Map<String, dynamic> json) =>
    _AppointmentResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentResponseToJson(
  _AppointmentResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_Datum _$DatumFromJson(Map<String, dynamic> json) => _Datum(
  id: (json['id'] as num?)?.toInt(),
  employeeId: (json['employee_id'] as num?)?.toInt(),
  fullName: json['full_name'] as String?,
  company: json['company'] as String?,
  subject: json['subject'] as String?,
  note: json['note'] as String?,
  preferredDate: json['preferred_date'] as String?,
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
  employee: json['employee'] == null
      ? null
      : Employee.fromJson(json['employee'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DatumToJson(_Datum instance) => <String, dynamic>{
  'id': instance.id,
  'employee_id': instance.employeeId,
  'full_name': instance.fullName,
  'company': instance.company,
  'subject': instance.subject,
  'note': instance.note,
  'preferred_date': instance.preferredDate,
  'status': instance.status,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt,
  'employee': instance.employee,
};

_Employee _$EmployeeFromJson(Map<String, dynamic> json) => _Employee(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
  title: json['title'] as String?,
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  extensionNumber: json['extension_number'] as String?,
  qr: (json['qr'] as num?)?.toInt(),
  qrCodeUrl: json['qr_code_url'] as String?,
  instagramUrl: json['instagram_url'],
  linkedinUrl: json['linkedin_url'],
  appointmentStatus: json['appointment_status'] as String?,
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  status: json['status'] as String?,
  slug: json['slug'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
  firmNameId: (json['firm_name_id'] as num?)?.toInt(),
  departmentId: (json['department_id'] as num?)?.toInt(),
  officeAddressId: (json['office_address_id'] as num?)?.toInt(),
  titleEn: json['title_en'] as String?,
  department: json['department'] == null
      ? null
      : Department.fromJson(json['department'] as Map<String, dynamic>),
  departmentEn: json['department_en'],
  photo: json['photo'] == null
      ? null
      : Photo.fromJson(json['photo'] as Map<String, dynamic>),
  qrPhoto: json['qr_photo'] == null
      ? null
      : Photo.fromJson(json['qr_photo'] as Map<String, dynamic>),
  media: (json['media'] as List<dynamic>?)
      ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$EmployeeToJson(_Employee instance) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'title': instance.title,
  'email': instance.email,
  'phone': instance.phone,
  'extension_number': instance.extensionNumber,
  'qr': instance.qr,
  'qr_code_url': instance.qrCodeUrl,
  'instagram_url': instance.instagramUrl,
  'linkedin_url': instance.linkedinUrl,
  'appointment_status': instance.appointmentStatus,
  'date': instance.date?.toIso8601String(),
  'status': instance.status,
  'slug': instance.slug,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt,
  'firm_name_id': instance.firmNameId,
  'department_id': instance.departmentId,
  'office_address_id': instance.officeAddressId,
  'title_en': instance.titleEn,
  'department': instance.department,
  'department_en': instance.departmentEn,
  'photo': instance.photo,
  'qr_photo': instance.qrPhoto,
  'media': instance.media,
};

_Department _$DepartmentFromJson(Map<String, dynamic> json) => _Department(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  nameEn: json['name_en'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
  bannerBackground: json['banner_background'] == null
      ? null
      : Photo.fromJson(json['banner_background'] as Map<String, dynamic>),
  media: (json['media'] as List<dynamic>?)
      ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DepartmentToJson(_Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'name_en': instance.nameEn,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
      'banner_background': instance.bannerBackground,
      'media': instance.media,
    };

_Photo _$PhotoFromJson(Map<String, dynamic> json) => _Photo(
  id: (json['id'] as num?)?.toInt(),
  modelType: json['model_type'] as String?,
  modelId: (json['model_id'] as num?)?.toInt(),
  uuid: json['uuid'] as String?,
  collectionName: json['collection_name'] as String?,
  name: json['name'] as String?,
  fileName: json['file_name'] as String?,
  mimeType: json['mime_type'] as String?,
  disk: json['disk'] as String?,
  conversionsDisk: json['conversions_disk'] as String?,
  size: (json['size'] as num?)?.toInt(),
  manipulations: json['manipulations'] as List<dynamic>?,
  customProperties: json['custom_properties'] as List<dynamic>?,
  generatedConversions: json['generated_conversions'] == null
      ? null
      : GeneratedConversions.fromJson(
          json['generated_conversions'] as Map<String, dynamic>,
        ),
  responsiveImages: json['responsive_images'] as List<dynamic>?,
  orderColumn: (json['order_column'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  originalUrl: json['original_url'] as String?,
  previewUrl: json['preview_url'] as String?,
  url: json['url'] as String?,
  thumbnail: json['thumbnail'] as String?,
  preview: json['preview'] as String?,
);

Map<String, dynamic> _$PhotoToJson(_Photo instance) => <String, dynamic>{
  'id': instance.id,
  'model_type': instance.modelType,
  'model_id': instance.modelId,
  'uuid': instance.uuid,
  'collection_name': instance.collectionName,
  'name': instance.name,
  'file_name': instance.fileName,
  'mime_type': instance.mimeType,
  'disk': instance.disk,
  'conversions_disk': instance.conversionsDisk,
  'size': instance.size,
  'manipulations': instance.manipulations,
  'custom_properties': instance.customProperties,
  'generated_conversions': instance.generatedConversions,
  'responsive_images': instance.responsiveImages,
  'order_column': instance.orderColumn,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'original_url': instance.originalUrl,
  'preview_url': instance.previewUrl,
  'url': instance.url,
  'thumbnail': instance.thumbnail,
  'preview': instance.preview,
};

_GeneratedConversions _$GeneratedConversionsFromJson(
  Map<String, dynamic> json,
) => _GeneratedConversions(
  thumb: json['thumb'] as bool?,
  preview: json['preview'] as bool?,
);

Map<String, dynamic> _$GeneratedConversionsToJson(
  _GeneratedConversions instance,
) => <String, dynamic>{'thumb': instance.thumb, 'preview': instance.preview};
