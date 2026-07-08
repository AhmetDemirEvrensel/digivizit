// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QrResponse _$QrResponseFromJson(Map<String, dynamic> json) => _QrResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : QrData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QrResponseToJson(_QrResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_QrData _$QrDataFromJson(Map<String, dynamic> json) => _QrData(
  qrCodeUrl: json['qr_code_url'] as String?,
  qrPhotoUrl: json['qr_photo_url'] as String?,
  qrPhotoThumbnail: json['qr_photo_thumbnail'] as String?,
  qrPhotoPreview: json['qr_photo_preview'] as String?,
);

Map<String, dynamic> _$QrDataToJson(_QrData instance) => <String, dynamic>{
  'qr_code_url': instance.qrCodeUrl,
  'qr_photo_url': instance.qrPhotoUrl,
  'qr_photo_thumbnail': instance.qrPhotoThumbnail,
  'qr_photo_preview': instance.qrPhotoPreview,
};
