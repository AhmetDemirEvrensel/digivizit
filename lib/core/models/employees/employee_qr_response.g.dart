// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_qr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EmployeeQrResponse _$EmployeeQrResponseFromJson(Map<String, dynamic> json) =>
    _EmployeeQrResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => EmployeeQrData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EmployeeQrResponseToJson(_EmployeeQrResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_EmployeeQrData _$EmployeeQrDataFromJson(
  Map<String, dynamic> json,
) => _EmployeeQrData(
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
  firmName: json['firm_name'] == null
      ? null
      : FirmName.fromJson(json['firm_name'] as Map<String, dynamic>),
  officeAddress: json['office_address'] == null
      ? null
      : OfficeAddress.fromJson(json['office_address'] as Map<String, dynamic>),
  media: (json['media'] as List<dynamic>?)
      ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
      .toList(),
  qrPhotoUrl: json['qr_photo_url'] as String?,
  qrPhotoThumbnail: json['qr_photo_thumbnail'] as String?,
  qrPhotoPreview: json['qr_photo_preview'] as String?,
);

Map<String, dynamic> _$EmployeeQrDataToJson(_EmployeeQrData instance) =>
    <String, dynamic>{
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
      'firm_name': instance.firmName,
      'office_address': instance.officeAddress,
      'media': instance.media,
      'qr_photo_url': instance.qrPhotoUrl,
      'qr_photo_thumbnail': instance.qrPhotoThumbnail,
      'qr_photo_preview': instance.qrPhotoPreview,
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
      : GeneratedConversionsClass.fromJson(
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

_GeneratedConversionsClass _$GeneratedConversionsClassFromJson(
  Map<String, dynamic> json,
) => _GeneratedConversionsClass(
  thumb: json['thumb'] as bool?,
  preview: json['preview'] as bool?,
);

Map<String, dynamic> _$GeneratedConversionsClassToJson(
  _GeneratedConversionsClass instance,
) => <String, dynamic>{'thumb': instance.thumb, 'preview': instance.preview};

_FirmName _$FirmNameFromJson(Map<String, dynamic> json) => _FirmName(
  id: (json['id'] as num?)?.toInt(),
  firmName: json['firm_name'] as String?,
  website: json['website'] as String?,
  instagramUrl: json['instagram_url'] as String?,
  linkedinUrl: json['linkedin_url'] as String?,
  youtubeVideoUrl: json['youtube_video_url'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
  logo: json['logo'] == null
      ? null
      : Photo.fromJson(json['logo'] as Map<String, dynamic>),
  mainBackground: json['main_background'] == null
      ? null
      : Photo.fromJson(json['main_background'] as Map<String, dynamic>),
  catalogTr: json['catalog_tr'] == null
      ? null
      : Catalog.fromJson(json['catalog_tr'] as Map<String, dynamic>),
  catalogEn: json['catalog_en'] == null
      ? null
      : Catalog.fromJson(json['catalog_en'] as Map<String, dynamic>),
  media: (json['media'] as List<dynamic>?)
      ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FirmNameToJson(_FirmName instance) => <String, dynamic>{
  'id': instance.id,
  'firm_name': instance.firmName,
  'website': instance.website,
  'instagram_url': instance.instagramUrl,
  'linkedin_url': instance.linkedinUrl,
  'youtube_video_url': instance.youtubeVideoUrl,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
  'deleted_at': instance.deletedAt,
  'logo': instance.logo,
  'main_background': instance.mainBackground,
  'catalog_tr': instance.catalogTr,
  'catalog_en': instance.catalogEn,
  'media': instance.media,
};

_Catalog _$CatalogFromJson(Map<String, dynamic> json) => _Catalog(
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
  generatedConversions: json['generated_conversions'] as List<dynamic>?,
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
);

Map<String, dynamic> _$CatalogToJson(_Catalog instance) => <String, dynamic>{
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
};

_Media _$MediaFromJson(Map<String, dynamic> json) => _Media(
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
  generatedConversions: json['generated_conversions'],
  responsiveImages: json['responsive_images'] as List<dynamic>?,
  orderColumn: (json['order_column'] as num?)?.toInt(),
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
  url: json['url'] as String?,
  thumbnail: json['thumbnail'] as String?,
  preview: json['preview'] as String?,
  originalUrl: json['original_url'] as String?,
  previewUrl: json['preview_url'] as String?,
);

Map<String, dynamic> _$MediaToJson(_Media instance) => <String, dynamic>{
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
  'url': instance.url,
  'thumbnail': instance.thumbnail,
  'preview': instance.preview,
  'original_url': instance.originalUrl,
  'preview_url': instance.previewUrl,
};

_OfficeAddress _$OfficeAddressFromJson(Map<String, dynamic> json) =>
    _OfficeAddress(
      id: (json['id'] as num?)?.toInt(),
      addressName: json['address_name'] as String?,
      streetAddress: json['street_address'] as String?,
      phone: json['phone'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$OfficeAddressToJson(_OfficeAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address_name': instance.addressName,
      'street_address': instance.streetAddress,
      'phone': instance.phone,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
