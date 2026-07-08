// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_upload_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaUploadResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") MediaUploadData? get data;
/// Create a copy of MediaUploadResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaUploadResponseCopyWith<MediaUploadResponse> get copyWith => _$MediaUploadResponseCopyWithImpl<MediaUploadResponse>(this as MediaUploadResponse, _$identity);

  /// Serializes this MediaUploadResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaUploadResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'MediaUploadResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $MediaUploadResponseCopyWith<$Res>  {
  factory $MediaUploadResponseCopyWith(MediaUploadResponse value, $Res Function(MediaUploadResponse) _then) = _$MediaUploadResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") MediaUploadData? data
});


$MediaUploadDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$MediaUploadResponseCopyWithImpl<$Res>
    implements $MediaUploadResponseCopyWith<$Res> {
  _$MediaUploadResponseCopyWithImpl(this._self, this._then);

  final MediaUploadResponse _self;
  final $Res Function(MediaUploadResponse) _then;

/// Create a copy of MediaUploadResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MediaUploadData?,
  ));
}
/// Create a copy of MediaUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaUploadDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MediaUploadDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [MediaUploadResponse].
extension MediaUploadResponsePatterns on MediaUploadResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaUploadResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaUploadResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaUploadResponse value)  $default,){
final _that = this;
switch (_that) {
case _MediaUploadResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaUploadResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MediaUploadResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  MediaUploadData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaUploadResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  MediaUploadData? data)  $default,) {final _that = this;
switch (_that) {
case _MediaUploadResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  MediaUploadData? data)?  $default,) {final _that = this;
switch (_that) {
case _MediaUploadResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaUploadResponse implements MediaUploadResponse {
  const _MediaUploadResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _MediaUploadResponse.fromJson(Map<String, dynamic> json) => _$MediaUploadResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  MediaUploadData? data;

/// Create a copy of MediaUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaUploadResponseCopyWith<_MediaUploadResponse> get copyWith => __$MediaUploadResponseCopyWithImpl<_MediaUploadResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaUploadResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaUploadResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'MediaUploadResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$MediaUploadResponseCopyWith<$Res> implements $MediaUploadResponseCopyWith<$Res> {
  factory _$MediaUploadResponseCopyWith(_MediaUploadResponse value, $Res Function(_MediaUploadResponse) _then) = __$MediaUploadResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") MediaUploadData? data
});


@override $MediaUploadDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$MediaUploadResponseCopyWithImpl<$Res>
    implements _$MediaUploadResponseCopyWith<$Res> {
  __$MediaUploadResponseCopyWithImpl(this._self, this._then);

  final _MediaUploadResponse _self;
  final $Res Function(_MediaUploadResponse) _then;

/// Create a copy of MediaUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_MediaUploadResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as MediaUploadData?,
  ));
}

/// Create a copy of MediaUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaUploadDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $MediaUploadDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$MediaUploadData {

@JsonKey(name: "name") String? get name;@JsonKey(name: "original_name") String? get originalName;
/// Create a copy of MediaUploadData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaUploadDataCopyWith<MediaUploadData> get copyWith => _$MediaUploadDataCopyWithImpl<MediaUploadData>(this as MediaUploadData, _$identity);

  /// Serializes this MediaUploadData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaUploadData&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,originalName);

@override
String toString() {
  return 'MediaUploadData(name: $name, originalName: $originalName)';
}


}

/// @nodoc
abstract mixin class $MediaUploadDataCopyWith<$Res>  {
  factory $MediaUploadDataCopyWith(MediaUploadData value, $Res Function(MediaUploadData) _then) = _$MediaUploadDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "name") String? name,@JsonKey(name: "original_name") String? originalName
});




}
/// @nodoc
class _$MediaUploadDataCopyWithImpl<$Res>
    implements $MediaUploadDataCopyWith<$Res> {
  _$MediaUploadDataCopyWithImpl(this._self, this._then);

  final MediaUploadData _self;
  final $Res Function(MediaUploadData) _then;

/// Create a copy of MediaUploadData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? originalName = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaUploadData].
extension MediaUploadDataPatterns on MediaUploadData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaUploadData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaUploadData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaUploadData value)  $default,){
final _that = this;
switch (_that) {
case _MediaUploadData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaUploadData value)?  $default,){
final _that = this;
switch (_that) {
case _MediaUploadData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  String? name, @JsonKey(name: "original_name")  String? originalName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaUploadData() when $default != null:
return $default(_that.name,_that.originalName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "name")  String? name, @JsonKey(name: "original_name")  String? originalName)  $default,) {final _that = this;
switch (_that) {
case _MediaUploadData():
return $default(_that.name,_that.originalName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "name")  String? name, @JsonKey(name: "original_name")  String? originalName)?  $default,) {final _that = this;
switch (_that) {
case _MediaUploadData() when $default != null:
return $default(_that.name,_that.originalName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaUploadData implements MediaUploadData {
  const _MediaUploadData({@JsonKey(name: "name") this.name, @JsonKey(name: "original_name") this.originalName});
  factory _MediaUploadData.fromJson(Map<String, dynamic> json) => _$MediaUploadDataFromJson(json);

@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "original_name") final  String? originalName;

/// Create a copy of MediaUploadData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaUploadDataCopyWith<_MediaUploadData> get copyWith => __$MediaUploadDataCopyWithImpl<_MediaUploadData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaUploadDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaUploadData&&(identical(other.name, name) || other.name == name)&&(identical(other.originalName, originalName) || other.originalName == originalName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,originalName);

@override
String toString() {
  return 'MediaUploadData(name: $name, originalName: $originalName)';
}


}

/// @nodoc
abstract mixin class _$MediaUploadDataCopyWith<$Res> implements $MediaUploadDataCopyWith<$Res> {
  factory _$MediaUploadDataCopyWith(_MediaUploadData value, $Res Function(_MediaUploadData) _then) = __$MediaUploadDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "name") String? name,@JsonKey(name: "original_name") String? originalName
});




}
/// @nodoc
class __$MediaUploadDataCopyWithImpl<$Res>
    implements _$MediaUploadDataCopyWith<$Res> {
  __$MediaUploadDataCopyWithImpl(this._self, this._then);

  final _MediaUploadData _self;
  final $Res Function(_MediaUploadData) _then;

/// Create a copy of MediaUploadData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? originalName = freezed,}) {
  return _then(_MediaUploadData(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,originalName: freezed == originalName ? _self.originalName : originalName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
