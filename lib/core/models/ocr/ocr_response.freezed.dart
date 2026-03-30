// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocr_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OcrResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") Data? get data;
/// Create a copy of OcrResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OcrResponseCopyWith<OcrResponse> get copyWith => _$OcrResponseCopyWithImpl<OcrResponse>(this as OcrResponse, _$identity);

  /// Serializes this OcrResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OcrResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'OcrResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $OcrResponseCopyWith<$Res>  {
  factory $OcrResponseCopyWith(OcrResponse value, $Res Function(OcrResponse) _then) = _$OcrResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") Data? data
});


$DataCopyWith<$Res>? get data;

}
/// @nodoc
class _$OcrResponseCopyWithImpl<$Res>
    implements $OcrResponseCopyWith<$Res> {
  _$OcrResponseCopyWithImpl(this._self, this._then);

  final OcrResponse _self;
  final $Res Function(OcrResponse) _then;

/// Create a copy of OcrResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data?,
  ));
}
/// Create a copy of OcrResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [OcrResponse].
extension OcrResponsePatterns on OcrResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OcrResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OcrResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OcrResponse value)  $default,){
final _that = this;
switch (_that) {
case _OcrResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OcrResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OcrResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  Data? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OcrResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  Data? data)  $default,) {final _that = this;
switch (_that) {
case _OcrResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  Data? data)?  $default,) {final _that = this;
switch (_that) {
case _OcrResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OcrResponse implements OcrResponse {
  const _OcrResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _OcrResponse.fromJson(Map<String, dynamic> json) => _$OcrResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  Data? data;

/// Create a copy of OcrResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OcrResponseCopyWith<_OcrResponse> get copyWith => __$OcrResponseCopyWithImpl<_OcrResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OcrResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OcrResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'OcrResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$OcrResponseCopyWith<$Res> implements $OcrResponseCopyWith<$Res> {
  factory _$OcrResponseCopyWith(_OcrResponse value, $Res Function(_OcrResponse) _then) = __$OcrResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") Data? data
});


@override $DataCopyWith<$Res>? get data;

}
/// @nodoc
class __$OcrResponseCopyWithImpl<$Res>
    implements _$OcrResponseCopyWith<$Res> {
  __$OcrResponseCopyWithImpl(this._self, this._then);

  final _OcrResponse _self;
  final $Res Function(_OcrResponse) _then;

/// Create a copy of OcrResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_OcrResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as Data?,
  ));
}

/// Create a copy of OcrResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $DataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$Data {

@JsonKey(name: "company_name") String? get companyName;@JsonKey(name: "name_surname") List<String>? get nameSurname;@JsonKey(name: "unvan") List<dynamic>? get unvan;@JsonKey(name: "email_list") List<String>? get emailList;@JsonKey(name: "phone_list") PhoneList? get phoneList;@JsonKey(name: "sector") String? get sector;@JsonKey(name: "website") String? get website;@JsonKey(name: "address") String? get address;@JsonKey(name: "phone") String? get phone;@JsonKey(name: "email") String? get email;@JsonKey(name: "country") String? get country;@JsonKey(name: "note") String? get note;@JsonKey(name: "country_id") int? get countryId;
/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DataCopyWith<Data> get copyWith => _$DataCopyWithImpl<Data>(this as Data, _$identity);

  /// Serializes this Data to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Data&&(identical(other.companyName, companyName) || other.companyName == companyName)&&const DeepCollectionEquality().equals(other.nameSurname, nameSurname)&&const DeepCollectionEquality().equals(other.unvan, unvan)&&const DeepCollectionEquality().equals(other.emailList, emailList)&&(identical(other.phoneList, phoneList) || other.phoneList == phoneList)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.country, country) || other.country == country)&&(identical(other.note, note) || other.note == note)&&(identical(other.countryId, countryId) || other.countryId == countryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,const DeepCollectionEquality().hash(nameSurname),const DeepCollectionEquality().hash(unvan),const DeepCollectionEquality().hash(emailList),phoneList,sector,website,address,phone,email,country,note,countryId);

@override
String toString() {
  return 'Data(companyName: $companyName, nameSurname: $nameSurname, unvan: $unvan, emailList: $emailList, phoneList: $phoneList, sector: $sector, website: $website, address: $address, phone: $phone, email: $email, country: $country, note: $note, countryId: $countryId)';
}


}

/// @nodoc
abstract mixin class $DataCopyWith<$Res>  {
  factory $DataCopyWith(Data value, $Res Function(Data) _then) = _$DataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "company_name") String? companyName,@JsonKey(name: "name_surname") List<String>? nameSurname,@JsonKey(name: "unvan") List<dynamic>? unvan,@JsonKey(name: "email_list") List<String>? emailList,@JsonKey(name: "phone_list") PhoneList? phoneList,@JsonKey(name: "sector") String? sector,@JsonKey(name: "website") String? website,@JsonKey(name: "address") String? address,@JsonKey(name: "phone") String? phone,@JsonKey(name: "email") String? email,@JsonKey(name: "country") String? country,@JsonKey(name: "note") String? note,@JsonKey(name: "country_id") int? countryId
});


$PhoneListCopyWith<$Res>? get phoneList;

}
/// @nodoc
class _$DataCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._self, this._then);

  final Data _self;
  final $Res Function(Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyName = freezed,Object? nameSurname = freezed,Object? unvan = freezed,Object? emailList = freezed,Object? phoneList = freezed,Object? sector = freezed,Object? website = freezed,Object? address = freezed,Object? phone = freezed,Object? email = freezed,Object? country = freezed,Object? note = freezed,Object? countryId = freezed,}) {
  return _then(_self.copyWith(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,nameSurname: freezed == nameSurname ? _self.nameSurname : nameSurname // ignore: cast_nullable_to_non_nullable
as List<String>?,unvan: freezed == unvan ? _self.unvan : unvan // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,emailList: freezed == emailList ? _self.emailList : emailList // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneList: freezed == phoneList ? _self.phoneList : phoneList // ignore: cast_nullable_to_non_nullable
as PhoneList?,sector: freezed == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhoneListCopyWith<$Res>? get phoneList {
    if (_self.phoneList == null) {
    return null;
  }

  return $PhoneListCopyWith<$Res>(_self.phoneList!, (value) {
    return _then(_self.copyWith(phoneList: value));
  });
}
}


/// Adds pattern-matching-related methods to [Data].
extension DataPatterns on Data {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Data value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Data() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Data value)  $default,){
final _that = this;
switch (_that) {
case _Data():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Data value)?  $default,){
final _that = this;
switch (_that) {
case _Data() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "name_surname")  List<String>? nameSurname, @JsonKey(name: "unvan")  List<dynamic>? unvan, @JsonKey(name: "email_list")  List<String>? emailList, @JsonKey(name: "phone_list")  PhoneList? phoneList, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "website")  String? website, @JsonKey(name: "address")  String? address, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "email")  String? email, @JsonKey(name: "country")  String? country, @JsonKey(name: "note")  String? note, @JsonKey(name: "country_id")  int? countryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Data() when $default != null:
return $default(_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.sector,_that.website,_that.address,_that.phone,_that.email,_that.country,_that.note,_that.countryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "name_surname")  List<String>? nameSurname, @JsonKey(name: "unvan")  List<dynamic>? unvan, @JsonKey(name: "email_list")  List<String>? emailList, @JsonKey(name: "phone_list")  PhoneList? phoneList, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "website")  String? website, @JsonKey(name: "address")  String? address, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "email")  String? email, @JsonKey(name: "country")  String? country, @JsonKey(name: "note")  String? note, @JsonKey(name: "country_id")  int? countryId)  $default,) {final _that = this;
switch (_that) {
case _Data():
return $default(_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.sector,_that.website,_that.address,_that.phone,_that.email,_that.country,_that.note,_that.countryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "name_surname")  List<String>? nameSurname, @JsonKey(name: "unvan")  List<dynamic>? unvan, @JsonKey(name: "email_list")  List<String>? emailList, @JsonKey(name: "phone_list")  PhoneList? phoneList, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "website")  String? website, @JsonKey(name: "address")  String? address, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "email")  String? email, @JsonKey(name: "country")  String? country, @JsonKey(name: "note")  String? note, @JsonKey(name: "country_id")  int? countryId)?  $default,) {final _that = this;
switch (_that) {
case _Data() when $default != null:
return $default(_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.sector,_that.website,_that.address,_that.phone,_that.email,_that.country,_that.note,_that.countryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Data implements Data {
  const _Data({@JsonKey(name: "company_name") this.companyName, @JsonKey(name: "name_surname") final  List<String>? nameSurname, @JsonKey(name: "unvan") final  List<dynamic>? unvan, @JsonKey(name: "email_list") final  List<String>? emailList, @JsonKey(name: "phone_list") this.phoneList, @JsonKey(name: "sector") this.sector, @JsonKey(name: "website") this.website, @JsonKey(name: "address") this.address, @JsonKey(name: "phone") this.phone, @JsonKey(name: "email") this.email, @JsonKey(name: "country") this.country, @JsonKey(name: "note") this.note, @JsonKey(name: "country_id") this.countryId}): _nameSurname = nameSurname,_unvan = unvan,_emailList = emailList;
  factory _Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

@override@JsonKey(name: "company_name") final  String? companyName;
 final  List<String>? _nameSurname;
@override@JsonKey(name: "name_surname") List<String>? get nameSurname {
  final value = _nameSurname;
  if (value == null) return null;
  if (_nameSurname is EqualUnmodifiableListView) return _nameSurname;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _unvan;
@override@JsonKey(name: "unvan") List<dynamic>? get unvan {
  final value = _unvan;
  if (value == null) return null;
  if (_unvan is EqualUnmodifiableListView) return _unvan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _emailList;
@override@JsonKey(name: "email_list") List<String>? get emailList {
  final value = _emailList;
  if (value == null) return null;
  if (_emailList is EqualUnmodifiableListView) return _emailList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "phone_list") final  PhoneList? phoneList;
@override@JsonKey(name: "sector") final  String? sector;
@override@JsonKey(name: "website") final  String? website;
@override@JsonKey(name: "address") final  String? address;
@override@JsonKey(name: "phone") final  String? phone;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "country") final  String? country;
@override@JsonKey(name: "note") final  String? note;
@override@JsonKey(name: "country_id") final  int? countryId;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DataCopyWith<_Data> get copyWith => __$DataCopyWithImpl<_Data>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Data&&(identical(other.companyName, companyName) || other.companyName == companyName)&&const DeepCollectionEquality().equals(other._nameSurname, _nameSurname)&&const DeepCollectionEquality().equals(other._unvan, _unvan)&&const DeepCollectionEquality().equals(other._emailList, _emailList)&&(identical(other.phoneList, phoneList) || other.phoneList == phoneList)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.country, country) || other.country == country)&&(identical(other.note, note) || other.note == note)&&(identical(other.countryId, countryId) || other.countryId == countryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,const DeepCollectionEquality().hash(_nameSurname),const DeepCollectionEquality().hash(_unvan),const DeepCollectionEquality().hash(_emailList),phoneList,sector,website,address,phone,email,country,note,countryId);

@override
String toString() {
  return 'Data(companyName: $companyName, nameSurname: $nameSurname, unvan: $unvan, emailList: $emailList, phoneList: $phoneList, sector: $sector, website: $website, address: $address, phone: $phone, email: $email, country: $country, note: $note, countryId: $countryId)';
}


}

/// @nodoc
abstract mixin class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) _then) = __$DataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "company_name") String? companyName,@JsonKey(name: "name_surname") List<String>? nameSurname,@JsonKey(name: "unvan") List<dynamic>? unvan,@JsonKey(name: "email_list") List<String>? emailList,@JsonKey(name: "phone_list") PhoneList? phoneList,@JsonKey(name: "sector") String? sector,@JsonKey(name: "website") String? website,@JsonKey(name: "address") String? address,@JsonKey(name: "phone") String? phone,@JsonKey(name: "email") String? email,@JsonKey(name: "country") String? country,@JsonKey(name: "note") String? note,@JsonKey(name: "country_id") int? countryId
});


@override $PhoneListCopyWith<$Res>? get phoneList;

}
/// @nodoc
class __$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(this._self, this._then);

  final _Data _self;
  final $Res Function(_Data) _then;

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = freezed,Object? nameSurname = freezed,Object? unvan = freezed,Object? emailList = freezed,Object? phoneList = freezed,Object? sector = freezed,Object? website = freezed,Object? address = freezed,Object? phone = freezed,Object? email = freezed,Object? country = freezed,Object? note = freezed,Object? countryId = freezed,}) {
  return _then(_Data(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,nameSurname: freezed == nameSurname ? _self._nameSurname : nameSurname // ignore: cast_nullable_to_non_nullable
as List<String>?,unvan: freezed == unvan ? _self._unvan : unvan // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,emailList: freezed == emailList ? _self._emailList : emailList // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneList: freezed == phoneList ? _self.phoneList : phoneList // ignore: cast_nullable_to_non_nullable
as PhoneList?,sector: freezed == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of Data
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhoneListCopyWith<$Res>? get phoneList {
    if (_self.phoneList == null) {
    return null;
  }

  return $PhoneListCopyWith<$Res>(_self.phoneList!, (value) {
    return _then(_self.copyWith(phoneList: value));
  });
}
}


/// @nodoc
mixin _$PhoneList {

@JsonKey(name: "landline") String? get landline;@JsonKey(name: "mobile") String? get mobile;
/// Create a copy of PhoneList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhoneListCopyWith<PhoneList> get copyWith => _$PhoneListCopyWithImpl<PhoneList>(this as PhoneList, _$identity);

  /// Serializes this PhoneList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PhoneList&&(identical(other.landline, landline) || other.landline == landline)&&(identical(other.mobile, mobile) || other.mobile == mobile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,landline,mobile);

@override
String toString() {
  return 'PhoneList(landline: $landline, mobile: $mobile)';
}


}

/// @nodoc
abstract mixin class $PhoneListCopyWith<$Res>  {
  factory $PhoneListCopyWith(PhoneList value, $Res Function(PhoneList) _then) = _$PhoneListCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "landline") String? landline,@JsonKey(name: "mobile") String? mobile
});




}
/// @nodoc
class _$PhoneListCopyWithImpl<$Res>
    implements $PhoneListCopyWith<$Res> {
  _$PhoneListCopyWithImpl(this._self, this._then);

  final PhoneList _self;
  final $Res Function(PhoneList) _then;

/// Create a copy of PhoneList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? landline = freezed,Object? mobile = freezed,}) {
  return _then(_self.copyWith(
landline: freezed == landline ? _self.landline : landline // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PhoneList].
extension PhoneListPatterns on PhoneList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PhoneList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PhoneList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PhoneList value)  $default,){
final _that = this;
switch (_that) {
case _PhoneList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PhoneList value)?  $default,){
final _that = this;
switch (_that) {
case _PhoneList() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "landline")  String? landline, @JsonKey(name: "mobile")  String? mobile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PhoneList() when $default != null:
return $default(_that.landline,_that.mobile);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "landline")  String? landline, @JsonKey(name: "mobile")  String? mobile)  $default,) {final _that = this;
switch (_that) {
case _PhoneList():
return $default(_that.landline,_that.mobile);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "landline")  String? landline, @JsonKey(name: "mobile")  String? mobile)?  $default,) {final _that = this;
switch (_that) {
case _PhoneList() when $default != null:
return $default(_that.landline,_that.mobile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PhoneList implements PhoneList {
  const _PhoneList({@JsonKey(name: "landline") this.landline, @JsonKey(name: "mobile") this.mobile});
  factory _PhoneList.fromJson(Map<String, dynamic> json) => _$PhoneListFromJson(json);

@override@JsonKey(name: "landline") final  String? landline;
@override@JsonKey(name: "mobile") final  String? mobile;

/// Create a copy of PhoneList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhoneListCopyWith<_PhoneList> get copyWith => __$PhoneListCopyWithImpl<_PhoneList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhoneListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PhoneList&&(identical(other.landline, landline) || other.landline == landline)&&(identical(other.mobile, mobile) || other.mobile == mobile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,landline,mobile);

@override
String toString() {
  return 'PhoneList(landline: $landline, mobile: $mobile)';
}


}

/// @nodoc
abstract mixin class _$PhoneListCopyWith<$Res> implements $PhoneListCopyWith<$Res> {
  factory _$PhoneListCopyWith(_PhoneList value, $Res Function(_PhoneList) _then) = __$PhoneListCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "landline") String? landline,@JsonKey(name: "mobile") String? mobile
});




}
/// @nodoc
class __$PhoneListCopyWithImpl<$Res>
    implements _$PhoneListCopyWith<$Res> {
  __$PhoneListCopyWithImpl(this._self, this._then);

  final _PhoneList _self;
  final $Res Function(_PhoneList) _then;

/// Create a copy of PhoneList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? landline = freezed,Object? mobile = freezed,}) {
  return _then(_PhoneList(
landline: freezed == landline ? _self.landline : landline // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
