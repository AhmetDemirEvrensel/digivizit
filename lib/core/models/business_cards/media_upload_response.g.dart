// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MediaUploadResponse _$MediaUploadResponseFromJson(Map<String, dynamic> json) =>
    _MediaUploadResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : MediaUploadData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaUploadResponseToJson(
  _MediaUploadResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_MediaUploadData _$MediaUploadDataFromJson(Map<String, dynamic> json) =>
    _MediaUploadData(
      name: json['name'] as String?,
      originalName: json['original_name'] as String?,
    );

Map<String, dynamic> _$MediaUploadDataToJson(_MediaUploadData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'original_name': instance.originalName,
    };
