// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firm_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FirmAddressResponse _$FirmAddressResponseFromJson(Map<String, dynamic> json) =>
    _FirmAddressResponse(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FirmAddressResponseToJson(
  _FirmAddressResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_Datum _$DatumFromJson(Map<String, dynamic> json) => _Datum(
  id: (json['id'] as num).toInt(),
  addressName: json['address_name'] as String,
  streetAddress: json['street_address'] as String,
  phone: json['phone'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  updatedAt: DateTime.parse(json['updated_at'] as String),
  deletedAt: json['deleted_at'],
);

Map<String, dynamic> _$DatumToJson(_Datum instance) => <String, dynamic>{
  'id': instance.id,
  'address_name': instance.addressName,
  'street_address': instance.streetAddress,
  'phone': instance.phone,
  'created_at': instance.createdAt.toIso8601String(),
  'updated_at': instance.updatedAt.toIso8601String(),
  'deleted_at': instance.deletedAt,
};
