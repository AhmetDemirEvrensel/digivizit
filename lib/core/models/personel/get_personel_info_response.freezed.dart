// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_personel_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetPersonelInfoResponse {

@JsonKey(name: "success") bool get success;@JsonKey(name: "message") String get message;@JsonKey(name: "data") List<Datum> get data;
/// Create a copy of GetPersonelInfoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPersonelInfoResponseCopyWith<GetPersonelInfoResponse> get copyWith => _$GetPersonelInfoResponseCopyWithImpl<GetPersonelInfoResponse>(this as GetPersonelInfoResponse, _$identity);

  /// Serializes this GetPersonelInfoResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPersonelInfoResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'GetPersonelInfoResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $GetPersonelInfoResponseCopyWith<$Res>  {
  factory $GetPersonelInfoResponseCopyWith(GetPersonelInfoResponse value, $Res Function(GetPersonelInfoResponse) _then) = _$GetPersonelInfoResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message,@JsonKey(name: "data") List<Datum> data
});




}
/// @nodoc
class _$GetPersonelInfoResponseCopyWithImpl<$Res>
    implements $GetPersonelInfoResponseCopyWith<$Res> {
  _$GetPersonelInfoResponseCopyWithImpl(this._self, this._then);

  final GetPersonelInfoResponse _self;
  final $Res Function(GetPersonelInfoResponse) _then;

/// Create a copy of GetPersonelInfoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Datum>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetPersonelInfoResponse].
extension GetPersonelInfoResponsePatterns on GetPersonelInfoResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetPersonelInfoResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPersonelInfoResponse() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetPersonelInfoResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetPersonelInfoResponse():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetPersonelInfoResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetPersonelInfoResponse() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "message")  String message, @JsonKey(name: "data")  List<Datum> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPersonelInfoResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "message")  String message, @JsonKey(name: "data")  List<Datum> data)  $default,) {final _that = this;
switch (_that) {
case _GetPersonelInfoResponse():
return $default(_that.success,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "message")  String message, @JsonKey(name: "data")  List<Datum> data)?  $default,) {final _that = this;
switch (_that) {
case _GetPersonelInfoResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetPersonelInfoResponse implements GetPersonelInfoResponse {
  const _GetPersonelInfoResponse({@JsonKey(name: "success") required this.success, @JsonKey(name: "message") required this.message, @JsonKey(name: "data") required final  List<Datum> data}): _data = data;
  factory _GetPersonelInfoResponse.fromJson(Map<String, dynamic> json) => _$GetPersonelInfoResponseFromJson(json);

@override@JsonKey(name: "success") final  bool success;
@override@JsonKey(name: "message") final  String message;
 final  List<Datum> _data;
@override@JsonKey(name: "data") List<Datum> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of GetPersonelInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPersonelInfoResponseCopyWith<_GetPersonelInfoResponse> get copyWith => __$GetPersonelInfoResponseCopyWithImpl<_GetPersonelInfoResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetPersonelInfoResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPersonelInfoResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'GetPersonelInfoResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$GetPersonelInfoResponseCopyWith<$Res> implements $GetPersonelInfoResponseCopyWith<$Res> {
  factory _$GetPersonelInfoResponseCopyWith(_GetPersonelInfoResponse value, $Res Function(_GetPersonelInfoResponse) _then) = __$GetPersonelInfoResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message,@JsonKey(name: "data") List<Datum> data
});




}
/// @nodoc
class __$GetPersonelInfoResponseCopyWithImpl<$Res>
    implements _$GetPersonelInfoResponseCopyWith<$Res> {
  __$GetPersonelInfoResponseCopyWithImpl(this._self, this._then);

  final _GetPersonelInfoResponse _self;
  final $Res Function(_GetPersonelInfoResponse) _then;

/// Create a copy of GetPersonelInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_GetPersonelInfoResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Datum>,
  ));
}


}


/// @nodoc
mixin _$Datum {

@JsonKey(name: "id") int get id;@JsonKey(name: "user_id") int get userId;@JsonKey(name: "title") String get title;@JsonKey(name: "email") String get email;@JsonKey(name: "phone") String get phone;@JsonKey(name: "extension_number") String get extensionNumber;@JsonKey(name: "qr") int get qr;@JsonKey(name: "qr_code_url") String get qrCodeUrl;@JsonKey(name: "instagram_url") dynamic get instagramUrl;@JsonKey(name: "linkedin_url") dynamic get linkedinUrl;@JsonKey(name: "appointment_status") String get appointmentStatus;@JsonKey(name: "date") DateTime get date;@JsonKey(name: "status") String get status;@JsonKey(name: "slug") String get slug;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "deleted_at") dynamic get deletedAt;@JsonKey(name: "firm_name_id") int get firmNameId;@JsonKey(name: "department_id") int get departmentId;@JsonKey(name: "office_address_id") int get officeAddressId;@JsonKey(name: "title_en") String get titleEn;@JsonKey(name: "department") Department get department;@JsonKey(name: "department_en") dynamic get departmentEn;@JsonKey(name: "photo") QrPhoto? get photo;@JsonKey(name: "qr_photo") QrPhoto get qrPhoto;@JsonKey(name: "firm_name") FirmName get firmName;@JsonKey(name: "office_address") OfficeAddress get officeAddress;@JsonKey(name: "media") List<QrPhoto> get media;
/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatumCopyWith<Datum> get copyWith => _$DatumCopyWithImpl<Datum>(this as Datum, _$identity);

  /// Serializes this Datum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Datum&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.extensionNumber, extensionNumber) || other.extensionNumber == extensionNumber)&&(identical(other.qr, qr) || other.qr == qr)&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&const DeepCollectionEquality().equals(other.instagramUrl, instagramUrl)&&const DeepCollectionEquality().equals(other.linkedinUrl, linkedinUrl)&&(identical(other.appointmentStatus, appointmentStatus) || other.appointmentStatus == appointmentStatus)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.firmNameId, firmNameId) || other.firmNameId == firmNameId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.officeAddressId, officeAddressId) || other.officeAddressId == officeAddressId)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.department, department) || other.department == department)&&const DeepCollectionEquality().equals(other.departmentEn, departmentEn)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.qrPhoto, qrPhoto) || other.qrPhoto == qrPhoto)&&(identical(other.firmName, firmName) || other.firmName == firmName)&&(identical(other.officeAddress, officeAddress) || other.officeAddress == officeAddress)&&const DeepCollectionEquality().equals(other.media, media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,title,email,phone,extensionNumber,qr,qrCodeUrl,const DeepCollectionEquality().hash(instagramUrl),const DeepCollectionEquality().hash(linkedinUrl),appointmentStatus,date,status,slug,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),firmNameId,departmentId,officeAddressId,titleEn,department,const DeepCollectionEquality().hash(departmentEn),photo,qrPhoto,firmName,officeAddress,const DeepCollectionEquality().hash(media)]);

@override
String toString() {
  return 'Datum(id: $id, userId: $userId, title: $title, email: $email, phone: $phone, extensionNumber: $extensionNumber, qr: $qr, qrCodeUrl: $qrCodeUrl, instagramUrl: $instagramUrl, linkedinUrl: $linkedinUrl, appointmentStatus: $appointmentStatus, date: $date, status: $status, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, firmNameId: $firmNameId, departmentId: $departmentId, officeAddressId: $officeAddressId, titleEn: $titleEn, department: $department, departmentEn: $departmentEn, photo: $photo, qrPhoto: $qrPhoto, firmName: $firmName, officeAddress: $officeAddress, media: $media)';
}


}

/// @nodoc
abstract mixin class $DatumCopyWith<$Res>  {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) _then) = _$DatumCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "user_id") int userId,@JsonKey(name: "title") String title,@JsonKey(name: "email") String email,@JsonKey(name: "phone") String phone,@JsonKey(name: "extension_number") String extensionNumber,@JsonKey(name: "qr") int qr,@JsonKey(name: "qr_code_url") String qrCodeUrl,@JsonKey(name: "instagram_url") dynamic instagramUrl,@JsonKey(name: "linkedin_url") dynamic linkedinUrl,@JsonKey(name: "appointment_status") String appointmentStatus,@JsonKey(name: "date") DateTime date,@JsonKey(name: "status") String status,@JsonKey(name: "slug") String slug,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "firm_name_id") int firmNameId,@JsonKey(name: "department_id") int departmentId,@JsonKey(name: "office_address_id") int officeAddressId,@JsonKey(name: "title_en") String titleEn,@JsonKey(name: "department") Department department,@JsonKey(name: "department_en") dynamic departmentEn,@JsonKey(name: "photo") QrPhoto? photo,@JsonKey(name: "qr_photo") QrPhoto qrPhoto,@JsonKey(name: "firm_name") FirmName firmName,@JsonKey(name: "office_address") OfficeAddress officeAddress,@JsonKey(name: "media") List<QrPhoto> media
});


$DepartmentCopyWith<$Res> get department;$QrPhotoCopyWith<$Res>? get photo;$QrPhotoCopyWith<$Res> get qrPhoto;$FirmNameCopyWith<$Res> get firmName;$OfficeAddressCopyWith<$Res> get officeAddress;

}
/// @nodoc
class _$DatumCopyWithImpl<$Res>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._self, this._then);

  final Datum _self;
  final $Res Function(Datum) _then;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? email = null,Object? phone = null,Object? extensionNumber = null,Object? qr = null,Object? qrCodeUrl = null,Object? instagramUrl = freezed,Object? linkedinUrl = freezed,Object? appointmentStatus = null,Object? date = null,Object? status = null,Object? slug = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? firmNameId = null,Object? departmentId = null,Object? officeAddressId = null,Object? titleEn = null,Object? department = null,Object? departmentEn = freezed,Object? photo = freezed,Object? qrPhoto = null,Object? firmName = null,Object? officeAddress = null,Object? media = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,extensionNumber: null == extensionNumber ? _self.extensionNumber : extensionNumber // ignore: cast_nullable_to_non_nullable
as String,qr: null == qr ? _self.qr : qr // ignore: cast_nullable_to_non_nullable
as int,qrCodeUrl: null == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as dynamic,linkedinUrl: freezed == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as dynamic,appointmentStatus: null == appointmentStatus ? _self.appointmentStatus : appointmentStatus // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,firmNameId: null == firmNameId ? _self.firmNameId : firmNameId // ignore: cast_nullable_to_non_nullable
as int,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int,officeAddressId: null == officeAddressId ? _self.officeAddressId : officeAddressId // ignore: cast_nullable_to_non_nullable
as int,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as Department,departmentEn: freezed == departmentEn ? _self.departmentEn : departmentEn // ignore: cast_nullable_to_non_nullable
as dynamic,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as QrPhoto?,qrPhoto: null == qrPhoto ? _self.qrPhoto : qrPhoto // ignore: cast_nullable_to_non_nullable
as QrPhoto,firmName: null == firmName ? _self.firmName : firmName // ignore: cast_nullable_to_non_nullable
as FirmName,officeAddress: null == officeAddress ? _self.officeAddress : officeAddress // ignore: cast_nullable_to_non_nullable
as OfficeAddress,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<QrPhoto>,
  ));
}
/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartmentCopyWith<$Res> get department {
  
  return $DepartmentCopyWith<$Res>(_self.department, (value) {
    return _then(_self.copyWith(department: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<$Res>? get photo {
    if (_self.photo == null) {
    return null;
  }

  return $QrPhotoCopyWith<$Res>(_self.photo!, (value) {
    return _then(_self.copyWith(photo: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<$Res> get qrPhoto {
  
  return $QrPhotoCopyWith<$Res>(_self.qrPhoto, (value) {
    return _then(_self.copyWith(qrPhoto: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmNameCopyWith<$Res> get firmName {
  
  return $FirmNameCopyWith<$Res>(_self.firmName, (value) {
    return _then(_self.copyWith(firmName: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfficeAddressCopyWith<$Res> get officeAddress {
  
  return $OfficeAddressCopyWith<$Res>(_self.officeAddress, (value) {
    return _then(_self.copyWith(officeAddress: value));
  });
}
}


/// Adds pattern-matching-related methods to [Datum].
extension DatumPatterns on Datum {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Datum value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Datum value)  $default,){
final _that = this;
switch (_that) {
case _Datum():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Datum value)?  $default,){
final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "user_id")  int userId, @JsonKey(name: "title")  String title, @JsonKey(name: "email")  String email, @JsonKey(name: "phone")  String phone, @JsonKey(name: "extension_number")  String extensionNumber, @JsonKey(name: "qr")  int qr, @JsonKey(name: "qr_code_url")  String qrCodeUrl, @JsonKey(name: "instagram_url")  dynamic instagramUrl, @JsonKey(name: "linkedin_url")  dynamic linkedinUrl, @JsonKey(name: "appointment_status")  String appointmentStatus, @JsonKey(name: "date")  DateTime date, @JsonKey(name: "status")  String status, @JsonKey(name: "slug")  String slug, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "firm_name_id")  int firmNameId, @JsonKey(name: "department_id")  int departmentId, @JsonKey(name: "office_address_id")  int officeAddressId, @JsonKey(name: "title_en")  String titleEn, @JsonKey(name: "department")  Department department, @JsonKey(name: "department_en")  dynamic departmentEn, @JsonKey(name: "photo")  QrPhoto? photo, @JsonKey(name: "qr_photo")  QrPhoto qrPhoto, @JsonKey(name: "firm_name")  FirmName firmName, @JsonKey(name: "office_address")  OfficeAddress officeAddress, @JsonKey(name: "media")  List<QrPhoto> media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.email,_that.phone,_that.extensionNumber,_that.qr,_that.qrCodeUrl,_that.instagramUrl,_that.linkedinUrl,_that.appointmentStatus,_that.date,_that.status,_that.slug,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.firmNameId,_that.departmentId,_that.officeAddressId,_that.titleEn,_that.department,_that.departmentEn,_that.photo,_that.qrPhoto,_that.firmName,_that.officeAddress,_that.media);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "user_id")  int userId, @JsonKey(name: "title")  String title, @JsonKey(name: "email")  String email, @JsonKey(name: "phone")  String phone, @JsonKey(name: "extension_number")  String extensionNumber, @JsonKey(name: "qr")  int qr, @JsonKey(name: "qr_code_url")  String qrCodeUrl, @JsonKey(name: "instagram_url")  dynamic instagramUrl, @JsonKey(name: "linkedin_url")  dynamic linkedinUrl, @JsonKey(name: "appointment_status")  String appointmentStatus, @JsonKey(name: "date")  DateTime date, @JsonKey(name: "status")  String status, @JsonKey(name: "slug")  String slug, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "firm_name_id")  int firmNameId, @JsonKey(name: "department_id")  int departmentId, @JsonKey(name: "office_address_id")  int officeAddressId, @JsonKey(name: "title_en")  String titleEn, @JsonKey(name: "department")  Department department, @JsonKey(name: "department_en")  dynamic departmentEn, @JsonKey(name: "photo")  QrPhoto? photo, @JsonKey(name: "qr_photo")  QrPhoto qrPhoto, @JsonKey(name: "firm_name")  FirmName firmName, @JsonKey(name: "office_address")  OfficeAddress officeAddress, @JsonKey(name: "media")  List<QrPhoto> media)  $default,) {final _that = this;
switch (_that) {
case _Datum():
return $default(_that.id,_that.userId,_that.title,_that.email,_that.phone,_that.extensionNumber,_that.qr,_that.qrCodeUrl,_that.instagramUrl,_that.linkedinUrl,_that.appointmentStatus,_that.date,_that.status,_that.slug,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.firmNameId,_that.departmentId,_that.officeAddressId,_that.titleEn,_that.department,_that.departmentEn,_that.photo,_that.qrPhoto,_that.firmName,_that.officeAddress,_that.media);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "user_id")  int userId, @JsonKey(name: "title")  String title, @JsonKey(name: "email")  String email, @JsonKey(name: "phone")  String phone, @JsonKey(name: "extension_number")  String extensionNumber, @JsonKey(name: "qr")  int qr, @JsonKey(name: "qr_code_url")  String qrCodeUrl, @JsonKey(name: "instagram_url")  dynamic instagramUrl, @JsonKey(name: "linkedin_url")  dynamic linkedinUrl, @JsonKey(name: "appointment_status")  String appointmentStatus, @JsonKey(name: "date")  DateTime date, @JsonKey(name: "status")  String status, @JsonKey(name: "slug")  String slug, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "firm_name_id")  int firmNameId, @JsonKey(name: "department_id")  int departmentId, @JsonKey(name: "office_address_id")  int officeAddressId, @JsonKey(name: "title_en")  String titleEn, @JsonKey(name: "department")  Department department, @JsonKey(name: "department_en")  dynamic departmentEn, @JsonKey(name: "photo")  QrPhoto? photo, @JsonKey(name: "qr_photo")  QrPhoto qrPhoto, @JsonKey(name: "firm_name")  FirmName firmName, @JsonKey(name: "office_address")  OfficeAddress officeAddress, @JsonKey(name: "media")  List<QrPhoto> media)?  $default,) {final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that.id,_that.userId,_that.title,_that.email,_that.phone,_that.extensionNumber,_that.qr,_that.qrCodeUrl,_that.instagramUrl,_that.linkedinUrl,_that.appointmentStatus,_that.date,_that.status,_that.slug,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.firmNameId,_that.departmentId,_that.officeAddressId,_that.titleEn,_that.department,_that.departmentEn,_that.photo,_that.qrPhoto,_that.firmName,_that.officeAddress,_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Datum implements Datum {
  const _Datum({@JsonKey(name: "id") required this.id, @JsonKey(name: "user_id") required this.userId, @JsonKey(name: "title") required this.title, @JsonKey(name: "email") required this.email, @JsonKey(name: "phone") required this.phone, @JsonKey(name: "extension_number") required this.extensionNumber, @JsonKey(name: "qr") required this.qr, @JsonKey(name: "qr_code_url") required this.qrCodeUrl, @JsonKey(name: "instagram_url") required this.instagramUrl, @JsonKey(name: "linkedin_url") required this.linkedinUrl, @JsonKey(name: "appointment_status") required this.appointmentStatus, @JsonKey(name: "date") required this.date, @JsonKey(name: "status") required this.status, @JsonKey(name: "slug") required this.slug, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "deleted_at") required this.deletedAt, @JsonKey(name: "firm_name_id") required this.firmNameId, @JsonKey(name: "department_id") required this.departmentId, @JsonKey(name: "office_address_id") required this.officeAddressId, @JsonKey(name: "title_en") required this.titleEn, @JsonKey(name: "department") required this.department, @JsonKey(name: "department_en") required this.departmentEn, @JsonKey(name: "photo") required this.photo, @JsonKey(name: "qr_photo") required this.qrPhoto, @JsonKey(name: "firm_name") required this.firmName, @JsonKey(name: "office_address") required this.officeAddress, @JsonKey(name: "media") required final  List<QrPhoto> media}): _media = media;
  factory _Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "user_id") final  int userId;
@override@JsonKey(name: "title") final  String title;
@override@JsonKey(name: "email") final  String email;
@override@JsonKey(name: "phone") final  String phone;
@override@JsonKey(name: "extension_number") final  String extensionNumber;
@override@JsonKey(name: "qr") final  int qr;
@override@JsonKey(name: "qr_code_url") final  String qrCodeUrl;
@override@JsonKey(name: "instagram_url") final  dynamic instagramUrl;
@override@JsonKey(name: "linkedin_url") final  dynamic linkedinUrl;
@override@JsonKey(name: "appointment_status") final  String appointmentStatus;
@override@JsonKey(name: "date") final  DateTime date;
@override@JsonKey(name: "status") final  String status;
@override@JsonKey(name: "slug") final  String slug;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override@JsonKey(name: "deleted_at") final  dynamic deletedAt;
@override@JsonKey(name: "firm_name_id") final  int firmNameId;
@override@JsonKey(name: "department_id") final  int departmentId;
@override@JsonKey(name: "office_address_id") final  int officeAddressId;
@override@JsonKey(name: "title_en") final  String titleEn;
@override@JsonKey(name: "department") final  Department department;
@override@JsonKey(name: "department_en") final  dynamic departmentEn;
@override@JsonKey(name: "photo") final  QrPhoto? photo;
@override@JsonKey(name: "qr_photo") final  QrPhoto qrPhoto;
@override@JsonKey(name: "firm_name") final  FirmName firmName;
@override@JsonKey(name: "office_address") final  OfficeAddress officeAddress;
 final  List<QrPhoto> _media;
@override@JsonKey(name: "media") List<QrPhoto> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}


/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DatumCopyWith<_Datum> get copyWith => __$DatumCopyWithImpl<_Datum>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DatumToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Datum&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.title, title) || other.title == title)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.extensionNumber, extensionNumber) || other.extensionNumber == extensionNumber)&&(identical(other.qr, qr) || other.qr == qr)&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&const DeepCollectionEquality().equals(other.instagramUrl, instagramUrl)&&const DeepCollectionEquality().equals(other.linkedinUrl, linkedinUrl)&&(identical(other.appointmentStatus, appointmentStatus) || other.appointmentStatus == appointmentStatus)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.firmNameId, firmNameId) || other.firmNameId == firmNameId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.officeAddressId, officeAddressId) || other.officeAddressId == officeAddressId)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.department, department) || other.department == department)&&const DeepCollectionEquality().equals(other.departmentEn, departmentEn)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.qrPhoto, qrPhoto) || other.qrPhoto == qrPhoto)&&(identical(other.firmName, firmName) || other.firmName == firmName)&&(identical(other.officeAddress, officeAddress) || other.officeAddress == officeAddress)&&const DeepCollectionEquality().equals(other._media, _media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,title,email,phone,extensionNumber,qr,qrCodeUrl,const DeepCollectionEquality().hash(instagramUrl),const DeepCollectionEquality().hash(linkedinUrl),appointmentStatus,date,status,slug,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),firmNameId,departmentId,officeAddressId,titleEn,department,const DeepCollectionEquality().hash(departmentEn),photo,qrPhoto,firmName,officeAddress,const DeepCollectionEquality().hash(_media)]);

@override
String toString() {
  return 'Datum(id: $id, userId: $userId, title: $title, email: $email, phone: $phone, extensionNumber: $extensionNumber, qr: $qr, qrCodeUrl: $qrCodeUrl, instagramUrl: $instagramUrl, linkedinUrl: $linkedinUrl, appointmentStatus: $appointmentStatus, date: $date, status: $status, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, firmNameId: $firmNameId, departmentId: $departmentId, officeAddressId: $officeAddressId, titleEn: $titleEn, department: $department, departmentEn: $departmentEn, photo: $photo, qrPhoto: $qrPhoto, firmName: $firmName, officeAddress: $officeAddress, media: $media)';
}


}

/// @nodoc
abstract mixin class _$DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$DatumCopyWith(_Datum value, $Res Function(_Datum) _then) = __$DatumCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "user_id") int userId,@JsonKey(name: "title") String title,@JsonKey(name: "email") String email,@JsonKey(name: "phone") String phone,@JsonKey(name: "extension_number") String extensionNumber,@JsonKey(name: "qr") int qr,@JsonKey(name: "qr_code_url") String qrCodeUrl,@JsonKey(name: "instagram_url") dynamic instagramUrl,@JsonKey(name: "linkedin_url") dynamic linkedinUrl,@JsonKey(name: "appointment_status") String appointmentStatus,@JsonKey(name: "date") DateTime date,@JsonKey(name: "status") String status,@JsonKey(name: "slug") String slug,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "firm_name_id") int firmNameId,@JsonKey(name: "department_id") int departmentId,@JsonKey(name: "office_address_id") int officeAddressId,@JsonKey(name: "title_en") String titleEn,@JsonKey(name: "department") Department department,@JsonKey(name: "department_en") dynamic departmentEn,@JsonKey(name: "photo") QrPhoto? photo,@JsonKey(name: "qr_photo") QrPhoto qrPhoto,@JsonKey(name: "firm_name") FirmName firmName,@JsonKey(name: "office_address") OfficeAddress officeAddress,@JsonKey(name: "media") List<QrPhoto> media
});


@override $DepartmentCopyWith<$Res> get department;@override $QrPhotoCopyWith<$Res>? get photo;@override $QrPhotoCopyWith<$Res> get qrPhoto;@override $FirmNameCopyWith<$Res> get firmName;@override $OfficeAddressCopyWith<$Res> get officeAddress;

}
/// @nodoc
class __$DatumCopyWithImpl<$Res>
    implements _$DatumCopyWith<$Res> {
  __$DatumCopyWithImpl(this._self, this._then);

  final _Datum _self;
  final $Res Function(_Datum) _then;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? title = null,Object? email = null,Object? phone = null,Object? extensionNumber = null,Object? qr = null,Object? qrCodeUrl = null,Object? instagramUrl = freezed,Object? linkedinUrl = freezed,Object? appointmentStatus = null,Object? date = null,Object? status = null,Object? slug = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? firmNameId = null,Object? departmentId = null,Object? officeAddressId = null,Object? titleEn = null,Object? department = null,Object? departmentEn = freezed,Object? photo = freezed,Object? qrPhoto = null,Object? firmName = null,Object? officeAddress = null,Object? media = null,}) {
  return _then(_Datum(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,extensionNumber: null == extensionNumber ? _self.extensionNumber : extensionNumber // ignore: cast_nullable_to_non_nullable
as String,qr: null == qr ? _self.qr : qr // ignore: cast_nullable_to_non_nullable
as int,qrCodeUrl: null == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as dynamic,linkedinUrl: freezed == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as dynamic,appointmentStatus: null == appointmentStatus ? _self.appointmentStatus : appointmentStatus // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,firmNameId: null == firmNameId ? _self.firmNameId : firmNameId // ignore: cast_nullable_to_non_nullable
as int,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int,officeAddressId: null == officeAddressId ? _self.officeAddressId : officeAddressId // ignore: cast_nullable_to_non_nullable
as int,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,department: null == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as Department,departmentEn: freezed == departmentEn ? _self.departmentEn : departmentEn // ignore: cast_nullable_to_non_nullable
as dynamic,photo: freezed == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as QrPhoto?,qrPhoto: null == qrPhoto ? _self.qrPhoto : qrPhoto // ignore: cast_nullable_to_non_nullable
as QrPhoto,firmName: null == firmName ? _self.firmName : firmName // ignore: cast_nullable_to_non_nullable
as FirmName,officeAddress: null == officeAddress ? _self.officeAddress : officeAddress // ignore: cast_nullable_to_non_nullable
as OfficeAddress,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<QrPhoto>,
  ));
}

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartmentCopyWith<$Res> get department {
  
  return $DepartmentCopyWith<$Res>(_self.department, (value) {
    return _then(_self.copyWith(department: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<$Res>? get photo {
    if (_self.photo == null) {
    return null;
  }

  return $QrPhotoCopyWith<$Res>(_self.photo!, (value) {
    return _then(_self.copyWith(photo: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<$Res> get qrPhoto {
  
  return $QrPhotoCopyWith<$Res>(_self.qrPhoto, (value) {
    return _then(_self.copyWith(qrPhoto: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirmNameCopyWith<$Res> get firmName {
  
  return $FirmNameCopyWith<$Res>(_self.firmName, (value) {
    return _then(_self.copyWith(firmName: value));
  });
}/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfficeAddressCopyWith<$Res> get officeAddress {
  
  return $OfficeAddressCopyWith<$Res>(_self.officeAddress, (value) {
    return _then(_self.copyWith(officeAddress: value));
  });
}
}


/// @nodoc
mixin _$Department {

@JsonKey(name: "id") int get id;@JsonKey(name: "name") String get name;@JsonKey(name: "name_en") String get nameEn;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "deleted_at") dynamic get deletedAt;@JsonKey(name: "banner_background") QrPhoto get bannerBackground;@JsonKey(name: "media") List<QrPhoto> get media;
/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentCopyWith<Department> get copyWith => _$DepartmentCopyWithImpl<Department>(this as Department, _$identity);

  /// Serializes this Department to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Department&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.bannerBackground, bannerBackground) || other.bannerBackground == bannerBackground)&&const DeepCollectionEquality().equals(other.media, media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameEn,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),bannerBackground,const DeepCollectionEquality().hash(media));

@override
String toString() {
  return 'Department(id: $id, name: $name, nameEn: $nameEn, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, bannerBackground: $bannerBackground, media: $media)';
}


}

/// @nodoc
abstract mixin class $DepartmentCopyWith<$Res>  {
  factory $DepartmentCopyWith(Department value, $Res Function(Department) _then) = _$DepartmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "name") String name,@JsonKey(name: "name_en") String nameEn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "banner_background") QrPhoto bannerBackground,@JsonKey(name: "media") List<QrPhoto> media
});


$QrPhotoCopyWith<$Res> get bannerBackground;

}
/// @nodoc
class _$DepartmentCopyWithImpl<$Res>
    implements $DepartmentCopyWith<$Res> {
  _$DepartmentCopyWithImpl(this._self, this._then);

  final Department _self;
  final $Res Function(Department) _then;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameEn = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? bannerBackground = null,Object? media = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,bannerBackground: null == bannerBackground ? _self.bannerBackground : bannerBackground // ignore: cast_nullable_to_non_nullable
as QrPhoto,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<QrPhoto>,
  ));
}
/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<$Res> get bannerBackground {
  
  return $QrPhotoCopyWith<$Res>(_self.bannerBackground, (value) {
    return _then(_self.copyWith(bannerBackground: value));
  });
}
}


/// Adds pattern-matching-related methods to [Department].
extension DepartmentPatterns on Department {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Department value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Department() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Department value)  $default,){
final _that = this;
switch (_that) {
case _Department():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Department value)?  $default,){
final _that = this;
switch (_that) {
case _Department() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "name")  String name, @JsonKey(name: "name_en")  String nameEn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "banner_background")  QrPhoto bannerBackground, @JsonKey(name: "media")  List<QrPhoto> media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Department() when $default != null:
return $default(_that.id,_that.name,_that.nameEn,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.bannerBackground,_that.media);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "name")  String name, @JsonKey(name: "name_en")  String nameEn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "banner_background")  QrPhoto bannerBackground, @JsonKey(name: "media")  List<QrPhoto> media)  $default,) {final _that = this;
switch (_that) {
case _Department():
return $default(_that.id,_that.name,_that.nameEn,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.bannerBackground,_that.media);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "name")  String name, @JsonKey(name: "name_en")  String nameEn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "banner_background")  QrPhoto bannerBackground, @JsonKey(name: "media")  List<QrPhoto> media)?  $default,) {final _that = this;
switch (_that) {
case _Department() when $default != null:
return $default(_that.id,_that.name,_that.nameEn,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.bannerBackground,_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Department implements Department {
  const _Department({@JsonKey(name: "id") required this.id, @JsonKey(name: "name") required this.name, @JsonKey(name: "name_en") required this.nameEn, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "deleted_at") required this.deletedAt, @JsonKey(name: "banner_background") required this.bannerBackground, @JsonKey(name: "media") required final  List<QrPhoto> media}): _media = media;
  factory _Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "name_en") final  String nameEn;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override@JsonKey(name: "deleted_at") final  dynamic deletedAt;
@override@JsonKey(name: "banner_background") final  QrPhoto bannerBackground;
 final  List<QrPhoto> _media;
@override@JsonKey(name: "media") List<QrPhoto> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}


/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentCopyWith<_Department> get copyWith => __$DepartmentCopyWithImpl<_Department>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Department&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.bannerBackground, bannerBackground) || other.bannerBackground == bannerBackground)&&const DeepCollectionEquality().equals(other._media, _media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameEn,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),bannerBackground,const DeepCollectionEquality().hash(_media));

@override
String toString() {
  return 'Department(id: $id, name: $name, nameEn: $nameEn, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, bannerBackground: $bannerBackground, media: $media)';
}


}

/// @nodoc
abstract mixin class _$DepartmentCopyWith<$Res> implements $DepartmentCopyWith<$Res> {
  factory _$DepartmentCopyWith(_Department value, $Res Function(_Department) _then) = __$DepartmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "name") String name,@JsonKey(name: "name_en") String nameEn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "banner_background") QrPhoto bannerBackground,@JsonKey(name: "media") List<QrPhoto> media
});


@override $QrPhotoCopyWith<$Res> get bannerBackground;

}
/// @nodoc
class __$DepartmentCopyWithImpl<$Res>
    implements _$DepartmentCopyWith<$Res> {
  __$DepartmentCopyWithImpl(this._self, this._then);

  final _Department _self;
  final $Res Function(_Department) _then;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameEn = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? bannerBackground = null,Object? media = null,}) {
  return _then(_Department(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,bannerBackground: null == bannerBackground ? _self.bannerBackground : bannerBackground // ignore: cast_nullable_to_non_nullable
as QrPhoto,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<QrPhoto>,
  ));
}

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<$Res> get bannerBackground {
  
  return $QrPhotoCopyWith<$Res>(_self.bannerBackground, (value) {
    return _then(_self.copyWith(bannerBackground: value));
  });
}
}


/// @nodoc
mixin _$QrPhoto {

@JsonKey(name: "id") int get id;@JsonKey(name: "model_type") String get modelType;@JsonKey(name: "model_id") int get modelId;@JsonKey(name: "uuid") String get uuid;@JsonKey(name: "collection_name") String get collectionName;@JsonKey(name: "name") String get name;@JsonKey(name: "file_name") String get fileName;@JsonKey(name: "mime_type") String get mimeType;@JsonKey(name: "disk") String get disk;@JsonKey(name: "conversions_disk") String get conversionsDisk;@JsonKey(name: "size") int get size;@JsonKey(name: "manipulations") List<dynamic> get manipulations;@JsonKey(name: "custom_properties") List<dynamic> get customProperties;@JsonKey(name: "generated_conversions") GeneratedConversionsClass get generatedConversions;@JsonKey(name: "responsive_images") List<dynamic> get responsiveImages;@JsonKey(name: "order_column") int get orderColumn;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "original_url") String get originalUrl;@JsonKey(name: "preview_url") String get previewUrl;@JsonKey(name: "url") String? get url;@JsonKey(name: "thumbnail") String? get thumbnail;@JsonKey(name: "preview") String? get preview;
/// Create a copy of QrPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<QrPhoto> get copyWith => _$QrPhotoCopyWithImpl<QrPhoto>(this as QrPhoto, _$identity);

  /// Serializes this QrPhoto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrPhoto&&(identical(other.id, id) || other.id == id)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.disk, disk) || other.disk == disk)&&(identical(other.conversionsDisk, conversionsDisk) || other.conversionsDisk == conversionsDisk)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.manipulations, manipulations)&&const DeepCollectionEquality().equals(other.customProperties, customProperties)&&(identical(other.generatedConversions, generatedConversions) || other.generatedConversions == generatedConversions)&&const DeepCollectionEquality().equals(other.responsiveImages, responsiveImages)&&(identical(other.orderColumn, orderColumn) || other.orderColumn == orderColumn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.preview, preview) || other.preview == preview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,modelType,modelId,uuid,collectionName,name,fileName,mimeType,disk,conversionsDisk,size,const DeepCollectionEquality().hash(manipulations),const DeepCollectionEquality().hash(customProperties),generatedConversions,const DeepCollectionEquality().hash(responsiveImages),orderColumn,createdAt,updatedAt,originalUrl,previewUrl,url,thumbnail,preview]);

@override
String toString() {
  return 'QrPhoto(id: $id, modelType: $modelType, modelId: $modelId, uuid: $uuid, collectionName: $collectionName, name: $name, fileName: $fileName, mimeType: $mimeType, disk: $disk, conversionsDisk: $conversionsDisk, size: $size, manipulations: $manipulations, customProperties: $customProperties, generatedConversions: $generatedConversions, responsiveImages: $responsiveImages, orderColumn: $orderColumn, createdAt: $createdAt, updatedAt: $updatedAt, originalUrl: $originalUrl, previewUrl: $previewUrl, url: $url, thumbnail: $thumbnail, preview: $preview)';
}


}

/// @nodoc
abstract mixin class $QrPhotoCopyWith<$Res>  {
  factory $QrPhotoCopyWith(QrPhoto value, $Res Function(QrPhoto) _then) = _$QrPhotoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "model_type") String modelType,@JsonKey(name: "model_id") int modelId,@JsonKey(name: "uuid") String uuid,@JsonKey(name: "collection_name") String collectionName,@JsonKey(name: "name") String name,@JsonKey(name: "file_name") String fileName,@JsonKey(name: "mime_type") String mimeType,@JsonKey(name: "disk") String disk,@JsonKey(name: "conversions_disk") String conversionsDisk,@JsonKey(name: "size") int size,@JsonKey(name: "manipulations") List<dynamic> manipulations,@JsonKey(name: "custom_properties") List<dynamic> customProperties,@JsonKey(name: "generated_conversions") GeneratedConversionsClass generatedConversions,@JsonKey(name: "responsive_images") List<dynamic> responsiveImages,@JsonKey(name: "order_column") int orderColumn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "original_url") String originalUrl,@JsonKey(name: "preview_url") String previewUrl,@JsonKey(name: "url") String? url,@JsonKey(name: "thumbnail") String? thumbnail,@JsonKey(name: "preview") String? preview
});


$GeneratedConversionsClassCopyWith<$Res> get generatedConversions;

}
/// @nodoc
class _$QrPhotoCopyWithImpl<$Res>
    implements $QrPhotoCopyWith<$Res> {
  _$QrPhotoCopyWithImpl(this._self, this._then);

  final QrPhoto _self;
  final $Res Function(QrPhoto) _then;

/// Create a copy of QrPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? modelType = null,Object? modelId = null,Object? uuid = null,Object? collectionName = null,Object? name = null,Object? fileName = null,Object? mimeType = null,Object? disk = null,Object? conversionsDisk = null,Object? size = null,Object? manipulations = null,Object? customProperties = null,Object? generatedConversions = null,Object? responsiveImages = null,Object? orderColumn = null,Object? createdAt = null,Object? updatedAt = null,Object? originalUrl = null,Object? previewUrl = null,Object? url = freezed,Object? thumbnail = freezed,Object? preview = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,modelType: null == modelType ? _self.modelType : modelType // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,collectionName: null == collectionName ? _self.collectionName : collectionName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,disk: null == disk ? _self.disk : disk // ignore: cast_nullable_to_non_nullable
as String,conversionsDisk: null == conversionsDisk ? _self.conversionsDisk : conversionsDisk // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,manipulations: null == manipulations ? _self.manipulations : manipulations // ignore: cast_nullable_to_non_nullable
as List<dynamic>,customProperties: null == customProperties ? _self.customProperties : customProperties // ignore: cast_nullable_to_non_nullable
as List<dynamic>,generatedConversions: null == generatedConversions ? _self.generatedConversions : generatedConversions // ignore: cast_nullable_to_non_nullable
as GeneratedConversionsClass,responsiveImages: null == responsiveImages ? _self.responsiveImages : responsiveImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,orderColumn: null == orderColumn ? _self.orderColumn : orderColumn // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,previewUrl: null == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of QrPhoto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeneratedConversionsClassCopyWith<$Res> get generatedConversions {
  
  return $GeneratedConversionsClassCopyWith<$Res>(_self.generatedConversions, (value) {
    return _then(_self.copyWith(generatedConversions: value));
  });
}
}


/// Adds pattern-matching-related methods to [QrPhoto].
extension QrPhotoPatterns on QrPhoto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrPhoto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrPhoto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrPhoto value)  $default,){
final _that = this;
switch (_that) {
case _QrPhoto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrPhoto value)?  $default,){
final _that = this;
switch (_that) {
case _QrPhoto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  GeneratedConversionsClass generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrPhoto() when $default != null:
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.originalUrl,_that.previewUrl,_that.url,_that.thumbnail,_that.preview);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  GeneratedConversionsClass generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview)  $default,) {final _that = this;
switch (_that) {
case _QrPhoto():
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.originalUrl,_that.previewUrl,_that.url,_that.thumbnail,_that.preview);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  GeneratedConversionsClass generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview)?  $default,) {final _that = this;
switch (_that) {
case _QrPhoto() when $default != null:
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.originalUrl,_that.previewUrl,_that.url,_that.thumbnail,_that.preview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrPhoto implements QrPhoto {
  const _QrPhoto({@JsonKey(name: "id") required this.id, @JsonKey(name: "model_type") required this.modelType, @JsonKey(name: "model_id") required this.modelId, @JsonKey(name: "uuid") required this.uuid, @JsonKey(name: "collection_name") required this.collectionName, @JsonKey(name: "name") required this.name, @JsonKey(name: "file_name") required this.fileName, @JsonKey(name: "mime_type") required this.mimeType, @JsonKey(name: "disk") required this.disk, @JsonKey(name: "conversions_disk") required this.conversionsDisk, @JsonKey(name: "size") required this.size, @JsonKey(name: "manipulations") required final  List<dynamic> manipulations, @JsonKey(name: "custom_properties") required final  List<dynamic> customProperties, @JsonKey(name: "generated_conversions") required this.generatedConversions, @JsonKey(name: "responsive_images") required final  List<dynamic> responsiveImages, @JsonKey(name: "order_column") required this.orderColumn, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "original_url") required this.originalUrl, @JsonKey(name: "preview_url") required this.previewUrl, @JsonKey(name: "url") this.url, @JsonKey(name: "thumbnail") this.thumbnail, @JsonKey(name: "preview") this.preview}): _manipulations = manipulations,_customProperties = customProperties,_responsiveImages = responsiveImages;
  factory _QrPhoto.fromJson(Map<String, dynamic> json) => _$QrPhotoFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "model_type") final  String modelType;
@override@JsonKey(name: "model_id") final  int modelId;
@override@JsonKey(name: "uuid") final  String uuid;
@override@JsonKey(name: "collection_name") final  String collectionName;
@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "file_name") final  String fileName;
@override@JsonKey(name: "mime_type") final  String mimeType;
@override@JsonKey(name: "disk") final  String disk;
@override@JsonKey(name: "conversions_disk") final  String conversionsDisk;
@override@JsonKey(name: "size") final  int size;
 final  List<dynamic> _manipulations;
@override@JsonKey(name: "manipulations") List<dynamic> get manipulations {
  if (_manipulations is EqualUnmodifiableListView) return _manipulations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_manipulations);
}

 final  List<dynamic> _customProperties;
@override@JsonKey(name: "custom_properties") List<dynamic> get customProperties {
  if (_customProperties is EqualUnmodifiableListView) return _customProperties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customProperties);
}

@override@JsonKey(name: "generated_conversions") final  GeneratedConversionsClass generatedConversions;
 final  List<dynamic> _responsiveImages;
@override@JsonKey(name: "responsive_images") List<dynamic> get responsiveImages {
  if (_responsiveImages is EqualUnmodifiableListView) return _responsiveImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_responsiveImages);
}

@override@JsonKey(name: "order_column") final  int orderColumn;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override@JsonKey(name: "original_url") final  String originalUrl;
@override@JsonKey(name: "preview_url") final  String previewUrl;
@override@JsonKey(name: "url") final  String? url;
@override@JsonKey(name: "thumbnail") final  String? thumbnail;
@override@JsonKey(name: "preview") final  String? preview;

/// Create a copy of QrPhoto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrPhotoCopyWith<_QrPhoto> get copyWith => __$QrPhotoCopyWithImpl<_QrPhoto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrPhotoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrPhoto&&(identical(other.id, id) || other.id == id)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.disk, disk) || other.disk == disk)&&(identical(other.conversionsDisk, conversionsDisk) || other.conversionsDisk == conversionsDisk)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._manipulations, _manipulations)&&const DeepCollectionEquality().equals(other._customProperties, _customProperties)&&(identical(other.generatedConversions, generatedConversions) || other.generatedConversions == generatedConversions)&&const DeepCollectionEquality().equals(other._responsiveImages, _responsiveImages)&&(identical(other.orderColumn, orderColumn) || other.orderColumn == orderColumn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.preview, preview) || other.preview == preview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,modelType,modelId,uuid,collectionName,name,fileName,mimeType,disk,conversionsDisk,size,const DeepCollectionEquality().hash(_manipulations),const DeepCollectionEquality().hash(_customProperties),generatedConversions,const DeepCollectionEquality().hash(_responsiveImages),orderColumn,createdAt,updatedAt,originalUrl,previewUrl,url,thumbnail,preview]);

@override
String toString() {
  return 'QrPhoto(id: $id, modelType: $modelType, modelId: $modelId, uuid: $uuid, collectionName: $collectionName, name: $name, fileName: $fileName, mimeType: $mimeType, disk: $disk, conversionsDisk: $conversionsDisk, size: $size, manipulations: $manipulations, customProperties: $customProperties, generatedConversions: $generatedConversions, responsiveImages: $responsiveImages, orderColumn: $orderColumn, createdAt: $createdAt, updatedAt: $updatedAt, originalUrl: $originalUrl, previewUrl: $previewUrl, url: $url, thumbnail: $thumbnail, preview: $preview)';
}


}

/// @nodoc
abstract mixin class _$QrPhotoCopyWith<$Res> implements $QrPhotoCopyWith<$Res> {
  factory _$QrPhotoCopyWith(_QrPhoto value, $Res Function(_QrPhoto) _then) = __$QrPhotoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "model_type") String modelType,@JsonKey(name: "model_id") int modelId,@JsonKey(name: "uuid") String uuid,@JsonKey(name: "collection_name") String collectionName,@JsonKey(name: "name") String name,@JsonKey(name: "file_name") String fileName,@JsonKey(name: "mime_type") String mimeType,@JsonKey(name: "disk") String disk,@JsonKey(name: "conversions_disk") String conversionsDisk,@JsonKey(name: "size") int size,@JsonKey(name: "manipulations") List<dynamic> manipulations,@JsonKey(name: "custom_properties") List<dynamic> customProperties,@JsonKey(name: "generated_conversions") GeneratedConversionsClass generatedConversions,@JsonKey(name: "responsive_images") List<dynamic> responsiveImages,@JsonKey(name: "order_column") int orderColumn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "original_url") String originalUrl,@JsonKey(name: "preview_url") String previewUrl,@JsonKey(name: "url") String? url,@JsonKey(name: "thumbnail") String? thumbnail,@JsonKey(name: "preview") String? preview
});


@override $GeneratedConversionsClassCopyWith<$Res> get generatedConversions;

}
/// @nodoc
class __$QrPhotoCopyWithImpl<$Res>
    implements _$QrPhotoCopyWith<$Res> {
  __$QrPhotoCopyWithImpl(this._self, this._then);

  final _QrPhoto _self;
  final $Res Function(_QrPhoto) _then;

/// Create a copy of QrPhoto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? modelType = null,Object? modelId = null,Object? uuid = null,Object? collectionName = null,Object? name = null,Object? fileName = null,Object? mimeType = null,Object? disk = null,Object? conversionsDisk = null,Object? size = null,Object? manipulations = null,Object? customProperties = null,Object? generatedConversions = null,Object? responsiveImages = null,Object? orderColumn = null,Object? createdAt = null,Object? updatedAt = null,Object? originalUrl = null,Object? previewUrl = null,Object? url = freezed,Object? thumbnail = freezed,Object? preview = freezed,}) {
  return _then(_QrPhoto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,modelType: null == modelType ? _self.modelType : modelType // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,collectionName: null == collectionName ? _self.collectionName : collectionName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,disk: null == disk ? _self.disk : disk // ignore: cast_nullable_to_non_nullable
as String,conversionsDisk: null == conversionsDisk ? _self.conversionsDisk : conversionsDisk // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,manipulations: null == manipulations ? _self._manipulations : manipulations // ignore: cast_nullable_to_non_nullable
as List<dynamic>,customProperties: null == customProperties ? _self._customProperties : customProperties // ignore: cast_nullable_to_non_nullable
as List<dynamic>,generatedConversions: null == generatedConversions ? _self.generatedConversions : generatedConversions // ignore: cast_nullable_to_non_nullable
as GeneratedConversionsClass,responsiveImages: null == responsiveImages ? _self._responsiveImages : responsiveImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,orderColumn: null == orderColumn ? _self.orderColumn : orderColumn // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,previewUrl: null == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of QrPhoto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeneratedConversionsClassCopyWith<$Res> get generatedConversions {
  
  return $GeneratedConversionsClassCopyWith<$Res>(_self.generatedConversions, (value) {
    return _then(_self.copyWith(generatedConversions: value));
  });
}
}


/// @nodoc
mixin _$GeneratedConversionsClass {

@JsonKey(name: "thumb") bool get thumb;@JsonKey(name: "preview") bool get preview;
/// Create a copy of GeneratedConversionsClass
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneratedConversionsClassCopyWith<GeneratedConversionsClass> get copyWith => _$GeneratedConversionsClassCopyWithImpl<GeneratedConversionsClass>(this as GeneratedConversionsClass, _$identity);

  /// Serializes this GeneratedConversionsClass to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratedConversionsClass&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.preview, preview) || other.preview == preview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thumb,preview);

@override
String toString() {
  return 'GeneratedConversionsClass(thumb: $thumb, preview: $preview)';
}


}

/// @nodoc
abstract mixin class $GeneratedConversionsClassCopyWith<$Res>  {
  factory $GeneratedConversionsClassCopyWith(GeneratedConversionsClass value, $Res Function(GeneratedConversionsClass) _then) = _$GeneratedConversionsClassCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "thumb") bool thumb,@JsonKey(name: "preview") bool preview
});




}
/// @nodoc
class _$GeneratedConversionsClassCopyWithImpl<$Res>
    implements $GeneratedConversionsClassCopyWith<$Res> {
  _$GeneratedConversionsClassCopyWithImpl(this._self, this._then);

  final GeneratedConversionsClass _self;
  final $Res Function(GeneratedConversionsClass) _then;

/// Create a copy of GeneratedConversionsClass
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thumb = null,Object? preview = null,}) {
  return _then(_self.copyWith(
thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as bool,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneratedConversionsClass].
extension GeneratedConversionsClassPatterns on GeneratedConversionsClass {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneratedConversionsClass value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneratedConversionsClass() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneratedConversionsClass value)  $default,){
final _that = this;
switch (_that) {
case _GeneratedConversionsClass():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneratedConversionsClass value)?  $default,){
final _that = this;
switch (_that) {
case _GeneratedConversionsClass() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "thumb")  bool thumb, @JsonKey(name: "preview")  bool preview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneratedConversionsClass() when $default != null:
return $default(_that.thumb,_that.preview);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "thumb")  bool thumb, @JsonKey(name: "preview")  bool preview)  $default,) {final _that = this;
switch (_that) {
case _GeneratedConversionsClass():
return $default(_that.thumb,_that.preview);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "thumb")  bool thumb, @JsonKey(name: "preview")  bool preview)?  $default,) {final _that = this;
switch (_that) {
case _GeneratedConversionsClass() when $default != null:
return $default(_that.thumb,_that.preview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneratedConversionsClass implements GeneratedConversionsClass {
  const _GeneratedConversionsClass({@JsonKey(name: "thumb") required this.thumb, @JsonKey(name: "preview") required this.preview});
  factory _GeneratedConversionsClass.fromJson(Map<String, dynamic> json) => _$GeneratedConversionsClassFromJson(json);

@override@JsonKey(name: "thumb") final  bool thumb;
@override@JsonKey(name: "preview") final  bool preview;

/// Create a copy of GeneratedConversionsClass
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratedConversionsClassCopyWith<_GeneratedConversionsClass> get copyWith => __$GeneratedConversionsClassCopyWithImpl<_GeneratedConversionsClass>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneratedConversionsClassToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratedConversionsClass&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.preview, preview) || other.preview == preview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thumb,preview);

@override
String toString() {
  return 'GeneratedConversionsClass(thumb: $thumb, preview: $preview)';
}


}

/// @nodoc
abstract mixin class _$GeneratedConversionsClassCopyWith<$Res> implements $GeneratedConversionsClassCopyWith<$Res> {
  factory _$GeneratedConversionsClassCopyWith(_GeneratedConversionsClass value, $Res Function(_GeneratedConversionsClass) _then) = __$GeneratedConversionsClassCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "thumb") bool thumb,@JsonKey(name: "preview") bool preview
});




}
/// @nodoc
class __$GeneratedConversionsClassCopyWithImpl<$Res>
    implements _$GeneratedConversionsClassCopyWith<$Res> {
  __$GeneratedConversionsClassCopyWithImpl(this._self, this._then);

  final _GeneratedConversionsClass _self;
  final $Res Function(_GeneratedConversionsClass) _then;

/// Create a copy of GeneratedConversionsClass
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thumb = null,Object? preview = null,}) {
  return _then(_GeneratedConversionsClass(
thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as bool,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$FirmName {

@JsonKey(name: "id") int get id;@JsonKey(name: "firm_name") String get firmName;@JsonKey(name: "website") String get website;@JsonKey(name: "instagram_url") String get instagramUrl;@JsonKey(name: "linkedin_url") String get linkedinUrl;@JsonKey(name: "youtube_video_url") String get youtubeVideoUrl;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "deleted_at") dynamic get deletedAt;@JsonKey(name: "logo") QrPhoto get logo;@JsonKey(name: "main_background") QrPhoto get mainBackground;@JsonKey(name: "catalog_tr") Catalog get catalogTr;@JsonKey(name: "catalog_en") Catalog get catalogEn;@JsonKey(name: "media") List<Media> get media;
/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirmNameCopyWith<FirmName> get copyWith => _$FirmNameCopyWithImpl<FirmName>(this as FirmName, _$identity);

  /// Serializes this FirmName to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirmName&&(identical(other.id, id) || other.id == id)&&(identical(other.firmName, firmName) || other.firmName == firmName)&&(identical(other.website, website) || other.website == website)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.youtubeVideoUrl, youtubeVideoUrl) || other.youtubeVideoUrl == youtubeVideoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.mainBackground, mainBackground) || other.mainBackground == mainBackground)&&(identical(other.catalogTr, catalogTr) || other.catalogTr == catalogTr)&&(identical(other.catalogEn, catalogEn) || other.catalogEn == catalogEn)&&const DeepCollectionEquality().equals(other.media, media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firmName,website,instagramUrl,linkedinUrl,youtubeVideoUrl,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),logo,mainBackground,catalogTr,catalogEn,const DeepCollectionEquality().hash(media));

@override
String toString() {
  return 'FirmName(id: $id, firmName: $firmName, website: $website, instagramUrl: $instagramUrl, linkedinUrl: $linkedinUrl, youtubeVideoUrl: $youtubeVideoUrl, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, logo: $logo, mainBackground: $mainBackground, catalogTr: $catalogTr, catalogEn: $catalogEn, media: $media)';
}


}

/// @nodoc
abstract mixin class $FirmNameCopyWith<$Res>  {
  factory $FirmNameCopyWith(FirmName value, $Res Function(FirmName) _then) = _$FirmNameCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "firm_name") String firmName,@JsonKey(name: "website") String website,@JsonKey(name: "instagram_url") String instagramUrl,@JsonKey(name: "linkedin_url") String linkedinUrl,@JsonKey(name: "youtube_video_url") String youtubeVideoUrl,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "logo") QrPhoto logo,@JsonKey(name: "main_background") QrPhoto mainBackground,@JsonKey(name: "catalog_tr") Catalog catalogTr,@JsonKey(name: "catalog_en") Catalog catalogEn,@JsonKey(name: "media") List<Media> media
});


$QrPhotoCopyWith<$Res> get logo;$QrPhotoCopyWith<$Res> get mainBackground;$CatalogCopyWith<$Res> get catalogTr;$CatalogCopyWith<$Res> get catalogEn;

}
/// @nodoc
class _$FirmNameCopyWithImpl<$Res>
    implements $FirmNameCopyWith<$Res> {
  _$FirmNameCopyWithImpl(this._self, this._then);

  final FirmName _self;
  final $Res Function(FirmName) _then;

/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firmName = null,Object? website = null,Object? instagramUrl = null,Object? linkedinUrl = null,Object? youtubeVideoUrl = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? logo = null,Object? mainBackground = null,Object? catalogTr = null,Object? catalogEn = null,Object? media = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firmName: null == firmName ? _self.firmName : firmName // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,instagramUrl: null == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String,linkedinUrl: null == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as String,youtubeVideoUrl: null == youtubeVideoUrl ? _self.youtubeVideoUrl : youtubeVideoUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as QrPhoto,mainBackground: null == mainBackground ? _self.mainBackground : mainBackground // ignore: cast_nullable_to_non_nullable
as QrPhoto,catalogTr: null == catalogTr ? _self.catalogTr : catalogTr // ignore: cast_nullable_to_non_nullable
as Catalog,catalogEn: null == catalogEn ? _self.catalogEn : catalogEn // ignore: cast_nullable_to_non_nullable
as Catalog,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<Media>,
  ));
}
/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<$Res> get logo {
  
  return $QrPhotoCopyWith<$Res>(_self.logo, (value) {
    return _then(_self.copyWith(logo: value));
  });
}/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<$Res> get mainBackground {
  
  return $QrPhotoCopyWith<$Res>(_self.mainBackground, (value) {
    return _then(_self.copyWith(mainBackground: value));
  });
}/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogCopyWith<$Res> get catalogTr {
  
  return $CatalogCopyWith<$Res>(_self.catalogTr, (value) {
    return _then(_self.copyWith(catalogTr: value));
  });
}/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogCopyWith<$Res> get catalogEn {
  
  return $CatalogCopyWith<$Res>(_self.catalogEn, (value) {
    return _then(_self.copyWith(catalogEn: value));
  });
}
}


/// Adds pattern-matching-related methods to [FirmName].
extension FirmNamePatterns on FirmName {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FirmName value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirmName() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FirmName value)  $default,){
final _that = this;
switch (_that) {
case _FirmName():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FirmName value)?  $default,){
final _that = this;
switch (_that) {
case _FirmName() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "firm_name")  String firmName, @JsonKey(name: "website")  String website, @JsonKey(name: "instagram_url")  String instagramUrl, @JsonKey(name: "linkedin_url")  String linkedinUrl, @JsonKey(name: "youtube_video_url")  String youtubeVideoUrl, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "logo")  QrPhoto logo, @JsonKey(name: "main_background")  QrPhoto mainBackground, @JsonKey(name: "catalog_tr")  Catalog catalogTr, @JsonKey(name: "catalog_en")  Catalog catalogEn, @JsonKey(name: "media")  List<Media> media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FirmName() when $default != null:
return $default(_that.id,_that.firmName,_that.website,_that.instagramUrl,_that.linkedinUrl,_that.youtubeVideoUrl,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.logo,_that.mainBackground,_that.catalogTr,_that.catalogEn,_that.media);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "firm_name")  String firmName, @JsonKey(name: "website")  String website, @JsonKey(name: "instagram_url")  String instagramUrl, @JsonKey(name: "linkedin_url")  String linkedinUrl, @JsonKey(name: "youtube_video_url")  String youtubeVideoUrl, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "logo")  QrPhoto logo, @JsonKey(name: "main_background")  QrPhoto mainBackground, @JsonKey(name: "catalog_tr")  Catalog catalogTr, @JsonKey(name: "catalog_en")  Catalog catalogEn, @JsonKey(name: "media")  List<Media> media)  $default,) {final _that = this;
switch (_that) {
case _FirmName():
return $default(_that.id,_that.firmName,_that.website,_that.instagramUrl,_that.linkedinUrl,_that.youtubeVideoUrl,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.logo,_that.mainBackground,_that.catalogTr,_that.catalogEn,_that.media);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "firm_name")  String firmName, @JsonKey(name: "website")  String website, @JsonKey(name: "instagram_url")  String instagramUrl, @JsonKey(name: "linkedin_url")  String linkedinUrl, @JsonKey(name: "youtube_video_url")  String youtubeVideoUrl, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "logo")  QrPhoto logo, @JsonKey(name: "main_background")  QrPhoto mainBackground, @JsonKey(name: "catalog_tr")  Catalog catalogTr, @JsonKey(name: "catalog_en")  Catalog catalogEn, @JsonKey(name: "media")  List<Media> media)?  $default,) {final _that = this;
switch (_that) {
case _FirmName() when $default != null:
return $default(_that.id,_that.firmName,_that.website,_that.instagramUrl,_that.linkedinUrl,_that.youtubeVideoUrl,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.logo,_that.mainBackground,_that.catalogTr,_that.catalogEn,_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FirmName implements FirmName {
  const _FirmName({@JsonKey(name: "id") required this.id, @JsonKey(name: "firm_name") required this.firmName, @JsonKey(name: "website") required this.website, @JsonKey(name: "instagram_url") required this.instagramUrl, @JsonKey(name: "linkedin_url") required this.linkedinUrl, @JsonKey(name: "youtube_video_url") required this.youtubeVideoUrl, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "deleted_at") required this.deletedAt, @JsonKey(name: "logo") required this.logo, @JsonKey(name: "main_background") required this.mainBackground, @JsonKey(name: "catalog_tr") required this.catalogTr, @JsonKey(name: "catalog_en") required this.catalogEn, @JsonKey(name: "media") required final  List<Media> media}): _media = media;
  factory _FirmName.fromJson(Map<String, dynamic> json) => _$FirmNameFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "firm_name") final  String firmName;
@override@JsonKey(name: "website") final  String website;
@override@JsonKey(name: "instagram_url") final  String instagramUrl;
@override@JsonKey(name: "linkedin_url") final  String linkedinUrl;
@override@JsonKey(name: "youtube_video_url") final  String youtubeVideoUrl;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override@JsonKey(name: "deleted_at") final  dynamic deletedAt;
@override@JsonKey(name: "logo") final  QrPhoto logo;
@override@JsonKey(name: "main_background") final  QrPhoto mainBackground;
@override@JsonKey(name: "catalog_tr") final  Catalog catalogTr;
@override@JsonKey(name: "catalog_en") final  Catalog catalogEn;
 final  List<Media> _media;
@override@JsonKey(name: "media") List<Media> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}


/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirmNameCopyWith<_FirmName> get copyWith => __$FirmNameCopyWithImpl<_FirmName>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FirmNameToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirmName&&(identical(other.id, id) || other.id == id)&&(identical(other.firmName, firmName) || other.firmName == firmName)&&(identical(other.website, website) || other.website == website)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.youtubeVideoUrl, youtubeVideoUrl) || other.youtubeVideoUrl == youtubeVideoUrl)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.logo, logo) || other.logo == logo)&&(identical(other.mainBackground, mainBackground) || other.mainBackground == mainBackground)&&(identical(other.catalogTr, catalogTr) || other.catalogTr == catalogTr)&&(identical(other.catalogEn, catalogEn) || other.catalogEn == catalogEn)&&const DeepCollectionEquality().equals(other._media, _media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firmName,website,instagramUrl,linkedinUrl,youtubeVideoUrl,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),logo,mainBackground,catalogTr,catalogEn,const DeepCollectionEquality().hash(_media));

@override
String toString() {
  return 'FirmName(id: $id, firmName: $firmName, website: $website, instagramUrl: $instagramUrl, linkedinUrl: $linkedinUrl, youtubeVideoUrl: $youtubeVideoUrl, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, logo: $logo, mainBackground: $mainBackground, catalogTr: $catalogTr, catalogEn: $catalogEn, media: $media)';
}


}

/// @nodoc
abstract mixin class _$FirmNameCopyWith<$Res> implements $FirmNameCopyWith<$Res> {
  factory _$FirmNameCopyWith(_FirmName value, $Res Function(_FirmName) _then) = __$FirmNameCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "firm_name") String firmName,@JsonKey(name: "website") String website,@JsonKey(name: "instagram_url") String instagramUrl,@JsonKey(name: "linkedin_url") String linkedinUrl,@JsonKey(name: "youtube_video_url") String youtubeVideoUrl,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "logo") QrPhoto logo,@JsonKey(name: "main_background") QrPhoto mainBackground,@JsonKey(name: "catalog_tr") Catalog catalogTr,@JsonKey(name: "catalog_en") Catalog catalogEn,@JsonKey(name: "media") List<Media> media
});


@override $QrPhotoCopyWith<$Res> get logo;@override $QrPhotoCopyWith<$Res> get mainBackground;@override $CatalogCopyWith<$Res> get catalogTr;@override $CatalogCopyWith<$Res> get catalogEn;

}
/// @nodoc
class __$FirmNameCopyWithImpl<$Res>
    implements _$FirmNameCopyWith<$Res> {
  __$FirmNameCopyWithImpl(this._self, this._then);

  final _FirmName _self;
  final $Res Function(_FirmName) _then;

/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firmName = null,Object? website = null,Object? instagramUrl = null,Object? linkedinUrl = null,Object? youtubeVideoUrl = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? logo = null,Object? mainBackground = null,Object? catalogTr = null,Object? catalogEn = null,Object? media = null,}) {
  return _then(_FirmName(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firmName: null == firmName ? _self.firmName : firmName // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,instagramUrl: null == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String,linkedinUrl: null == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as String,youtubeVideoUrl: null == youtubeVideoUrl ? _self.youtubeVideoUrl : youtubeVideoUrl // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,logo: null == logo ? _self.logo : logo // ignore: cast_nullable_to_non_nullable
as QrPhoto,mainBackground: null == mainBackground ? _self.mainBackground : mainBackground // ignore: cast_nullable_to_non_nullable
as QrPhoto,catalogTr: null == catalogTr ? _self.catalogTr : catalogTr // ignore: cast_nullable_to_non_nullable
as Catalog,catalogEn: null == catalogEn ? _self.catalogEn : catalogEn // ignore: cast_nullable_to_non_nullable
as Catalog,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<Media>,
  ));
}

/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<$Res> get logo {
  
  return $QrPhotoCopyWith<$Res>(_self.logo, (value) {
    return _then(_self.copyWith(logo: value));
  });
}/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrPhotoCopyWith<$Res> get mainBackground {
  
  return $QrPhotoCopyWith<$Res>(_self.mainBackground, (value) {
    return _then(_self.copyWith(mainBackground: value));
  });
}/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogCopyWith<$Res> get catalogTr {
  
  return $CatalogCopyWith<$Res>(_self.catalogTr, (value) {
    return _then(_self.copyWith(catalogTr: value));
  });
}/// Create a copy of FirmName
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogCopyWith<$Res> get catalogEn {
  
  return $CatalogCopyWith<$Res>(_self.catalogEn, (value) {
    return _then(_self.copyWith(catalogEn: value));
  });
}
}


/// @nodoc
mixin _$Catalog {

@JsonKey(name: "id") int get id;@JsonKey(name: "model_type") String get modelType;@JsonKey(name: "model_id") int get modelId;@JsonKey(name: "uuid") String get uuid;@JsonKey(name: "collection_name") String get collectionName;@JsonKey(name: "name") String get name;@JsonKey(name: "file_name") String get fileName;@JsonKey(name: "mime_type") String get mimeType;@JsonKey(name: "disk") String get disk;@JsonKey(name: "conversions_disk") String get conversionsDisk;@JsonKey(name: "size") int get size;@JsonKey(name: "manipulations") List<dynamic> get manipulations;@JsonKey(name: "custom_properties") List<dynamic> get customProperties;@JsonKey(name: "generated_conversions") List<dynamic> get generatedConversions;@JsonKey(name: "responsive_images") List<dynamic> get responsiveImages;@JsonKey(name: "order_column") int get orderColumn;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "original_url") String get originalUrl;@JsonKey(name: "preview_url") String get previewUrl;
/// Create a copy of Catalog
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogCopyWith<Catalog> get copyWith => _$CatalogCopyWithImpl<Catalog>(this as Catalog, _$identity);

  /// Serializes this Catalog to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Catalog&&(identical(other.id, id) || other.id == id)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.disk, disk) || other.disk == disk)&&(identical(other.conversionsDisk, conversionsDisk) || other.conversionsDisk == conversionsDisk)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.manipulations, manipulations)&&const DeepCollectionEquality().equals(other.customProperties, customProperties)&&const DeepCollectionEquality().equals(other.generatedConversions, generatedConversions)&&const DeepCollectionEquality().equals(other.responsiveImages, responsiveImages)&&(identical(other.orderColumn, orderColumn) || other.orderColumn == orderColumn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,modelType,modelId,uuid,collectionName,name,fileName,mimeType,disk,conversionsDisk,size,const DeepCollectionEquality().hash(manipulations),const DeepCollectionEquality().hash(customProperties),const DeepCollectionEquality().hash(generatedConversions),const DeepCollectionEquality().hash(responsiveImages),orderColumn,createdAt,updatedAt,originalUrl,previewUrl]);

@override
String toString() {
  return 'Catalog(id: $id, modelType: $modelType, modelId: $modelId, uuid: $uuid, collectionName: $collectionName, name: $name, fileName: $fileName, mimeType: $mimeType, disk: $disk, conversionsDisk: $conversionsDisk, size: $size, manipulations: $manipulations, customProperties: $customProperties, generatedConversions: $generatedConversions, responsiveImages: $responsiveImages, orderColumn: $orderColumn, createdAt: $createdAt, updatedAt: $updatedAt, originalUrl: $originalUrl, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class $CatalogCopyWith<$Res>  {
  factory $CatalogCopyWith(Catalog value, $Res Function(Catalog) _then) = _$CatalogCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "model_type") String modelType,@JsonKey(name: "model_id") int modelId,@JsonKey(name: "uuid") String uuid,@JsonKey(name: "collection_name") String collectionName,@JsonKey(name: "name") String name,@JsonKey(name: "file_name") String fileName,@JsonKey(name: "mime_type") String mimeType,@JsonKey(name: "disk") String disk,@JsonKey(name: "conversions_disk") String conversionsDisk,@JsonKey(name: "size") int size,@JsonKey(name: "manipulations") List<dynamic> manipulations,@JsonKey(name: "custom_properties") List<dynamic> customProperties,@JsonKey(name: "generated_conversions") List<dynamic> generatedConversions,@JsonKey(name: "responsive_images") List<dynamic> responsiveImages,@JsonKey(name: "order_column") int orderColumn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "original_url") String originalUrl,@JsonKey(name: "preview_url") String previewUrl
});




}
/// @nodoc
class _$CatalogCopyWithImpl<$Res>
    implements $CatalogCopyWith<$Res> {
  _$CatalogCopyWithImpl(this._self, this._then);

  final Catalog _self;
  final $Res Function(Catalog) _then;

/// Create a copy of Catalog
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? modelType = null,Object? modelId = null,Object? uuid = null,Object? collectionName = null,Object? name = null,Object? fileName = null,Object? mimeType = null,Object? disk = null,Object? conversionsDisk = null,Object? size = null,Object? manipulations = null,Object? customProperties = null,Object? generatedConversions = null,Object? responsiveImages = null,Object? orderColumn = null,Object? createdAt = null,Object? updatedAt = null,Object? originalUrl = null,Object? previewUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,modelType: null == modelType ? _self.modelType : modelType // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,collectionName: null == collectionName ? _self.collectionName : collectionName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,disk: null == disk ? _self.disk : disk // ignore: cast_nullable_to_non_nullable
as String,conversionsDisk: null == conversionsDisk ? _self.conversionsDisk : conversionsDisk // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,manipulations: null == manipulations ? _self.manipulations : manipulations // ignore: cast_nullable_to_non_nullable
as List<dynamic>,customProperties: null == customProperties ? _self.customProperties : customProperties // ignore: cast_nullable_to_non_nullable
as List<dynamic>,generatedConversions: null == generatedConversions ? _self.generatedConversions : generatedConversions // ignore: cast_nullable_to_non_nullable
as List<dynamic>,responsiveImages: null == responsiveImages ? _self.responsiveImages : responsiveImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,orderColumn: null == orderColumn ? _self.orderColumn : orderColumn // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,previewUrl: null == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Catalog].
extension CatalogPatterns on Catalog {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Catalog value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Catalog() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Catalog value)  $default,){
final _that = this;
switch (_that) {
case _Catalog():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Catalog value)?  $default,){
final _that = this;
switch (_that) {
case _Catalog() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  List<dynamic> generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Catalog() when $default != null:
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.originalUrl,_that.previewUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  List<dynamic> generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)  $default,) {final _that = this;
switch (_that) {
case _Catalog():
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.originalUrl,_that.previewUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  List<dynamic> generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)?  $default,) {final _that = this;
switch (_that) {
case _Catalog() when $default != null:
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.originalUrl,_that.previewUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Catalog implements Catalog {
  const _Catalog({@JsonKey(name: "id") required this.id, @JsonKey(name: "model_type") required this.modelType, @JsonKey(name: "model_id") required this.modelId, @JsonKey(name: "uuid") required this.uuid, @JsonKey(name: "collection_name") required this.collectionName, @JsonKey(name: "name") required this.name, @JsonKey(name: "file_name") required this.fileName, @JsonKey(name: "mime_type") required this.mimeType, @JsonKey(name: "disk") required this.disk, @JsonKey(name: "conversions_disk") required this.conversionsDisk, @JsonKey(name: "size") required this.size, @JsonKey(name: "manipulations") required final  List<dynamic> manipulations, @JsonKey(name: "custom_properties") required final  List<dynamic> customProperties, @JsonKey(name: "generated_conversions") required final  List<dynamic> generatedConversions, @JsonKey(name: "responsive_images") required final  List<dynamic> responsiveImages, @JsonKey(name: "order_column") required this.orderColumn, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "original_url") required this.originalUrl, @JsonKey(name: "preview_url") required this.previewUrl}): _manipulations = manipulations,_customProperties = customProperties,_generatedConversions = generatedConversions,_responsiveImages = responsiveImages;
  factory _Catalog.fromJson(Map<String, dynamic> json) => _$CatalogFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "model_type") final  String modelType;
@override@JsonKey(name: "model_id") final  int modelId;
@override@JsonKey(name: "uuid") final  String uuid;
@override@JsonKey(name: "collection_name") final  String collectionName;
@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "file_name") final  String fileName;
@override@JsonKey(name: "mime_type") final  String mimeType;
@override@JsonKey(name: "disk") final  String disk;
@override@JsonKey(name: "conversions_disk") final  String conversionsDisk;
@override@JsonKey(name: "size") final  int size;
 final  List<dynamic> _manipulations;
@override@JsonKey(name: "manipulations") List<dynamic> get manipulations {
  if (_manipulations is EqualUnmodifiableListView) return _manipulations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_manipulations);
}

 final  List<dynamic> _customProperties;
@override@JsonKey(name: "custom_properties") List<dynamic> get customProperties {
  if (_customProperties is EqualUnmodifiableListView) return _customProperties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customProperties);
}

 final  List<dynamic> _generatedConversions;
@override@JsonKey(name: "generated_conversions") List<dynamic> get generatedConversions {
  if (_generatedConversions is EqualUnmodifiableListView) return _generatedConversions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_generatedConversions);
}

 final  List<dynamic> _responsiveImages;
@override@JsonKey(name: "responsive_images") List<dynamic> get responsiveImages {
  if (_responsiveImages is EqualUnmodifiableListView) return _responsiveImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_responsiveImages);
}

@override@JsonKey(name: "order_column") final  int orderColumn;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override@JsonKey(name: "original_url") final  String originalUrl;
@override@JsonKey(name: "preview_url") final  String previewUrl;

/// Create a copy of Catalog
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogCopyWith<_Catalog> get copyWith => __$CatalogCopyWithImpl<_Catalog>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Catalog&&(identical(other.id, id) || other.id == id)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.disk, disk) || other.disk == disk)&&(identical(other.conversionsDisk, conversionsDisk) || other.conversionsDisk == conversionsDisk)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._manipulations, _manipulations)&&const DeepCollectionEquality().equals(other._customProperties, _customProperties)&&const DeepCollectionEquality().equals(other._generatedConversions, _generatedConversions)&&const DeepCollectionEquality().equals(other._responsiveImages, _responsiveImages)&&(identical(other.orderColumn, orderColumn) || other.orderColumn == orderColumn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,modelType,modelId,uuid,collectionName,name,fileName,mimeType,disk,conversionsDisk,size,const DeepCollectionEquality().hash(_manipulations),const DeepCollectionEquality().hash(_customProperties),const DeepCollectionEquality().hash(_generatedConversions),const DeepCollectionEquality().hash(_responsiveImages),orderColumn,createdAt,updatedAt,originalUrl,previewUrl]);

@override
String toString() {
  return 'Catalog(id: $id, modelType: $modelType, modelId: $modelId, uuid: $uuid, collectionName: $collectionName, name: $name, fileName: $fileName, mimeType: $mimeType, disk: $disk, conversionsDisk: $conversionsDisk, size: $size, manipulations: $manipulations, customProperties: $customProperties, generatedConversions: $generatedConversions, responsiveImages: $responsiveImages, orderColumn: $orderColumn, createdAt: $createdAt, updatedAt: $updatedAt, originalUrl: $originalUrl, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class _$CatalogCopyWith<$Res> implements $CatalogCopyWith<$Res> {
  factory _$CatalogCopyWith(_Catalog value, $Res Function(_Catalog) _then) = __$CatalogCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "model_type") String modelType,@JsonKey(name: "model_id") int modelId,@JsonKey(name: "uuid") String uuid,@JsonKey(name: "collection_name") String collectionName,@JsonKey(name: "name") String name,@JsonKey(name: "file_name") String fileName,@JsonKey(name: "mime_type") String mimeType,@JsonKey(name: "disk") String disk,@JsonKey(name: "conversions_disk") String conversionsDisk,@JsonKey(name: "size") int size,@JsonKey(name: "manipulations") List<dynamic> manipulations,@JsonKey(name: "custom_properties") List<dynamic> customProperties,@JsonKey(name: "generated_conversions") List<dynamic> generatedConversions,@JsonKey(name: "responsive_images") List<dynamic> responsiveImages,@JsonKey(name: "order_column") int orderColumn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "original_url") String originalUrl,@JsonKey(name: "preview_url") String previewUrl
});




}
/// @nodoc
class __$CatalogCopyWithImpl<$Res>
    implements _$CatalogCopyWith<$Res> {
  __$CatalogCopyWithImpl(this._self, this._then);

  final _Catalog _self;
  final $Res Function(_Catalog) _then;

/// Create a copy of Catalog
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? modelType = null,Object? modelId = null,Object? uuid = null,Object? collectionName = null,Object? name = null,Object? fileName = null,Object? mimeType = null,Object? disk = null,Object? conversionsDisk = null,Object? size = null,Object? manipulations = null,Object? customProperties = null,Object? generatedConversions = null,Object? responsiveImages = null,Object? orderColumn = null,Object? createdAt = null,Object? updatedAt = null,Object? originalUrl = null,Object? previewUrl = null,}) {
  return _then(_Catalog(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,modelType: null == modelType ? _self.modelType : modelType // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,collectionName: null == collectionName ? _self.collectionName : collectionName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,disk: null == disk ? _self.disk : disk // ignore: cast_nullable_to_non_nullable
as String,conversionsDisk: null == conversionsDisk ? _self.conversionsDisk : conversionsDisk // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,manipulations: null == manipulations ? _self._manipulations : manipulations // ignore: cast_nullable_to_non_nullable
as List<dynamic>,customProperties: null == customProperties ? _self._customProperties : customProperties // ignore: cast_nullable_to_non_nullable
as List<dynamic>,generatedConversions: null == generatedConversions ? _self._generatedConversions : generatedConversions // ignore: cast_nullable_to_non_nullable
as List<dynamic>,responsiveImages: null == responsiveImages ? _self._responsiveImages : responsiveImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,orderColumn: null == orderColumn ? _self.orderColumn : orderColumn // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,previewUrl: null == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Media {

@JsonKey(name: "id") int get id;@JsonKey(name: "model_type") String get modelType;@JsonKey(name: "model_id") int get modelId;@JsonKey(name: "uuid") String get uuid;@JsonKey(name: "collection_name") String get collectionName;@JsonKey(name: "name") String get name;@JsonKey(name: "file_name") String get fileName;@JsonKey(name: "mime_type") String get mimeType;@JsonKey(name: "disk") String get disk;@JsonKey(name: "conversions_disk") String get conversionsDisk;@JsonKey(name: "size") int get size;@JsonKey(name: "manipulations") List<dynamic> get manipulations;@JsonKey(name: "custom_properties") List<dynamic> get customProperties;@JsonKey(name: "generated_conversions") dynamic get generatedConversions;@JsonKey(name: "responsive_images") List<dynamic> get responsiveImages;@JsonKey(name: "order_column") int get orderColumn;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "url") String? get url;@JsonKey(name: "thumbnail") String? get thumbnail;@JsonKey(name: "preview") String? get preview;@JsonKey(name: "original_url") String get originalUrl;@JsonKey(name: "preview_url") String get previewUrl;
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaCopyWith<Media> get copyWith => _$MediaCopyWithImpl<Media>(this as Media, _$identity);

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Media&&(identical(other.id, id) || other.id == id)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.disk, disk) || other.disk == disk)&&(identical(other.conversionsDisk, conversionsDisk) || other.conversionsDisk == conversionsDisk)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.manipulations, manipulations)&&const DeepCollectionEquality().equals(other.customProperties, customProperties)&&const DeepCollectionEquality().equals(other.generatedConversions, generatedConversions)&&const DeepCollectionEquality().equals(other.responsiveImages, responsiveImages)&&(identical(other.orderColumn, orderColumn) || other.orderColumn == orderColumn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,modelType,modelId,uuid,collectionName,name,fileName,mimeType,disk,conversionsDisk,size,const DeepCollectionEquality().hash(manipulations),const DeepCollectionEquality().hash(customProperties),const DeepCollectionEquality().hash(generatedConversions),const DeepCollectionEquality().hash(responsiveImages),orderColumn,createdAt,updatedAt,url,thumbnail,preview,originalUrl,previewUrl]);

@override
String toString() {
  return 'Media(id: $id, modelType: $modelType, modelId: $modelId, uuid: $uuid, collectionName: $collectionName, name: $name, fileName: $fileName, mimeType: $mimeType, disk: $disk, conversionsDisk: $conversionsDisk, size: $size, manipulations: $manipulations, customProperties: $customProperties, generatedConversions: $generatedConversions, responsiveImages: $responsiveImages, orderColumn: $orderColumn, createdAt: $createdAt, updatedAt: $updatedAt, url: $url, thumbnail: $thumbnail, preview: $preview, originalUrl: $originalUrl, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class $MediaCopyWith<$Res>  {
  factory $MediaCopyWith(Media value, $Res Function(Media) _then) = _$MediaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "model_type") String modelType,@JsonKey(name: "model_id") int modelId,@JsonKey(name: "uuid") String uuid,@JsonKey(name: "collection_name") String collectionName,@JsonKey(name: "name") String name,@JsonKey(name: "file_name") String fileName,@JsonKey(name: "mime_type") String mimeType,@JsonKey(name: "disk") String disk,@JsonKey(name: "conversions_disk") String conversionsDisk,@JsonKey(name: "size") int size,@JsonKey(name: "manipulations") List<dynamic> manipulations,@JsonKey(name: "custom_properties") List<dynamic> customProperties,@JsonKey(name: "generated_conversions") dynamic generatedConversions,@JsonKey(name: "responsive_images") List<dynamic> responsiveImages,@JsonKey(name: "order_column") int orderColumn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "url") String? url,@JsonKey(name: "thumbnail") String? thumbnail,@JsonKey(name: "preview") String? preview,@JsonKey(name: "original_url") String originalUrl,@JsonKey(name: "preview_url") String previewUrl
});




}
/// @nodoc
class _$MediaCopyWithImpl<$Res>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._self, this._then);

  final Media _self;
  final $Res Function(Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? modelType = null,Object? modelId = null,Object? uuid = null,Object? collectionName = null,Object? name = null,Object? fileName = null,Object? mimeType = null,Object? disk = null,Object? conversionsDisk = null,Object? size = null,Object? manipulations = null,Object? customProperties = null,Object? generatedConversions = freezed,Object? responsiveImages = null,Object? orderColumn = null,Object? createdAt = null,Object? updatedAt = null,Object? url = freezed,Object? thumbnail = freezed,Object? preview = freezed,Object? originalUrl = null,Object? previewUrl = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,modelType: null == modelType ? _self.modelType : modelType // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,collectionName: null == collectionName ? _self.collectionName : collectionName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,disk: null == disk ? _self.disk : disk // ignore: cast_nullable_to_non_nullable
as String,conversionsDisk: null == conversionsDisk ? _self.conversionsDisk : conversionsDisk // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,manipulations: null == manipulations ? _self.manipulations : manipulations // ignore: cast_nullable_to_non_nullable
as List<dynamic>,customProperties: null == customProperties ? _self.customProperties : customProperties // ignore: cast_nullable_to_non_nullable
as List<dynamic>,generatedConversions: freezed == generatedConversions ? _self.generatedConversions : generatedConversions // ignore: cast_nullable_to_non_nullable
as dynamic,responsiveImages: null == responsiveImages ? _self.responsiveImages : responsiveImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,orderColumn: null == orderColumn ? _self.orderColumn : orderColumn // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,previewUrl: null == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Media].
extension MediaPatterns on Media {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Media value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Media value)  $default,){
final _that = this;
switch (_that) {
case _Media():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Media value)?  $default,){
final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  dynamic generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.url,_that.thumbnail,_that.preview,_that.originalUrl,_that.previewUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  dynamic generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)  $default,) {final _that = this;
switch (_that) {
case _Media():
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.url,_that.thumbnail,_that.preview,_that.originalUrl,_that.previewUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  dynamic generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)?  $default,) {final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.url,_that.thumbnail,_that.preview,_that.originalUrl,_that.previewUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Media implements Media {
  const _Media({@JsonKey(name: "id") required this.id, @JsonKey(name: "model_type") required this.modelType, @JsonKey(name: "model_id") required this.modelId, @JsonKey(name: "uuid") required this.uuid, @JsonKey(name: "collection_name") required this.collectionName, @JsonKey(name: "name") required this.name, @JsonKey(name: "file_name") required this.fileName, @JsonKey(name: "mime_type") required this.mimeType, @JsonKey(name: "disk") required this.disk, @JsonKey(name: "conversions_disk") required this.conversionsDisk, @JsonKey(name: "size") required this.size, @JsonKey(name: "manipulations") required final  List<dynamic> manipulations, @JsonKey(name: "custom_properties") required final  List<dynamic> customProperties, @JsonKey(name: "generated_conversions") required this.generatedConversions, @JsonKey(name: "responsive_images") required final  List<dynamic> responsiveImages, @JsonKey(name: "order_column") required this.orderColumn, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "url") this.url, @JsonKey(name: "thumbnail") this.thumbnail, @JsonKey(name: "preview") this.preview, @JsonKey(name: "original_url") required this.originalUrl, @JsonKey(name: "preview_url") required this.previewUrl}): _manipulations = manipulations,_customProperties = customProperties,_responsiveImages = responsiveImages;
  factory _Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "model_type") final  String modelType;
@override@JsonKey(name: "model_id") final  int modelId;
@override@JsonKey(name: "uuid") final  String uuid;
@override@JsonKey(name: "collection_name") final  String collectionName;
@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "file_name") final  String fileName;
@override@JsonKey(name: "mime_type") final  String mimeType;
@override@JsonKey(name: "disk") final  String disk;
@override@JsonKey(name: "conversions_disk") final  String conversionsDisk;
@override@JsonKey(name: "size") final  int size;
 final  List<dynamic> _manipulations;
@override@JsonKey(name: "manipulations") List<dynamic> get manipulations {
  if (_manipulations is EqualUnmodifiableListView) return _manipulations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_manipulations);
}

 final  List<dynamic> _customProperties;
@override@JsonKey(name: "custom_properties") List<dynamic> get customProperties {
  if (_customProperties is EqualUnmodifiableListView) return _customProperties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_customProperties);
}

@override@JsonKey(name: "generated_conversions") final  dynamic generatedConversions;
 final  List<dynamic> _responsiveImages;
@override@JsonKey(name: "responsive_images") List<dynamic> get responsiveImages {
  if (_responsiveImages is EqualUnmodifiableListView) return _responsiveImages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_responsiveImages);
}

@override@JsonKey(name: "order_column") final  int orderColumn;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override@JsonKey(name: "url") final  String? url;
@override@JsonKey(name: "thumbnail") final  String? thumbnail;
@override@JsonKey(name: "preview") final  String? preview;
@override@JsonKey(name: "original_url") final  String originalUrl;
@override@JsonKey(name: "preview_url") final  String previewUrl;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaCopyWith<_Media> get copyWith => __$MediaCopyWithImpl<_Media>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Media&&(identical(other.id, id) || other.id == id)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.disk, disk) || other.disk == disk)&&(identical(other.conversionsDisk, conversionsDisk) || other.conversionsDisk == conversionsDisk)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._manipulations, _manipulations)&&const DeepCollectionEquality().equals(other._customProperties, _customProperties)&&const DeepCollectionEquality().equals(other.generatedConversions, generatedConversions)&&const DeepCollectionEquality().equals(other._responsiveImages, _responsiveImages)&&(identical(other.orderColumn, orderColumn) || other.orderColumn == orderColumn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,modelType,modelId,uuid,collectionName,name,fileName,mimeType,disk,conversionsDisk,size,const DeepCollectionEquality().hash(_manipulations),const DeepCollectionEquality().hash(_customProperties),const DeepCollectionEquality().hash(generatedConversions),const DeepCollectionEquality().hash(_responsiveImages),orderColumn,createdAt,updatedAt,url,thumbnail,preview,originalUrl,previewUrl]);

@override
String toString() {
  return 'Media(id: $id, modelType: $modelType, modelId: $modelId, uuid: $uuid, collectionName: $collectionName, name: $name, fileName: $fileName, mimeType: $mimeType, disk: $disk, conversionsDisk: $conversionsDisk, size: $size, manipulations: $manipulations, customProperties: $customProperties, generatedConversions: $generatedConversions, responsiveImages: $responsiveImages, orderColumn: $orderColumn, createdAt: $createdAt, updatedAt: $updatedAt, url: $url, thumbnail: $thumbnail, preview: $preview, originalUrl: $originalUrl, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class _$MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$MediaCopyWith(_Media value, $Res Function(_Media) _then) = __$MediaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "model_type") String modelType,@JsonKey(name: "model_id") int modelId,@JsonKey(name: "uuid") String uuid,@JsonKey(name: "collection_name") String collectionName,@JsonKey(name: "name") String name,@JsonKey(name: "file_name") String fileName,@JsonKey(name: "mime_type") String mimeType,@JsonKey(name: "disk") String disk,@JsonKey(name: "conversions_disk") String conversionsDisk,@JsonKey(name: "size") int size,@JsonKey(name: "manipulations") List<dynamic> manipulations,@JsonKey(name: "custom_properties") List<dynamic> customProperties,@JsonKey(name: "generated_conversions") dynamic generatedConversions,@JsonKey(name: "responsive_images") List<dynamic> responsiveImages,@JsonKey(name: "order_column") int orderColumn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "url") String? url,@JsonKey(name: "thumbnail") String? thumbnail,@JsonKey(name: "preview") String? preview,@JsonKey(name: "original_url") String originalUrl,@JsonKey(name: "preview_url") String previewUrl
});




}
/// @nodoc
class __$MediaCopyWithImpl<$Res>
    implements _$MediaCopyWith<$Res> {
  __$MediaCopyWithImpl(this._self, this._then);

  final _Media _self;
  final $Res Function(_Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? modelType = null,Object? modelId = null,Object? uuid = null,Object? collectionName = null,Object? name = null,Object? fileName = null,Object? mimeType = null,Object? disk = null,Object? conversionsDisk = null,Object? size = null,Object? manipulations = null,Object? customProperties = null,Object? generatedConversions = freezed,Object? responsiveImages = null,Object? orderColumn = null,Object? createdAt = null,Object? updatedAt = null,Object? url = freezed,Object? thumbnail = freezed,Object? preview = freezed,Object? originalUrl = null,Object? previewUrl = null,}) {
  return _then(_Media(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,modelType: null == modelType ? _self.modelType : modelType // ignore: cast_nullable_to_non_nullable
as String,modelId: null == modelId ? _self.modelId : modelId // ignore: cast_nullable_to_non_nullable
as int,uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,collectionName: null == collectionName ? _self.collectionName : collectionName // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,disk: null == disk ? _self.disk : disk // ignore: cast_nullable_to_non_nullable
as String,conversionsDisk: null == conversionsDisk ? _self.conversionsDisk : conversionsDisk // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,manipulations: null == manipulations ? _self._manipulations : manipulations // ignore: cast_nullable_to_non_nullable
as List<dynamic>,customProperties: null == customProperties ? _self._customProperties : customProperties // ignore: cast_nullable_to_non_nullable
as List<dynamic>,generatedConversions: freezed == generatedConversions ? _self.generatedConversions : generatedConversions // ignore: cast_nullable_to_non_nullable
as dynamic,responsiveImages: null == responsiveImages ? _self._responsiveImages : responsiveImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,orderColumn: null == orderColumn ? _self.orderColumn : orderColumn // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,previewUrl: null == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OfficeAddress {

@JsonKey(name: "id") int get id;@JsonKey(name: "address_name") String get addressName;@JsonKey(name: "street_address") String get streetAddress;@JsonKey(name: "phone") String get phone;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "deleted_at") dynamic get deletedAt;
/// Create a copy of OfficeAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficeAddressCopyWith<OfficeAddress> get copyWith => _$OfficeAddressCopyWithImpl<OfficeAddress>(this as OfficeAddress, _$identity);

  /// Serializes this OfficeAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficeAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.addressName, addressName) || other.addressName == addressName)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,addressName,streetAddress,phone,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'OfficeAddress(id: $id, addressName: $addressName, streetAddress: $streetAddress, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $OfficeAddressCopyWith<$Res>  {
  factory $OfficeAddressCopyWith(OfficeAddress value, $Res Function(OfficeAddress) _then) = _$OfficeAddressCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "address_name") String addressName,@JsonKey(name: "street_address") String streetAddress,@JsonKey(name: "phone") String phone,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt
});




}
/// @nodoc
class _$OfficeAddressCopyWithImpl<$Res>
    implements $OfficeAddressCopyWith<$Res> {
  _$OfficeAddressCopyWithImpl(this._self, this._then);

  final OfficeAddress _self;
  final $Res Function(OfficeAddress) _then;

/// Create a copy of OfficeAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? addressName = null,Object? streetAddress = null,Object? phone = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,addressName: null == addressName ? _self.addressName : addressName // ignore: cast_nullable_to_non_nullable
as String,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [OfficeAddress].
extension OfficeAddressPatterns on OfficeAddress {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfficeAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfficeAddress() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfficeAddress value)  $default,){
final _that = this;
switch (_that) {
case _OfficeAddress():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfficeAddress value)?  $default,){
final _that = this;
switch (_that) {
case _OfficeAddress() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "address_name")  String addressName, @JsonKey(name: "street_address")  String streetAddress, @JsonKey(name: "phone")  String phone, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfficeAddress() when $default != null:
return $default(_that.id,_that.addressName,_that.streetAddress,_that.phone,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "address_name")  String addressName, @JsonKey(name: "street_address")  String streetAddress, @JsonKey(name: "phone")  String phone, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt)  $default,) {final _that = this;
switch (_that) {
case _OfficeAddress():
return $default(_that.id,_that.addressName,_that.streetAddress,_that.phone,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "address_name")  String addressName, @JsonKey(name: "street_address")  String streetAddress, @JsonKey(name: "phone")  String phone, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _OfficeAddress() when $default != null:
return $default(_that.id,_that.addressName,_that.streetAddress,_that.phone,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfficeAddress implements OfficeAddress {
  const _OfficeAddress({@JsonKey(name: "id") required this.id, @JsonKey(name: "address_name") required this.addressName, @JsonKey(name: "street_address") required this.streetAddress, @JsonKey(name: "phone") required this.phone, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "deleted_at") required this.deletedAt});
  factory _OfficeAddress.fromJson(Map<String, dynamic> json) => _$OfficeAddressFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "address_name") final  String addressName;
@override@JsonKey(name: "street_address") final  String streetAddress;
@override@JsonKey(name: "phone") final  String phone;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override@JsonKey(name: "deleted_at") final  dynamic deletedAt;

/// Create a copy of OfficeAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfficeAddressCopyWith<_OfficeAddress> get copyWith => __$OfficeAddressCopyWithImpl<_OfficeAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfficeAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfficeAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.addressName, addressName) || other.addressName == addressName)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,addressName,streetAddress,phone,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt));

@override
String toString() {
  return 'OfficeAddress(id: $id, addressName: $addressName, streetAddress: $streetAddress, phone: $phone, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$OfficeAddressCopyWith<$Res> implements $OfficeAddressCopyWith<$Res> {
  factory _$OfficeAddressCopyWith(_OfficeAddress value, $Res Function(_OfficeAddress) _then) = __$OfficeAddressCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "address_name") String addressName,@JsonKey(name: "street_address") String streetAddress,@JsonKey(name: "phone") String phone,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt
});




}
/// @nodoc
class __$OfficeAddressCopyWithImpl<$Res>
    implements _$OfficeAddressCopyWith<$Res> {
  __$OfficeAddressCopyWithImpl(this._self, this._then);

  final _OfficeAddress _self;
  final $Res Function(_OfficeAddress) _then;

/// Create a copy of OfficeAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? addressName = null,Object? streetAddress = null,Object? phone = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,}) {
  return _then(_OfficeAddress(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,addressName: null == addressName ? _self.addressName : addressName // ignore: cast_nullable_to_non_nullable
as String,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
