// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departments_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DepartmentsResponse _$DepartmentsResponseFromJson(Map<String, dynamic> json) =>
    _DepartmentsResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepartmentsResponseToJson(
  _DepartmentsResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_Datum _$DatumFromJson(Map<String, dynamic> json) => _Datum(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  nameEn: json['name_en'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
  bannerBackground: json['banner_background'] == null
      ? null
      : BannerBackground.fromJson(
          json['banner_background'] as Map<String, dynamic>,
        ),
  media: (json['media'] as List<dynamic>)
      .map((e) => BannerBackground.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DatumToJson(_Datum instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'name_en': instance.nameEn,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt,
  'banner_background': instance.bannerBackground,
  'media': instance.media,
};

_BannerBackground _$BannerBackgroundFromJson(Map<String, dynamic> json) =>
    _BannerBackground(
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
      generatedConversions: GeneratedConversions.fromJson(
        json['generated_conversions'] as Map<String, dynamic>,
      ),
      responsiveImages: json['responsive_images'] as List<dynamic>,
      orderColumn: (json['order_column'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      originalUrl: json['original_url'] as String,
      previewUrl: json['preview_url'] as String,
    );

Map<String, dynamic> _$BannerBackgroundToJson(_BannerBackground instance) =>
    <String, dynamic>{
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

_GeneratedConversions _$GeneratedConversionsFromJson(
  Map<String, dynamic> json,
) => _GeneratedConversions(
  thumb: json['thumb'] as bool,
  preview: json['preview'] as bool,
);

Map<String, dynamic> _$GeneratedConversionsToJson(
  _GeneratedConversions instance,
) => <String, dynamic>{'thumb': instance.thumb, 'preview': instance.preview};
