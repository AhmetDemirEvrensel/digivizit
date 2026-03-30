// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ocr_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OcrResponse _$OcrResponseFromJson(Map<String, dynamic> json) => _OcrResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$OcrResponseToJson(_OcrResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
  companyName: json['company_name'] as String?,
  nameSurname: (json['name_surname'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  unvan: json['unvan'] as List<dynamic>?,
  emailList: (json['email_list'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  phoneList: json['phone_list'] == null
      ? null
      : PhoneList.fromJson(json['phone_list'] as Map<String, dynamic>),
  sector: json['sector'] as String?,
  website: json['website'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  country: json['country'] as String?,
  note: json['note'] as String?,
  countryId: (json['country_id'] as num?)?.toInt(),
);

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
  'company_name': instance.companyName,
  'name_surname': instance.nameSurname,
  'unvan': instance.unvan,
  'email_list': instance.emailList,
  'phone_list': instance.phoneList,
  'sector': instance.sector,
  'website': instance.website,
  'address': instance.address,
  'phone': instance.phone,
  'email': instance.email,
  'country': instance.country,
  'note': instance.note,
  'country_id': instance.countryId,
};

_PhoneList _$PhoneListFromJson(Map<String, dynamic> json) => _PhoneList(
  landline: json['landline'] as String?,
  mobile: json['mobile'] as String?,
);

Map<String, dynamic> _$PhoneListToJson(_PhoneList instance) =>
    <String, dynamic>{'landline': instance.landline, 'mobile': instance.mobile};
