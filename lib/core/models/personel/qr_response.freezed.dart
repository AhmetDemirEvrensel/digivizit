// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qr_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QrResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") QrData? get data;
/// Create a copy of QrResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrResponseCopyWith<QrResponse> get copyWith => _$QrResponseCopyWithImpl<QrResponse>(this as QrResponse, _$identity);

  /// Serializes this QrResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'QrResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $QrResponseCopyWith<$Res>  {
  factory $QrResponseCopyWith(QrResponse value, $Res Function(QrResponse) _then) = _$QrResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") QrData? data
});


$QrDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$QrResponseCopyWithImpl<$Res>
    implements $QrResponseCopyWith<$Res> {
  _$QrResponseCopyWithImpl(this._self, this._then);

  final QrResponse _self;
  final $Res Function(QrResponse) _then;

/// Create a copy of QrResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as QrData?,
  ));
}
/// Create a copy of QrResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $QrDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [QrResponse].
extension QrResponsePatterns on QrResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrResponse value)  $default,){
final _that = this;
switch (_that) {
case _QrResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrResponse value)?  $default,){
final _that = this;
switch (_that) {
case _QrResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  QrData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  QrData? data)  $default,) {final _that = this;
switch (_that) {
case _QrResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  QrData? data)?  $default,) {final _that = this;
switch (_that) {
case _QrResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrResponse implements QrResponse {
  const _QrResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _QrResponse.fromJson(Map<String, dynamic> json) => _$QrResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  QrData? data;

/// Create a copy of QrResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrResponseCopyWith<_QrResponse> get copyWith => __$QrResponseCopyWithImpl<_QrResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'QrResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$QrResponseCopyWith<$Res> implements $QrResponseCopyWith<$Res> {
  factory _$QrResponseCopyWith(_QrResponse value, $Res Function(_QrResponse) _then) = __$QrResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") QrData? data
});


@override $QrDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$QrResponseCopyWithImpl<$Res>
    implements _$QrResponseCopyWith<$Res> {
  __$QrResponseCopyWithImpl(this._self, this._then);

  final _QrResponse _self;
  final $Res Function(_QrResponse) _then;

/// Create a copy of QrResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_QrResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as QrData?,
  ));
}

/// Create a copy of QrResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QrDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $QrDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$QrData {

@JsonKey(name: "qr_code_url") String? get qrCodeUrl;@JsonKey(name: "qr_photo_url") String? get qrPhotoUrl;@JsonKey(name: "qr_photo_thumbnail") String? get qrPhotoThumbnail;@JsonKey(name: "qr_photo_preview") String? get qrPhotoPreview;
/// Create a copy of QrData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QrDataCopyWith<QrData> get copyWith => _$QrDataCopyWithImpl<QrData>(this as QrData, _$identity);

  /// Serializes this QrData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QrData&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&(identical(other.qrPhotoUrl, qrPhotoUrl) || other.qrPhotoUrl == qrPhotoUrl)&&(identical(other.qrPhotoThumbnail, qrPhotoThumbnail) || other.qrPhotoThumbnail == qrPhotoThumbnail)&&(identical(other.qrPhotoPreview, qrPhotoPreview) || other.qrPhotoPreview == qrPhotoPreview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qrCodeUrl,qrPhotoUrl,qrPhotoThumbnail,qrPhotoPreview);

@override
String toString() {
  return 'QrData(qrCodeUrl: $qrCodeUrl, qrPhotoUrl: $qrPhotoUrl, qrPhotoThumbnail: $qrPhotoThumbnail, qrPhotoPreview: $qrPhotoPreview)';
}


}

/// @nodoc
abstract mixin class $QrDataCopyWith<$Res>  {
  factory $QrDataCopyWith(QrData value, $Res Function(QrData) _then) = _$QrDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "qr_code_url") String? qrCodeUrl,@JsonKey(name: "qr_photo_url") String? qrPhotoUrl,@JsonKey(name: "qr_photo_thumbnail") String? qrPhotoThumbnail,@JsonKey(name: "qr_photo_preview") String? qrPhotoPreview
});




}
/// @nodoc
class _$QrDataCopyWithImpl<$Res>
    implements $QrDataCopyWith<$Res> {
  _$QrDataCopyWithImpl(this._self, this._then);

  final QrData _self;
  final $Res Function(QrData) _then;

/// Create a copy of QrData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? qrCodeUrl = freezed,Object? qrPhotoUrl = freezed,Object? qrPhotoThumbnail = freezed,Object? qrPhotoPreview = freezed,}) {
  return _then(_self.copyWith(
qrCodeUrl: freezed == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String?,qrPhotoUrl: freezed == qrPhotoUrl ? _self.qrPhotoUrl : qrPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,qrPhotoThumbnail: freezed == qrPhotoThumbnail ? _self.qrPhotoThumbnail : qrPhotoThumbnail // ignore: cast_nullable_to_non_nullable
as String?,qrPhotoPreview: freezed == qrPhotoPreview ? _self.qrPhotoPreview : qrPhotoPreview // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QrData].
extension QrDataPatterns on QrData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QrData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QrData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QrData value)  $default,){
final _that = this;
switch (_that) {
case _QrData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QrData value)?  $default,){
final _that = this;
switch (_that) {
case _QrData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "qr_code_url")  String? qrCodeUrl, @JsonKey(name: "qr_photo_url")  String? qrPhotoUrl, @JsonKey(name: "qr_photo_thumbnail")  String? qrPhotoThumbnail, @JsonKey(name: "qr_photo_preview")  String? qrPhotoPreview)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QrData() when $default != null:
return $default(_that.qrCodeUrl,_that.qrPhotoUrl,_that.qrPhotoThumbnail,_that.qrPhotoPreview);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "qr_code_url")  String? qrCodeUrl, @JsonKey(name: "qr_photo_url")  String? qrPhotoUrl, @JsonKey(name: "qr_photo_thumbnail")  String? qrPhotoThumbnail, @JsonKey(name: "qr_photo_preview")  String? qrPhotoPreview)  $default,) {final _that = this;
switch (_that) {
case _QrData():
return $default(_that.qrCodeUrl,_that.qrPhotoUrl,_that.qrPhotoThumbnail,_that.qrPhotoPreview);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "qr_code_url")  String? qrCodeUrl, @JsonKey(name: "qr_photo_url")  String? qrPhotoUrl, @JsonKey(name: "qr_photo_thumbnail")  String? qrPhotoThumbnail, @JsonKey(name: "qr_photo_preview")  String? qrPhotoPreview)?  $default,) {final _that = this;
switch (_that) {
case _QrData() when $default != null:
return $default(_that.qrCodeUrl,_that.qrPhotoUrl,_that.qrPhotoThumbnail,_that.qrPhotoPreview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QrData implements QrData {
  const _QrData({@JsonKey(name: "qr_code_url") this.qrCodeUrl, @JsonKey(name: "qr_photo_url") this.qrPhotoUrl, @JsonKey(name: "qr_photo_thumbnail") this.qrPhotoThumbnail, @JsonKey(name: "qr_photo_preview") this.qrPhotoPreview});
  factory _QrData.fromJson(Map<String, dynamic> json) => _$QrDataFromJson(json);

@override@JsonKey(name: "qr_code_url") final  String? qrCodeUrl;
@override@JsonKey(name: "qr_photo_url") final  String? qrPhotoUrl;
@override@JsonKey(name: "qr_photo_thumbnail") final  String? qrPhotoThumbnail;
@override@JsonKey(name: "qr_photo_preview") final  String? qrPhotoPreview;

/// Create a copy of QrData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QrDataCopyWith<_QrData> get copyWith => __$QrDataCopyWithImpl<_QrData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QrDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QrData&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&(identical(other.qrPhotoUrl, qrPhotoUrl) || other.qrPhotoUrl == qrPhotoUrl)&&(identical(other.qrPhotoThumbnail, qrPhotoThumbnail) || other.qrPhotoThumbnail == qrPhotoThumbnail)&&(identical(other.qrPhotoPreview, qrPhotoPreview) || other.qrPhotoPreview == qrPhotoPreview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,qrCodeUrl,qrPhotoUrl,qrPhotoThumbnail,qrPhotoPreview);

@override
String toString() {
  return 'QrData(qrCodeUrl: $qrCodeUrl, qrPhotoUrl: $qrPhotoUrl, qrPhotoThumbnail: $qrPhotoThumbnail, qrPhotoPreview: $qrPhotoPreview)';
}


}

/// @nodoc
abstract mixin class _$QrDataCopyWith<$Res> implements $QrDataCopyWith<$Res> {
  factory _$QrDataCopyWith(_QrData value, $Res Function(_QrData) _then) = __$QrDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "qr_code_url") String? qrCodeUrl,@JsonKey(name: "qr_photo_url") String? qrPhotoUrl,@JsonKey(name: "qr_photo_thumbnail") String? qrPhotoThumbnail,@JsonKey(name: "qr_photo_preview") String? qrPhotoPreview
});




}
/// @nodoc
class __$QrDataCopyWithImpl<$Res>
    implements _$QrDataCopyWith<$Res> {
  __$QrDataCopyWithImpl(this._self, this._then);

  final _QrData _self;
  final $Res Function(_QrData) _then;

/// Create a copy of QrData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? qrCodeUrl = freezed,Object? qrPhotoUrl = freezed,Object? qrPhotoThumbnail = freezed,Object? qrPhotoPreview = freezed,}) {
  return _then(_QrData(
qrCodeUrl: freezed == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String?,qrPhotoUrl: freezed == qrPhotoUrl ? _self.qrPhotoUrl : qrPhotoUrl // ignore: cast_nullable_to_non_nullable
as String?,qrPhotoThumbnail: freezed == qrPhotoThumbnail ? _self.qrPhotoThumbnail : qrPhotoThumbnail // ignore: cast_nullable_to_non_nullable
as String?,qrPhotoPreview: freezed == qrPhotoPreview ? _self.qrPhotoPreview : qrPhotoPreview // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
