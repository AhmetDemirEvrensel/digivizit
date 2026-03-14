// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firm_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FirmSettingsResponse _$FirmSettingsResponseFromJson(
  Map<String, dynamic> json,
) => _FirmSettingsResponse(
  success: json['success'] as bool,
  message: json['message'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => Datum.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FirmSettingsResponseToJson(
  _FirmSettingsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_Datum _$DatumFromJson(Map<String, dynamic> json) => _Datum(
  id: (json['id'] as num).toInt(),
  firmName: json['firm_name'] as String,
  website: json['website'] as String?,
  instagramUrl: json['instagram_url'] as String,
  linkedinUrl: json['linkedin_url'] as String,
  youtubeVideoUrl: json['youtube_video_url'] as String?,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
  logo: Logo.fromJson(json['logo'] as Map<String, dynamic>),
  mainBackground: Logo.fromJson(
    json['main_background'] as Map<String, dynamic>,
  ),
  catalogTr: json['catalog_tr'] == null
      ? null
      : Catalog.fromJson(json['catalog_tr'] as Map<String, dynamic>),
  catalogEn: json['catalog_en'] == null
      ? null
      : Catalog.fromJson(json['catalog_en'] as Map<String, dynamic>),
  media: (json['media'] as List<dynamic>)
      .map((e) => Media.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DatumToJson(_Datum instance) => <String, dynamic>{
  'id': instance.id,
  'firm_name': instance.firmName,
  'website': instance.website,
  'instagram_url': instance.instagramUrl,
  'linkedin_url': instance.linkedinUrl,
  'youtube_video_url': instance.youtubeVideoUrl,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt,
  'logo': instance.logo,
  'main_background': instance.mainBackground,
  'catalog_tr': instance.catalogTr,
  'catalog_en': instance.catalogEn,
  'media': instance.media,
};

_Catalog _$CatalogFromJson(Map<String, dynamic> json) => _Catalog(
  id: (json['id'] as num).toInt(),
  modelType: json['model_type'] as String,
  modelId: (json['model_id'] as num).toInt(),
  uuid: json['uuid'] as String,
  collectionName: json['collection_name'] as String,
  name: json['name'] as String,
  fileName: json['file_name'] as String,
  mimeType: json['mime_type'] as String,
  disk: json['disk'] as String,
  conversionsDisk: json['conversions_disk'] as String,
  size: (json['size'] as num).toInt(),
  manipulations: json['manipulations'] as List<dynamic>,
  customProperties: json['custom_properties'] as List<dynamic>,
  generatedConversions: json['generated_conversions'] as List<dynamic>,
  responsiveImages: json['responsive_images'] as List<dynamic>,
  orderColumn: (json['order_column'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  originalUrl: json['original_url'] as String,
  previewUrl: json['preview_url'] as String,
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
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'original_url': instance.originalUrl,
  'preview_url': instance.previewUrl,
};

_Logo _$LogoFromJson(Map<String, dynamic> json) => _Logo(
  id: (json['id'] as num).toInt(),
  modelType: json['model_type'] as String,
  modelId: (json['model_id'] as num).toInt(),
  uuid: json['uuid'] as String,
  collectionName: json['collection_name'] as String,
  name: json['name'] as String,
  fileName: json['file_name'] as String,
  mimeType: json['mime_type'] as String,
  disk: json['disk'] as String,
  conversionsDisk: json['conversions_disk'] as String,
  size: (json['size'] as num).toInt(),
  manipulations: json['manipulations'] as List<dynamic>,
  customProperties: json['custom_properties'] as List<dynamic>,
  generatedConversions: GeneratedConversionsClass.fromJson(
    json['generated_conversions'] as Map<String, dynamic>,
  ),
  responsiveImages: json['responsive_images'] as List<dynamic>,
  orderColumn: (json['order_column'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  url: json['url'] as String?,
  thumbnail: json['thumbnail'] as String?,
  preview: json['preview'] as String?,
  originalUrl: json['original_url'] as String,
  previewUrl: json['preview_url'] as String,
);

Map<String, dynamic> _$LogoToJson(_Logo instance) => <String, dynamic>{
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
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'url': instance.url,
  'thumbnail': instance.thumbnail,
  'preview': instance.preview,
  'original_url': instance.originalUrl,
  'preview_url': instance.previewUrl,
};

_GeneratedConversionsClass _$GeneratedConversionsClassFromJson(
  Map<String, dynamic> json,
) => _GeneratedConversionsClass(
  thumb: json['thumb'] as bool,
  preview: json['preview'] as bool,
);

Map<String, dynamic> _$GeneratedConversionsClassToJson(
  _GeneratedConversionsClass instance,
) => <String, dynamic>{'thumb': instance.thumb, 'preview': instance.preview};

_Media _$MediaFromJson(Map<String, dynamic> json) => _Media(
  id: (json['id'] as num).toInt(),
  modelType: json['model_type'] as String,
  modelId: (json['model_id'] as num).toInt(),
  uuid: json['uuid'] as String,
  collectionName: json['collection_name'] as String,
  name: json['name'] as String,
  fileName: json['file_name'] as String,
  mimeType: json['mime_type'] as String,
  disk: json['disk'] as String,
  conversionsDisk: json['conversions_disk'] as String,
  size: (json['size'] as num).toInt(),
  manipulations: json['manipulations'] as List<dynamic>,
  customProperties: json['custom_properties'] as List<dynamic>,
  generatedConversions: json['generated_conversions'],
  responsiveImages: json['responsive_images'] as List<dynamic>,
  orderColumn: (json['order_column'] as num).toInt(),
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  url: json['url'] as String?,
  thumbnail: json['thumbnail'] as String?,
  preview: json['preview'] as String?,
  originalUrl: json['original_url'] as String,
  previewUrl: json['preview_url'] as String,
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
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'url': instance.url,
  'thumbnail': instance.thumbnail,
  'preview': instance.preview,
  'original_url': instance.originalUrl,
  'preview_url': instance.previewUrl,
};
