// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'business_card_scan_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessCardScanResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") BusinessCardScanResult? get data;
/// Create a copy of BusinessCardScanResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCardScanResponseCopyWith<BusinessCardScanResponse> get copyWith => _$BusinessCardScanResponseCopyWithImpl<BusinessCardScanResponse>(this as BusinessCardScanResponse, _$identity);

  /// Serializes this BusinessCardScanResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCardScanResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'BusinessCardScanResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $BusinessCardScanResponseCopyWith<$Res>  {
  factory $BusinessCardScanResponseCopyWith(BusinessCardScanResponse value, $Res Function(BusinessCardScanResponse) _then) = _$BusinessCardScanResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") BusinessCardScanResult? data
});


$BusinessCardScanResultCopyWith<$Res>? get data;

}
/// @nodoc
class _$BusinessCardScanResponseCopyWithImpl<$Res>
    implements $BusinessCardScanResponseCopyWith<$Res> {
  _$BusinessCardScanResponseCopyWithImpl(this._self, this._then);

  final BusinessCardScanResponse _self;
  final $Res Function(BusinessCardScanResponse) _then;

/// Create a copy of BusinessCardScanResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BusinessCardScanResult?,
  ));
}
/// Create a copy of BusinessCardScanResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessCardScanResultCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BusinessCardScanResultCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [BusinessCardScanResponse].
extension BusinessCardScanResponsePatterns on BusinessCardScanResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessCardScanResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessCardScanResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessCardScanResponse value)  $default,){
final _that = this;
switch (_that) {
case _BusinessCardScanResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessCardScanResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessCardScanResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  BusinessCardScanResult? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessCardScanResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  BusinessCardScanResult? data)  $default,) {final _that = this;
switch (_that) {
case _BusinessCardScanResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  BusinessCardScanResult? data)?  $default,) {final _that = this;
switch (_that) {
case _BusinessCardScanResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessCardScanResponse implements BusinessCardScanResponse {
  const _BusinessCardScanResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _BusinessCardScanResponse.fromJson(Map<String, dynamic> json) => _$BusinessCardScanResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  BusinessCardScanResult? data;

/// Create a copy of BusinessCardScanResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCardScanResponseCopyWith<_BusinessCardScanResponse> get copyWith => __$BusinessCardScanResponseCopyWithImpl<_BusinessCardScanResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCardScanResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCardScanResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'BusinessCardScanResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BusinessCardScanResponseCopyWith<$Res> implements $BusinessCardScanResponseCopyWith<$Res> {
  factory _$BusinessCardScanResponseCopyWith(_BusinessCardScanResponse value, $Res Function(_BusinessCardScanResponse) _then) = __$BusinessCardScanResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") BusinessCardScanResult? data
});


@override $BusinessCardScanResultCopyWith<$Res>? get data;

}
/// @nodoc
class __$BusinessCardScanResponseCopyWithImpl<$Res>
    implements _$BusinessCardScanResponseCopyWith<$Res> {
  __$BusinessCardScanResponseCopyWithImpl(this._self, this._then);

  final _BusinessCardScanResponse _self;
  final $Res Function(_BusinessCardScanResponse) _then;

/// Create a copy of BusinessCardScanResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_BusinessCardScanResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BusinessCardScanResult?,
  ));
}

/// Create a copy of BusinessCardScanResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessCardScanResultCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BusinessCardScanResultCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$BusinessCardScanResult {

@JsonKey(name: "engine") String? get engine;@JsonKey(name: "data") BusinessCardScanData? get data;@JsonKey(name: "image") String? get image;
/// Create a copy of BusinessCardScanResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCardScanResultCopyWith<BusinessCardScanResult> get copyWith => _$BusinessCardScanResultCopyWithImpl<BusinessCardScanResult>(this as BusinessCardScanResult, _$identity);

  /// Serializes this BusinessCardScanResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCardScanResult&&(identical(other.engine, engine) || other.engine == engine)&&(identical(other.data, data) || other.data == data)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,engine,data,image);

@override
String toString() {
  return 'BusinessCardScanResult(engine: $engine, data: $data, image: $image)';
}


}

/// @nodoc
abstract mixin class $BusinessCardScanResultCopyWith<$Res>  {
  factory $BusinessCardScanResultCopyWith(BusinessCardScanResult value, $Res Function(BusinessCardScanResult) _then) = _$BusinessCardScanResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "engine") String? engine,@JsonKey(name: "data") BusinessCardScanData? data,@JsonKey(name: "image") String? image
});


$BusinessCardScanDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$BusinessCardScanResultCopyWithImpl<$Res>
    implements $BusinessCardScanResultCopyWith<$Res> {
  _$BusinessCardScanResultCopyWithImpl(this._self, this._then);

  final BusinessCardScanResult _self;
  final $Res Function(BusinessCardScanResult) _then;

/// Create a copy of BusinessCardScanResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? engine = freezed,Object? data = freezed,Object? image = freezed,}) {
  return _then(_self.copyWith(
engine: freezed == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BusinessCardScanData?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BusinessCardScanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessCardScanDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BusinessCardScanDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [BusinessCardScanResult].
extension BusinessCardScanResultPatterns on BusinessCardScanResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessCardScanResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessCardScanResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessCardScanResult value)  $default,){
final _that = this;
switch (_that) {
case _BusinessCardScanResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessCardScanResult value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessCardScanResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "engine")  String? engine, @JsonKey(name: "data")  BusinessCardScanData? data, @JsonKey(name: "image")  String? image)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessCardScanResult() when $default != null:
return $default(_that.engine,_that.data,_that.image);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "engine")  String? engine, @JsonKey(name: "data")  BusinessCardScanData? data, @JsonKey(name: "image")  String? image)  $default,) {final _that = this;
switch (_that) {
case _BusinessCardScanResult():
return $default(_that.engine,_that.data,_that.image);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "engine")  String? engine, @JsonKey(name: "data")  BusinessCardScanData? data, @JsonKey(name: "image")  String? image)?  $default,) {final _that = this;
switch (_that) {
case _BusinessCardScanResult() when $default != null:
return $default(_that.engine,_that.data,_that.image);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessCardScanResult implements BusinessCardScanResult {
  const _BusinessCardScanResult({@JsonKey(name: "engine") this.engine, @JsonKey(name: "data") this.data, @JsonKey(name: "image") this.image});
  factory _BusinessCardScanResult.fromJson(Map<String, dynamic> json) => _$BusinessCardScanResultFromJson(json);

@override@JsonKey(name: "engine") final  String? engine;
@override@JsonKey(name: "data") final  BusinessCardScanData? data;
@override@JsonKey(name: "image") final  String? image;

/// Create a copy of BusinessCardScanResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCardScanResultCopyWith<_BusinessCardScanResult> get copyWith => __$BusinessCardScanResultCopyWithImpl<_BusinessCardScanResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCardScanResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCardScanResult&&(identical(other.engine, engine) || other.engine == engine)&&(identical(other.data, data) || other.data == data)&&(identical(other.image, image) || other.image == image));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,engine,data,image);

@override
String toString() {
  return 'BusinessCardScanResult(engine: $engine, data: $data, image: $image)';
}


}

/// @nodoc
abstract mixin class _$BusinessCardScanResultCopyWith<$Res> implements $BusinessCardScanResultCopyWith<$Res> {
  factory _$BusinessCardScanResultCopyWith(_BusinessCardScanResult value, $Res Function(_BusinessCardScanResult) _then) = __$BusinessCardScanResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "engine") String? engine,@JsonKey(name: "data") BusinessCardScanData? data,@JsonKey(name: "image") String? image
});


@override $BusinessCardScanDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$BusinessCardScanResultCopyWithImpl<$Res>
    implements _$BusinessCardScanResultCopyWith<$Res> {
  __$BusinessCardScanResultCopyWithImpl(this._self, this._then);

  final _BusinessCardScanResult _self;
  final $Res Function(_BusinessCardScanResult) _then;

/// Create a copy of BusinessCardScanResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? engine = freezed,Object? data = freezed,Object? image = freezed,}) {
  return _then(_BusinessCardScanResult(
engine: freezed == engine ? _self.engine : engine // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BusinessCardScanData?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BusinessCardScanResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessCardScanDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BusinessCardScanDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$BusinessCardScanData {

@JsonKey(name: "company_name") String? get companyName;@JsonKey(name: "name_surname") List<String>? get nameSurname;@JsonKey(name: "unvan") List<String>? get unvan;@JsonKey(name: "email_list") List<String>? get emailList;@JsonKey(name: "phone_list") ScanPhoneList? get phoneList;@JsonKey(name: "sector") String? get sector;@JsonKey(name: "website") String? get website;@JsonKey(name: "address") String? get address;@JsonKey(name: "phone") String? get phone;@JsonKey(name: "email") String? get email;@JsonKey(name: "country") String? get country;@JsonKey(name: "country_id") int? get countryId;@JsonKey(name: "note") String? get note;
/// Create a copy of BusinessCardScanData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCardScanDataCopyWith<BusinessCardScanData> get copyWith => _$BusinessCardScanDataCopyWithImpl<BusinessCardScanData>(this as BusinessCardScanData, _$identity);

  /// Serializes this BusinessCardScanData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCardScanData&&(identical(other.companyName, companyName) || other.companyName == companyName)&&const DeepCollectionEquality().equals(other.nameSurname, nameSurname)&&const DeepCollectionEquality().equals(other.unvan, unvan)&&const DeepCollectionEquality().equals(other.emailList, emailList)&&(identical(other.phoneList, phoneList) || other.phoneList == phoneList)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.country, country) || other.country == country)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,const DeepCollectionEquality().hash(nameSurname),const DeepCollectionEquality().hash(unvan),const DeepCollectionEquality().hash(emailList),phoneList,sector,website,address,phone,email,country,countryId,note);

@override
String toString() {
  return 'BusinessCardScanData(companyName: $companyName, nameSurname: $nameSurname, unvan: $unvan, emailList: $emailList, phoneList: $phoneList, sector: $sector, website: $website, address: $address, phone: $phone, email: $email, country: $country, countryId: $countryId, note: $note)';
}


}

/// @nodoc
abstract mixin class $BusinessCardScanDataCopyWith<$Res>  {
  factory $BusinessCardScanDataCopyWith(BusinessCardScanData value, $Res Function(BusinessCardScanData) _then) = _$BusinessCardScanDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "company_name") String? companyName,@JsonKey(name: "name_surname") List<String>? nameSurname,@JsonKey(name: "unvan") List<String>? unvan,@JsonKey(name: "email_list") List<String>? emailList,@JsonKey(name: "phone_list") ScanPhoneList? phoneList,@JsonKey(name: "sector") String? sector,@JsonKey(name: "website") String? website,@JsonKey(name: "address") String? address,@JsonKey(name: "phone") String? phone,@JsonKey(name: "email") String? email,@JsonKey(name: "country") String? country,@JsonKey(name: "country_id") int? countryId,@JsonKey(name: "note") String? note
});


$ScanPhoneListCopyWith<$Res>? get phoneList;

}
/// @nodoc
class _$BusinessCardScanDataCopyWithImpl<$Res>
    implements $BusinessCardScanDataCopyWith<$Res> {
  _$BusinessCardScanDataCopyWithImpl(this._self, this._then);

  final BusinessCardScanData _self;
  final $Res Function(BusinessCardScanData) _then;

/// Create a copy of BusinessCardScanData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? companyName = freezed,Object? nameSurname = freezed,Object? unvan = freezed,Object? emailList = freezed,Object? phoneList = freezed,Object? sector = freezed,Object? website = freezed,Object? address = freezed,Object? phone = freezed,Object? email = freezed,Object? country = freezed,Object? countryId = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,nameSurname: freezed == nameSurname ? _self.nameSurname : nameSurname // ignore: cast_nullable_to_non_nullable
as List<String>?,unvan: freezed == unvan ? _self.unvan : unvan // ignore: cast_nullable_to_non_nullable
as List<String>?,emailList: freezed == emailList ? _self.emailList : emailList // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneList: freezed == phoneList ? _self.phoneList : phoneList // ignore: cast_nullable_to_non_nullable
as ScanPhoneList?,sector: freezed == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BusinessCardScanData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScanPhoneListCopyWith<$Res>? get phoneList {
    if (_self.phoneList == null) {
    return null;
  }

  return $ScanPhoneListCopyWith<$Res>(_self.phoneList!, (value) {
    return _then(_self.copyWith(phoneList: value));
  });
}
}


/// Adds pattern-matching-related methods to [BusinessCardScanData].
extension BusinessCardScanDataPatterns on BusinessCardScanData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessCardScanData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessCardScanData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessCardScanData value)  $default,){
final _that = this;
switch (_that) {
case _BusinessCardScanData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessCardScanData value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessCardScanData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "name_surname")  List<String>? nameSurname, @JsonKey(name: "unvan")  List<String>? unvan, @JsonKey(name: "email_list")  List<String>? emailList, @JsonKey(name: "phone_list")  ScanPhoneList? phoneList, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "website")  String? website, @JsonKey(name: "address")  String? address, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "email")  String? email, @JsonKey(name: "country")  String? country, @JsonKey(name: "country_id")  int? countryId, @JsonKey(name: "note")  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessCardScanData() when $default != null:
return $default(_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.sector,_that.website,_that.address,_that.phone,_that.email,_that.country,_that.countryId,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "name_surname")  List<String>? nameSurname, @JsonKey(name: "unvan")  List<String>? unvan, @JsonKey(name: "email_list")  List<String>? emailList, @JsonKey(name: "phone_list")  ScanPhoneList? phoneList, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "website")  String? website, @JsonKey(name: "address")  String? address, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "email")  String? email, @JsonKey(name: "country")  String? country, @JsonKey(name: "country_id")  int? countryId, @JsonKey(name: "note")  String? note)  $default,) {final _that = this;
switch (_that) {
case _BusinessCardScanData():
return $default(_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.sector,_that.website,_that.address,_that.phone,_that.email,_that.country,_that.countryId,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "name_surname")  List<String>? nameSurname, @JsonKey(name: "unvan")  List<String>? unvan, @JsonKey(name: "email_list")  List<String>? emailList, @JsonKey(name: "phone_list")  ScanPhoneList? phoneList, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "website")  String? website, @JsonKey(name: "address")  String? address, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "email")  String? email, @JsonKey(name: "country")  String? country, @JsonKey(name: "country_id")  int? countryId, @JsonKey(name: "note")  String? note)?  $default,) {final _that = this;
switch (_that) {
case _BusinessCardScanData() when $default != null:
return $default(_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.sector,_that.website,_that.address,_that.phone,_that.email,_that.country,_that.countryId,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessCardScanData implements BusinessCardScanData {
  const _BusinessCardScanData({@JsonKey(name: "company_name") this.companyName, @JsonKey(name: "name_surname") final  List<String>? nameSurname, @JsonKey(name: "unvan") final  List<String>? unvan, @JsonKey(name: "email_list") final  List<String>? emailList, @JsonKey(name: "phone_list") this.phoneList, @JsonKey(name: "sector") this.sector, @JsonKey(name: "website") this.website, @JsonKey(name: "address") this.address, @JsonKey(name: "phone") this.phone, @JsonKey(name: "email") this.email, @JsonKey(name: "country") this.country, @JsonKey(name: "country_id") this.countryId, @JsonKey(name: "note") this.note}): _nameSurname = nameSurname,_unvan = unvan,_emailList = emailList;
  factory _BusinessCardScanData.fromJson(Map<String, dynamic> json) => _$BusinessCardScanDataFromJson(json);

@override@JsonKey(name: "company_name") final  String? companyName;
 final  List<String>? _nameSurname;
@override@JsonKey(name: "name_surname") List<String>? get nameSurname {
  final value = _nameSurname;
  if (value == null) return null;
  if (_nameSurname is EqualUnmodifiableListView) return _nameSurname;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _unvan;
@override@JsonKey(name: "unvan") List<String>? get unvan {
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

@override@JsonKey(name: "phone_list") final  ScanPhoneList? phoneList;
@override@JsonKey(name: "sector") final  String? sector;
@override@JsonKey(name: "website") final  String? website;
@override@JsonKey(name: "address") final  String? address;
@override@JsonKey(name: "phone") final  String? phone;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "country") final  String? country;
@override@JsonKey(name: "country_id") final  int? countryId;
@override@JsonKey(name: "note") final  String? note;

/// Create a copy of BusinessCardScanData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCardScanDataCopyWith<_BusinessCardScanData> get copyWith => __$BusinessCardScanDataCopyWithImpl<_BusinessCardScanData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCardScanDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCardScanData&&(identical(other.companyName, companyName) || other.companyName == companyName)&&const DeepCollectionEquality().equals(other._nameSurname, _nameSurname)&&const DeepCollectionEquality().equals(other._unvan, _unvan)&&const DeepCollectionEquality().equals(other._emailList, _emailList)&&(identical(other.phoneList, phoneList) || other.phoneList == phoneList)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.country, country) || other.country == country)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,companyName,const DeepCollectionEquality().hash(_nameSurname),const DeepCollectionEquality().hash(_unvan),const DeepCollectionEquality().hash(_emailList),phoneList,sector,website,address,phone,email,country,countryId,note);

@override
String toString() {
  return 'BusinessCardScanData(companyName: $companyName, nameSurname: $nameSurname, unvan: $unvan, emailList: $emailList, phoneList: $phoneList, sector: $sector, website: $website, address: $address, phone: $phone, email: $email, country: $country, countryId: $countryId, note: $note)';
}


}

/// @nodoc
abstract mixin class _$BusinessCardScanDataCopyWith<$Res> implements $BusinessCardScanDataCopyWith<$Res> {
  factory _$BusinessCardScanDataCopyWith(_BusinessCardScanData value, $Res Function(_BusinessCardScanData) _then) = __$BusinessCardScanDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "company_name") String? companyName,@JsonKey(name: "name_surname") List<String>? nameSurname,@JsonKey(name: "unvan") List<String>? unvan,@JsonKey(name: "email_list") List<String>? emailList,@JsonKey(name: "phone_list") ScanPhoneList? phoneList,@JsonKey(name: "sector") String? sector,@JsonKey(name: "website") String? website,@JsonKey(name: "address") String? address,@JsonKey(name: "phone") String? phone,@JsonKey(name: "email") String? email,@JsonKey(name: "country") String? country,@JsonKey(name: "country_id") int? countryId,@JsonKey(name: "note") String? note
});


@override $ScanPhoneListCopyWith<$Res>? get phoneList;

}
/// @nodoc
class __$BusinessCardScanDataCopyWithImpl<$Res>
    implements _$BusinessCardScanDataCopyWith<$Res> {
  __$BusinessCardScanDataCopyWithImpl(this._self, this._then);

  final _BusinessCardScanData _self;
  final $Res Function(_BusinessCardScanData) _then;

/// Create a copy of BusinessCardScanData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? companyName = freezed,Object? nameSurname = freezed,Object? unvan = freezed,Object? emailList = freezed,Object? phoneList = freezed,Object? sector = freezed,Object? website = freezed,Object? address = freezed,Object? phone = freezed,Object? email = freezed,Object? country = freezed,Object? countryId = freezed,Object? note = freezed,}) {
  return _then(_BusinessCardScanData(
companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,nameSurname: freezed == nameSurname ? _self._nameSurname : nameSurname // ignore: cast_nullable_to_non_nullable
as List<String>?,unvan: freezed == unvan ? _self._unvan : unvan // ignore: cast_nullable_to_non_nullable
as List<String>?,emailList: freezed == emailList ? _self._emailList : emailList // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneList: freezed == phoneList ? _self.phoneList : phoneList // ignore: cast_nullable_to_non_nullable
as ScanPhoneList?,sector: freezed == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BusinessCardScanData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ScanPhoneListCopyWith<$Res>? get phoneList {
    if (_self.phoneList == null) {
    return null;
  }

  return $ScanPhoneListCopyWith<$Res>(_self.phoneList!, (value) {
    return _then(_self.copyWith(phoneList: value));
  });
}
}


/// @nodoc
mixin _$ScanPhoneList {

@JsonKey(name: "landline") String? get landline;@JsonKey(name: "mobile") String? get mobile;
/// Create a copy of ScanPhoneList
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScanPhoneListCopyWith<ScanPhoneList> get copyWith => _$ScanPhoneListCopyWithImpl<ScanPhoneList>(this as ScanPhoneList, _$identity);

  /// Serializes this ScanPhoneList to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScanPhoneList&&(identical(other.landline, landline) || other.landline == landline)&&(identical(other.mobile, mobile) || other.mobile == mobile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,landline,mobile);

@override
String toString() {
  return 'ScanPhoneList(landline: $landline, mobile: $mobile)';
}


}

/// @nodoc
abstract mixin class $ScanPhoneListCopyWith<$Res>  {
  factory $ScanPhoneListCopyWith(ScanPhoneList value, $Res Function(ScanPhoneList) _then) = _$ScanPhoneListCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "landline") String? landline,@JsonKey(name: "mobile") String? mobile
});




}
/// @nodoc
class _$ScanPhoneListCopyWithImpl<$Res>
    implements $ScanPhoneListCopyWith<$Res> {
  _$ScanPhoneListCopyWithImpl(this._self, this._then);

  final ScanPhoneList _self;
  final $Res Function(ScanPhoneList) _then;

/// Create a copy of ScanPhoneList
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? landline = freezed,Object? mobile = freezed,}) {
  return _then(_self.copyWith(
landline: freezed == landline ? _self.landline : landline // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ScanPhoneList].
extension ScanPhoneListPatterns on ScanPhoneList {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScanPhoneList value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScanPhoneList() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScanPhoneList value)  $default,){
final _that = this;
switch (_that) {
case _ScanPhoneList():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScanPhoneList value)?  $default,){
final _that = this;
switch (_that) {
case _ScanPhoneList() when $default != null:
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
case _ScanPhoneList() when $default != null:
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
case _ScanPhoneList():
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
case _ScanPhoneList() when $default != null:
return $default(_that.landline,_that.mobile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScanPhoneList implements ScanPhoneList {
  const _ScanPhoneList({@JsonKey(name: "landline") this.landline, @JsonKey(name: "mobile") this.mobile});
  factory _ScanPhoneList.fromJson(Map<String, dynamic> json) => _$ScanPhoneListFromJson(json);

@override@JsonKey(name: "landline") final  String? landline;
@override@JsonKey(name: "mobile") final  String? mobile;

/// Create a copy of ScanPhoneList
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScanPhoneListCopyWith<_ScanPhoneList> get copyWith => __$ScanPhoneListCopyWithImpl<_ScanPhoneList>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScanPhoneListToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScanPhoneList&&(identical(other.landline, landline) || other.landline == landline)&&(identical(other.mobile, mobile) || other.mobile == mobile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,landline,mobile);

@override
String toString() {
  return 'ScanPhoneList(landline: $landline, mobile: $mobile)';
}


}

/// @nodoc
abstract mixin class _$ScanPhoneListCopyWith<$Res> implements $ScanPhoneListCopyWith<$Res> {
  factory _$ScanPhoneListCopyWith(_ScanPhoneList value, $Res Function(_ScanPhoneList) _then) = __$ScanPhoneListCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "landline") String? landline,@JsonKey(name: "mobile") String? mobile
});




}
/// @nodoc
class __$ScanPhoneListCopyWithImpl<$Res>
    implements _$ScanPhoneListCopyWith<$Res> {
  __$ScanPhoneListCopyWithImpl(this._self, this._then);

  final _ScanPhoneList _self;
  final $Res Function(_ScanPhoneList) _then;

/// Create a copy of ScanPhoneList
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? landline = freezed,Object? mobile = freezed,}) {
  return _then(_ScanPhoneList(
landline: freezed == landline ? _self.landline : landline // ignore: cast_nullable_to_non_nullable
as String?,mobile: freezed == mobile ? _self.mobile : mobile // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
