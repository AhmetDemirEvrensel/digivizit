// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContactsResponse _$ContactsResponseFromJson(Map<String, dynamic> json) =>
    _ContactsResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ContactsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContactsResponseToJson(_ContactsResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_ContactsData _$ContactsDataFromJson(Map<String, dynamic> json) =>
    _ContactsData(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      companyName: json['company_name'] as String?,
      nameSurname: (json['name_surname'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      unvan: (json['unvan'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
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
          ?.map((e) => Note.fromJson(e as Map<String, dynamic>))
          .toList(),
      cards: (json['cards'] as List<dynamic>?)
          ?.map((e) => Card.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$ContactsDataToJson(_ContactsData instance) =>
    <String, dynamic>{
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
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };

_Card _$CardFromJson(Map<String, dynamic> json) => _Card(
  id: (json['id'] as num?)?.toInt(),
  url: json['url'] as String?,
  thumbnail: json['thumbnail'] as String?,
  preview: json['preview'] as String?,
  fileName: json['file_name'] as String?,
  mimeType: json['mime_type'] as String?,
  size: (json['size'] as num?)?.toInt(),
);

Map<String, dynamic> _$CardToJson(_Card instance) => <String, dynamic>{
  'id': instance.id,
  'url': instance.url,
  'thumbnail': instance.thumbnail,
  'preview': instance.preview,
  'file_name': instance.fileName,
  'mime_type': instance.mimeType,
  'size': instance.size,
};

_Note _$NoteFromJson(Map<String, dynamic> json) => _Note(
  id: (json['id'] as num?)?.toInt(),
  note: json['note'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$NoteToJson(_Note instance) => <String, dynamic>{
  'id': instance.id,
  'note': instance.note,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
