// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BusinessCardListResponse _$BusinessCardListResponseFromJson(
  Map<String, dynamic> json,
) => _BusinessCardListResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : BusinessCardListData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BusinessCardListResponseToJson(
  _BusinessCardListResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_BusinessCardListData _$BusinessCardListDataFromJson(
  Map<String, dynamic> json,
) => _BusinessCardListData(
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => BusinessCardListItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  meta: json['meta'] == null
      ? null
      : PageMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BusinessCardListDataToJson(
  _BusinessCardListData instance,
) => <String, dynamic>{'items': instance.items, 'meta': instance.meta};

_BusinessCardListItem _$BusinessCardListItemFromJson(
  Map<String, dynamic> json,
) => _BusinessCardListItem(
  id: (json['id'] as num?)?.toInt(),
  companyName: json['company_name'] as String?,
  sector: json['sector'] as String?,
  primaryContact: json['primary_contact'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  thumbnail: json['thumbnail'] as String?,
  hasImage: json['has_image'] as bool?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$BusinessCardListItemToJson(
  _BusinessCardListItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'company_name': instance.companyName,
  'sector': instance.sector,
  'primary_contact': instance.primaryContact,
  'phone': instance.phone,
  'email': instance.email,
  'thumbnail': instance.thumbnail,
  'has_image': instance.hasImage,
  'created_at': instance.createdAt,
};

_BusinessCardDetailResponse _$BusinessCardDetailResponseFromJson(
  Map<String, dynamic> json,
) => _BusinessCardDetailResponse(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : BusinessCardDetailData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BusinessCardDetailResponseToJson(
  _BusinessCardDetailResponse instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

_BusinessCardDetailData _$BusinessCardDetailDataFromJson(
  Map<String, dynamic> json,
) => _BusinessCardDetailData(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
  companyName: json['company_name'] as String?,
  nameSurname: (json['name_surname'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  unvan: (json['unvan'] as List<dynamic>?)?.map((e) => e as String).toList(),
  emailList: (json['email_list'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  phoneList: (json['phone_list'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  website: json['website'] as String?,
  address: json['address'] as String?,
  sector: json['sector'] as String?,
  countryId: (json['country_id'] as num?)?.toInt(),
  country: json['country'] as String?,
  notes: (json['notes'] as List<dynamic>?)
      ?.map((e) => BusinessCardNote.fromJson(e as Map<String, dynamic>))
      .toList(),
  cards: (json['cards'] as List<dynamic>?)
      ?.map((e) => BusinessCardImage.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$BusinessCardDetailDataToJson(
  _BusinessCardDetailData instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'company_name': instance.companyName,
  'name_surname': instance.nameSurname,
  'unvan': instance.unvan,
  'email_list': instance.emailList,
  'phone_list': instance.phoneList,
  'email': instance.email,
  'phone': instance.phone,
  'website': instance.website,
  'address': instance.address,
  'sector': instance.sector,
  'country_id': instance.countryId,
  'country': instance.country,
  'notes': instance.notes,
  'cards': instance.cards,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};

_BusinessCardImage _$BusinessCardImageFromJson(Map<String, dynamic> json) =>
    _BusinessCardImage(
      id: (json['id'] as num?)?.toInt(),
      url: json['url'] as String?,
      thumbnail: json['thumbnail'] as String?,
      preview: json['preview'] as String?,
      fileName: json['file_name'] as String?,
      mimeType: json['mime_type'] as String?,
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BusinessCardImageToJson(_BusinessCardImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'thumbnail': instance.thumbnail,
      'preview': instance.preview,
      'file_name': instance.fileName,
      'mime_type': instance.mimeType,
      'size': instance.size,
    };

_BusinessCardNote _$BusinessCardNoteFromJson(Map<String, dynamic> json) =>
    _BusinessCardNote(
      id: (json['id'] as num?)?.toInt(),
      tenantId: (json['tenant_id'] as num?)?.toInt(),
      businessCardId: (json['business_card_id'] as num?)?.toInt(),
      note: json['note'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$BusinessCardNoteToJson(_BusinessCardNote instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'business_card_id': instance.businessCardId,
      'note': instance.note,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
