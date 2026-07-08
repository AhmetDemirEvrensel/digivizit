// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_card_scan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessCardScanResponse _$BusinessCardScanResponseFromJson(
  Map<String, dynamic> json,
) => _BusinessCardScanResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : BusinessCardScanResult.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BusinessCardScanResponseToJson(
  _BusinessCardScanResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_BusinessCardScanResult _$BusinessCardScanResultFromJson(
  Map<String, dynamic> json,
) => _BusinessCardScanResult(
  engine: json['engine'] as String?,
  data: json['data'] == null
      ? null
      : BusinessCardScanData.fromJson(json['data'] as Map<String, dynamic>),
  image: json['image'] as String?,
);

Map<String, dynamic> _$BusinessCardScanResultToJson(
  _BusinessCardScanResult instance,
) => <String, dynamic>{
  'engine': instance.engine,
  'data': instance.data,
  'image': instance.image,
};

_BusinessCardScanData _$BusinessCardScanDataFromJson(
  Map<String, dynamic> json,
) => _BusinessCardScanData(
  companyName: json['company_name'] as String?,
  nameSurname: (json['name_surname'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  unvan: (json['unvan'] as List<dynamic>?)?.map((e) => e as String).toList(),
  emailList: (json['email_list'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  phoneList: json['phone_list'] == null
      ? null
      : ScanPhoneList.fromJson(json['phone_list'] as Map<String, dynamic>),
  sector: json['sector'] as String?,
  website: json['website'] as String?,
  address: json['address'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  country: json['country'] as String?,
  countryId: (json['country_id'] as num?)?.toInt(),
  note: json['note'] as String?,
);

Map<String, dynamic> _$BusinessCardScanDataToJson(
  _BusinessCardScanData instance,
) => <String, dynamic>{
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
  'country_id': instance.countryId,
  'note': instance.note,
};

_ScanPhoneList _$ScanPhoneListFromJson(Map<String, dynamic> json) =>
    _ScanPhoneList(
      landline: json['landline'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$ScanPhoneListToJson(_ScanPhoneList instance) =>
    <String, dynamic>{'landline': instance.landline, 'mobile': instance.mobile};
