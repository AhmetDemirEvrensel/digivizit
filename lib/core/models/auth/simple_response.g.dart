// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SimpleResponse _$SimpleResponseFromJson(Map<String, dynamic> json) =>
    _SimpleResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'],
    );

Map<String, dynamic> _$SimpleResponseToJson(_SimpleResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
