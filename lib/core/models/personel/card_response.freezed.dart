// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") CardData? get data;
/// Create a copy of CardResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardResponseCopyWith<CardResponse> get copyWith => _$CardResponseCopyWithImpl<CardResponse>(this as CardResponse, _$identity);

  /// Serializes this CardResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CardResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $CardResponseCopyWith<$Res>  {
  factory $CardResponseCopyWith(CardResponse value, $Res Function(CardResponse) _then) = _$CardResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") CardData? data
});


$CardDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$CardResponseCopyWithImpl<$Res>
    implements $CardResponseCopyWith<$Res> {
  _$CardResponseCopyWithImpl(this._self, this._then);

  final CardResponse _self;
  final $Res Function(CardResponse) _then;

/// Create a copy of CardResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CardData?,
  ));
}
/// Create a copy of CardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CardDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CardResponse].
extension CardResponsePatterns on CardResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardResponse value)  $default,){
final _that = this;
switch (_that) {
case _CardResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CardResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  CardData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  CardData? data)  $default,) {final _that = this;
switch (_that) {
case _CardResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  CardData? data)?  $default,) {final _that = this;
switch (_that) {
case _CardResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardResponse implements CardResponse {
  const _CardResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _CardResponse.fromJson(Map<String, dynamic> json) => _$CardResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  CardData? data;

/// Create a copy of CardResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardResponseCopyWith<_CardResponse> get copyWith => __$CardResponseCopyWithImpl<_CardResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'CardResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CardResponseCopyWith<$Res> implements $CardResponseCopyWith<$Res> {
  factory _$CardResponseCopyWith(_CardResponse value, $Res Function(_CardResponse) _then) = __$CardResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") CardData? data
});


@override $CardDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$CardResponseCopyWithImpl<$Res>
    implements _$CardResponseCopyWith<$Res> {
  __$CardResponseCopyWithImpl(this._self, this._then);

  final _CardResponse _self;
  final $Res Function(_CardResponse) _then;

/// Create a copy of CardResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_CardResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CardData?,
  ));
}

/// Create a copy of CardResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CardDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CardDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CardData {

@JsonKey(name: "name") String? get name;@JsonKey(name: "slug") String? get slug;@JsonKey(name: "title") String? get title;@JsonKey(name: "card_url") String? get cardUrl;@JsonKey(name: "vcard_url") String? get vcardUrl;@JsonKey(name: "qr_code_url") String? get qrCodeUrl;@JsonKey(name: "qr_photo_url") String? get qrPhotoUrl;@JsonKey(name: "photo_url") String? get photoUrl;
/// Create a copy of CardData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardDataCopyWith<CardData> get copyWith => _$CardDataCopyWithImpl<CardData>(this as CardData, _$identity);

  /// Serializes this CardData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardData&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.cardUrl, cardUrl) || other.cardUrl == cardUrl)&&(identical(other.vcardUrl, vcardUrl) || other.vcardUrl == vcardUrl)&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&(identical(other.qrPhotoUrl, qrPhotoUrl) || other.qrPhotoUrl == qrPhotoUrl)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,slug,title,cardUrl,vcardUrl,qrCodeUrl,qrPhotoUrl,photoUrl);

@override
String toString() {
  return 'CardData(name: $name, slug: $slug, title: $title, cardUrl: $cardUrl, vcardUrl: $vcardUrl, qrCodeUrl: $qrCodeUrl, qrPhotoUrl: $qrPhotoUrl, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class $CardDataCopyWith<$Res>  {
  factory $CardDataCopyWith(CardData value, $Res Function(CardData) _then) = _$CardDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "title") String? title,@JsonKey(name: "card_url") String? cardUrl,@JsonKey(name: "vcard_url") String? vcardUrl,@JsonKey(name: "qr_code_url") String? qrCodeUrl,@JsonKey(name: "qr_photo_url") String? qrPhotoUrl,@JsonKey(name: "photo_url") String? photoUrl
});




}
/// @nodoc
class _$CardDataCopyWithImpl<$Res>
    implements $CardDataCopyWith<$Res> {
  _$CardDataCopyWithImpl(this._self, this._then);

  final CardData _self;
  final $Res Function(CardData) _then;

/// Create a copy of CardData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? slug = freezed,Object? title = freezed,Object? cardUrl = freezed,Object? vcardUrl = freezed,Object? qrCodeUrl = freezed,Object? qrPhotoUrl = freezed,Object? photoUrl = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,cardUrl: freezed == cardUrl ? _self.cardUrl : cardUrl // ignore: cast_nullable_to_non_nullable
as String?,vcardUrl: freezed == vcardUrl ? _self.vcardUrl : vcardUrl // ignore: cast_nullable_to_non_nullable
as String?,qrCodeUrl: freezed == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String?,qrPhotoUrl: freezed == qrPhotoUrl ? _self.qrPhotoUrl : qrPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CardData].
extension CardDataPatterns on CardData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardData value)  $default,){
final _that = this;
switch (_that) {
case _CardData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardData value)?  $default,){
final _that = this;
switch (_that) {
case _CardData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  String? name, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "title")  String? title, @JsonKey(name: "card_url")  String? cardUrl, @JsonKey(name: "vcard_url")  String? vcardUrl, @JsonKey(name: "qr_code_url")  String? qrCodeUrl, @JsonKey(name: "qr_photo_url")  String? qrPhotoUrl, @JsonKey(name: "photo_url")  String? photoUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardData() when $default != null:
return $default(_that.name,_that.slug,_that.title,_that.cardUrl,_that.vcardUrl,_that.qrCodeUrl,_that.qrPhotoUrl,_that.photoUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  String? name, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "title")  String? title, @JsonKey(name: "card_url")  String? cardUrl, @JsonKey(name: "vcard_url")  String? vcardUrl, @JsonKey(name: "qr_code_url")  String? qrCodeUrl, @JsonKey(name: "qr_photo_url")  String? qrPhotoUrl, @JsonKey(name: "photo_url")  String? photoUrl)  $default,) {final _that = this;
switch (_that) {
case _CardData():
return $default(_that.name,_that.slug,_that.title,_that.cardUrl,_that.vcardUrl,_that.qrCodeUrl,_that.qrPhotoUrl,_that.photoUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "name")  String? name, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "title")  String? title, @JsonKey(name: "card_url")  String? cardUrl, @JsonKey(name: "vcard_url")  String? vcardUrl, @JsonKey(name: "qr_code_url")  String? qrCodeUrl, @JsonKey(name: "qr_photo_url")  String? qrPhotoUrl, @JsonKey(name: "photo_url")  String? photoUrl)?  $default,) {final _that = this;
switch (_that) {
case _CardData() when $default != null:
return $default(_that.name,_that.slug,_that.title,_that.cardUrl,_that.vcardUrl,_that.qrCodeUrl,_that.qrPhotoUrl,_that.photoUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardData implements CardData {
  const _CardData({@JsonKey(name: "name") this.name, @JsonKey(name: "slug") this.slug, @JsonKey(name: "title") this.title, @JsonKey(name: "card_url") this.cardUrl, @JsonKey(name: "vcard_url") this.vcardUrl, @JsonKey(name: "qr_code_url") this.qrCodeUrl, @JsonKey(name: "qr_photo_url") this.qrPhotoUrl, @JsonKey(name: "photo_url") this.photoUrl});
  factory _CardData.fromJson(Map<String, dynamic> json) => _$CardDataFromJson(json);

@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "slug") final  String? slug;
@override@JsonKey(name: "title") final  String? title;
@override@JsonKey(name: "card_url") final  String? cardUrl;
@override@JsonKey(name: "vcard_url") final  String? vcardUrl;
@override@JsonKey(name: "qr_code_url") final  String? qrCodeUrl;
@override@JsonKey(name: "qr_photo_url") final  String? qrPhotoUrl;
@override@JsonKey(name: "photo_url") final  String? photoUrl;

/// Create a copy of CardData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardDataCopyWith<_CardData> get copyWith => __$CardDataCopyWithImpl<_CardData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardData&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.cardUrl, cardUrl) || other.cardUrl == cardUrl)&&(identical(other.vcardUrl, vcardUrl) || other.vcardUrl == vcardUrl)&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&(identical(other.qrPhotoUrl, qrPhotoUrl) || other.qrPhotoUrl == qrPhotoUrl)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,slug,title,cardUrl,vcardUrl,qrCodeUrl,qrPhotoUrl,photoUrl);

@override
String toString() {
  return 'CardData(name: $name, slug: $slug, title: $title, cardUrl: $cardUrl, vcardUrl: $vcardUrl, qrCodeUrl: $qrCodeUrl, qrPhotoUrl: $qrPhotoUrl, photoUrl: $photoUrl)';
}


}

/// @nodoc
abstract mixin class _$CardDataCopyWith<$Res> implements $CardDataCopyWith<$Res> {
  factory _$CardDataCopyWith(_CardData value, $Res Function(_CardData) _then) = __$CardDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug,@JsonKey(name: "title") String? title,@JsonKey(name: "card_url") String? cardUrl,@JsonKey(name: "vcard_url") String? vcardUrl,@JsonKey(name: "qr_code_url") String? qrCodeUrl,@JsonKey(name: "qr_photo_url") String? qrPhotoUrl,@JsonKey(name: "photo_url") String? photoUrl
});




}
/// @nodoc
class __$CardDataCopyWithImpl<$Res>
    implements _$CardDataCopyWith<$Res> {
  __$CardDataCopyWithImpl(this._self, this._then);

  final _CardData _self;
  final $Res Function(_CardData) _then;

/// Create a copy of CardData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? slug = freezed,Object? title = freezed,Object? cardUrl = freezed,Object? vcardUrl = freezed,Object? qrCodeUrl = freezed,Object? qrPhotoUrl = freezed,Object? photoUrl = freezed,}) {
  return _then(_CardData(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,cardUrl: freezed == cardUrl ? _self.cardUrl : cardUrl // ignore: cast_nullable_to_non_nullable
as String?,vcardUrl: freezed == vcardUrl ? _self.vcardUrl : vcardUrl // ignore: cast_nullable_to_non_nullable
as String?,qrCodeUrl: freezed == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String?,qrPhotoUrl: freezed == qrPhotoUrl ? _self.qrPhotoUrl : qrPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
