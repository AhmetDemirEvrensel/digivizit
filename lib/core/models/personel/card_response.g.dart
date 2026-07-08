// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardResponse _$CardResponseFromJson(Map<String, dynamic> json) =>
    _CardResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CardData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CardResponseToJson(_CardResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_CardData _$CardDataFromJson(Map<String, dynamic> json) => _CardData(
  name: json['name'] as String?,
  slug: json['slug'] as String?,
  title: json['title'] as String?,
  cardUrl: json['card_url'] as String?,
  vcardUrl: json['vcard_url'] as String?,
  qrCodeUrl: json['qr_code_url'] as String?,
  qrPhotoUrl: json['qr_photo_url'] as String?,
  photoUrl: json['photo_url'] as String?,
);

Map<String, dynamic> _$CardDataToJson(_CardData instance) => <String, dynamic>{
  'name': instance.name,
  'slug': instance.slug,
  'title': instance.title,
  'card_url': instance.cardUrl,
  'vcard_url': instance.vcardUrl,
  'qr_code_url': instance.qrCodeUrl,
  'qr_photo_url': instance.qrPhotoUrl,
  'photo_url': instance.photoUrl,
};
