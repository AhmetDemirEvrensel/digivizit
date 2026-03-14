// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'departments_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DepartmentsResponse {

@JsonKey(name: "success") bool get success;@JsonKey(name: "message") String get message;@JsonKey(name: "data") List<Datum> get data;
/// Create a copy of DepartmentsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentsResponseCopyWith<DepartmentsResponse> get copyWith => _$DepartmentsResponseCopyWithImpl<DepartmentsResponse>(this as DepartmentsResponse, _$identity);

  /// Serializes this DepartmentsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'DepartmentsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $DepartmentsResponseCopyWith<$Res>  {
  factory $DepartmentsResponseCopyWith(DepartmentsResponse value, $Res Function(DepartmentsResponse) _then) = _$DepartmentsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message,@JsonKey(name: "data") List<Datum> data
});




}
/// @nodoc
class _$DepartmentsResponseCopyWithImpl<$Res>
    implements $DepartmentsResponseCopyWith<$Res> {
  _$DepartmentsResponseCopyWithImpl(this._self, this._then);

  final DepartmentsResponse _self;
  final $Res Function(DepartmentsResponse) _then;

/// Create a copy of DepartmentsResponse
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


/// Adds pattern-matching-related methods to [DepartmentsResponse].
extension DepartmentsResponsePatterns on DepartmentsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentsResponse value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentsResponse() when $default != null:
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
case _DepartmentsResponse() when $default != null:
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
case _DepartmentsResponse():
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
case _DepartmentsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentsResponse implements DepartmentsResponse {
  const _DepartmentsResponse({@JsonKey(name: "success") required this.success, @JsonKey(name: "message") required this.message, @JsonKey(name: "data") required final  List<Datum> data}): _data = data;
  factory _DepartmentsResponse.fromJson(Map<String, dynamic> json) => _$DepartmentsResponseFromJson(json);

@override@JsonKey(name: "success") final  bool success;
@override@JsonKey(name: "message") final  String message;
 final  List<Datum> _data;
@override@JsonKey(name: "data") List<Datum> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of DepartmentsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentsResponseCopyWith<_DepartmentsResponse> get copyWith => __$DepartmentsResponseCopyWithImpl<_DepartmentsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'DepartmentsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DepartmentsResponseCopyWith<$Res> implements $DepartmentsResponseCopyWith<$Res> {
  factory _$DepartmentsResponseCopyWith(_DepartmentsResponse value, $Res Function(_DepartmentsResponse) _then) = __$DepartmentsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message,@JsonKey(name: "data") List<Datum> data
});




}
/// @nodoc
class __$DepartmentsResponseCopyWithImpl<$Res>
    implements _$DepartmentsResponseCopyWith<$Res> {
  __$DepartmentsResponseCopyWithImpl(this._self, this._then);

  final _DepartmentsResponse _self;
  final $Res Function(_DepartmentsResponse) _then;

/// Create a copy of DepartmentsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_DepartmentsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Datum>,
  ));
}


}


/// @nodoc
mixin _$Datum {

@JsonKey(name: "id") int get id;@JsonKey(name: "name") String get name;@JsonKey(name: "name_en") String get nameEn;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "deleted_at") dynamic get deletedAt;@JsonKey(name: "banner_background") BannerBackground? get bannerBackground;@JsonKey(name: "media") List<BannerBackground> get media;
/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatumCopyWith<Datum> get copyWith => _$DatumCopyWithImpl<Datum>(this as Datum, _$identity);

  /// Serializes this Datum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Datum&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.bannerBackground, bannerBackground) || other.bannerBackground == bannerBackground)&&const DeepCollectionEquality().equals(other.media, media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameEn,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),bannerBackground,const DeepCollectionEquality().hash(media));

@override
String toString() {
  return 'Datum(id: $id, name: $name, nameEn: $nameEn, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, bannerBackground: $bannerBackground, media: $media)';
}


}

/// @nodoc
abstract mixin class $DatumCopyWith<$Res>  {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) _then) = _$DatumCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "name") String name,@JsonKey(name: "name_en") String nameEn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "banner_background") BannerBackground? bannerBackground,@JsonKey(name: "media") List<BannerBackground> media
});


$BannerBackgroundCopyWith<$Res>? get bannerBackground;

}
/// @nodoc
class _$DatumCopyWithImpl<$Res>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._self, this._then);

  final Datum _self;
  final $Res Function(Datum) _then;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameEn = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? bannerBackground = freezed,Object? media = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,bannerBackground: freezed == bannerBackground ? _self.bannerBackground : bannerBackground // ignore: cast_nullable_to_non_nullable
as BannerBackground?,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<BannerBackground>,
  ));
}
/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerBackgroundCopyWith<$Res>? get bannerBackground {
    if (_self.bannerBackground == null) {
    return null;
  }

  return $BannerBackgroundCopyWith<$Res>(_self.bannerBackground!, (value) {
    return _then(_self.copyWith(bannerBackground: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "name")  String name, @JsonKey(name: "name_en")  String nameEn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "banner_background")  BannerBackground? bannerBackground, @JsonKey(name: "media")  List<BannerBackground> media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Datum() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "name")  String name, @JsonKey(name: "name_en")  String nameEn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "banner_background")  BannerBackground? bannerBackground, @JsonKey(name: "media")  List<BannerBackground> media)  $default,) {final _that = this;
switch (_that) {
case _Datum():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "name")  String name, @JsonKey(name: "name_en")  String nameEn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "banner_background")  BannerBackground? bannerBackground, @JsonKey(name: "media")  List<BannerBackground> media)?  $default,) {final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that.id,_that.name,_that.nameEn,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.bannerBackground,_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Datum implements Datum {
  const _Datum({@JsonKey(name: "id") required this.id, @JsonKey(name: "name") required this.name, @JsonKey(name: "name_en") required this.nameEn, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "deleted_at") required this.deletedAt, @JsonKey(name: "banner_background") required this.bannerBackground, @JsonKey(name: "media") required final  List<BannerBackground> media}): _media = media;
  factory _Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "name_en") final  String nameEn;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override@JsonKey(name: "deleted_at") final  dynamic deletedAt;
@override@JsonKey(name: "banner_background") final  BannerBackground? bannerBackground;
 final  List<BannerBackground> _media;
@override@JsonKey(name: "media") List<BannerBackground> get media {
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Datum&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.bannerBackground, bannerBackground) || other.bannerBackground == bannerBackground)&&const DeepCollectionEquality().equals(other._media, _media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameEn,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),bannerBackground,const DeepCollectionEquality().hash(_media));

@override
String toString() {
  return 'Datum(id: $id, name: $name, nameEn: $nameEn, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, bannerBackground: $bannerBackground, media: $media)';
}


}

/// @nodoc
abstract mixin class _$DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$DatumCopyWith(_Datum value, $Res Function(_Datum) _then) = __$DatumCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "name") String name,@JsonKey(name: "name_en") String nameEn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "banner_background") BannerBackground? bannerBackground,@JsonKey(name: "media") List<BannerBackground> media
});


@override $BannerBackgroundCopyWith<$Res>? get bannerBackground;

}
/// @nodoc
class __$DatumCopyWithImpl<$Res>
    implements _$DatumCopyWith<$Res> {
  __$DatumCopyWithImpl(this._self, this._then);

  final _Datum _self;
  final $Res Function(_Datum) _then;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameEn = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? bannerBackground = freezed,Object? media = null,}) {
  return _then(_Datum(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameEn: null == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,bannerBackground: freezed == bannerBackground ? _self.bannerBackground : bannerBackground // ignore: cast_nullable_to_non_nullable
as BannerBackground?,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<BannerBackground>,
  ));
}

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BannerBackgroundCopyWith<$Res>? get bannerBackground {
    if (_self.bannerBackground == null) {
    return null;
  }

  return $BannerBackgroundCopyWith<$Res>(_self.bannerBackground!, (value) {
    return _then(_self.copyWith(bannerBackground: value));
  });
}
}


/// @nodoc
mixin _$BannerBackground {

@JsonKey(name: "id") int get id;@JsonKey(name: "model_type") String get modelType;@JsonKey(name: "model_id") int get modelId;@JsonKey(name: "uuid") String get uuid;@JsonKey(name: "collection_name") String get collectionName;@JsonKey(name: "name") String get name;@JsonKey(name: "file_name") String get fileName;@JsonKey(name: "mime_type") String get mimeType;@JsonKey(name: "disk") String get disk;@JsonKey(name: "conversions_disk") String get conversionsDisk;@JsonKey(name: "size") int get size;@JsonKey(name: "manipulations") List<dynamic> get manipulations;@JsonKey(name: "custom_properties") List<dynamic> get customProperties;@JsonKey(name: "generated_conversions") GeneratedConversions get generatedConversions;@JsonKey(name: "responsive_images") List<dynamic> get responsiveImages;@JsonKey(name: "order_column") int get orderColumn;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "original_url") String get originalUrl;@JsonKey(name: "preview_url") String get previewUrl;
/// Create a copy of BannerBackground
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BannerBackgroundCopyWith<BannerBackground> get copyWith => _$BannerBackgroundCopyWithImpl<BannerBackground>(this as BannerBackground, _$identity);

  /// Serializes this BannerBackground to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BannerBackground&&(identical(other.id, id) || other.id == id)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.disk, disk) || other.disk == disk)&&(identical(other.conversionsDisk, conversionsDisk) || other.conversionsDisk == conversionsDisk)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.manipulations, manipulations)&&const DeepCollectionEquality().equals(other.customProperties, customProperties)&&(identical(other.generatedConversions, generatedConversions) || other.generatedConversions == generatedConversions)&&const DeepCollectionEquality().equals(other.responsiveImages, responsiveImages)&&(identical(other.orderColumn, orderColumn) || other.orderColumn == orderColumn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,modelType,modelId,uuid,collectionName,name,fileName,mimeType,disk,conversionsDisk,size,const DeepCollectionEquality().hash(manipulations),const DeepCollectionEquality().hash(customProperties),generatedConversions,const DeepCollectionEquality().hash(responsiveImages),orderColumn,createdAt,updatedAt,originalUrl,previewUrl]);

@override
String toString() {
  return 'BannerBackground(id: $id, modelType: $modelType, modelId: $modelId, uuid: $uuid, collectionName: $collectionName, name: $name, fileName: $fileName, mimeType: $mimeType, disk: $disk, conversionsDisk: $conversionsDisk, size: $size, manipulations: $manipulations, customProperties: $customProperties, generatedConversions: $generatedConversions, responsiveImages: $responsiveImages, orderColumn: $orderColumn, createdAt: $createdAt, updatedAt: $updatedAt, originalUrl: $originalUrl, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class $BannerBackgroundCopyWith<$Res>  {
  factory $BannerBackgroundCopyWith(BannerBackground value, $Res Function(BannerBackground) _then) = _$BannerBackgroundCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "model_type") String modelType,@JsonKey(name: "model_id") int modelId,@JsonKey(name: "uuid") String uuid,@JsonKey(name: "collection_name") String collectionName,@JsonKey(name: "name") String name,@JsonKey(name: "file_name") String fileName,@JsonKey(name: "mime_type") String mimeType,@JsonKey(name: "disk") String disk,@JsonKey(name: "conversions_disk") String conversionsDisk,@JsonKey(name: "size") int size,@JsonKey(name: "manipulations") List<dynamic> manipulations,@JsonKey(name: "custom_properties") List<dynamic> customProperties,@JsonKey(name: "generated_conversions") GeneratedConversions generatedConversions,@JsonKey(name: "responsive_images") List<dynamic> responsiveImages,@JsonKey(name: "order_column") int orderColumn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "original_url") String originalUrl,@JsonKey(name: "preview_url") String previewUrl
});


$GeneratedConversionsCopyWith<$Res> get generatedConversions;

}
/// @nodoc
class _$BannerBackgroundCopyWithImpl<$Res>
    implements $BannerBackgroundCopyWith<$Res> {
  _$BannerBackgroundCopyWithImpl(this._self, this._then);

  final BannerBackground _self;
  final $Res Function(BannerBackground) _then;

/// Create a copy of BannerBackground
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
as GeneratedConversions,responsiveImages: null == responsiveImages ? _self.responsiveImages : responsiveImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,orderColumn: null == orderColumn ? _self.orderColumn : orderColumn // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,previewUrl: null == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of BannerBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeneratedConversionsCopyWith<$Res> get generatedConversions {
  
  return $GeneratedConversionsCopyWith<$Res>(_self.generatedConversions, (value) {
    return _then(_self.copyWith(generatedConversions: value));
  });
}
}


/// Adds pattern-matching-related methods to [BannerBackground].
extension BannerBackgroundPatterns on BannerBackground {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BannerBackground value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BannerBackground() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BannerBackground value)  $default,){
final _that = this;
switch (_that) {
case _BannerBackground():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BannerBackground value)?  $default,){
final _that = this;
switch (_that) {
case _BannerBackground() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  GeneratedConversions generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BannerBackground() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  GeneratedConversions generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)  $default,) {final _that = this;
switch (_that) {
case _BannerBackground():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  GeneratedConversions generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)?  $default,) {final _that = this;
switch (_that) {
case _BannerBackground() when $default != null:
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.originalUrl,_that.previewUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BannerBackground implements BannerBackground {
  const _BannerBackground({@JsonKey(name: "id") required this.id, @JsonKey(name: "model_type") required this.modelType, @JsonKey(name: "model_id") required this.modelId, @JsonKey(name: "uuid") required this.uuid, @JsonKey(name: "collection_name") required this.collectionName, @JsonKey(name: "name") required this.name, @JsonKey(name: "file_name") required this.fileName, @JsonKey(name: "mime_type") required this.mimeType, @JsonKey(name: "disk") required this.disk, @JsonKey(name: "conversions_disk") required this.conversionsDisk, @JsonKey(name: "size") required this.size, @JsonKey(name: "manipulations") required final  List<dynamic> manipulations, @JsonKey(name: "custom_properties") required final  List<dynamic> customProperties, @JsonKey(name: "generated_conversions") required this.generatedConversions, @JsonKey(name: "responsive_images") required final  List<dynamic> responsiveImages, @JsonKey(name: "order_column") required this.orderColumn, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "original_url") required this.originalUrl, @JsonKey(name: "preview_url") required this.previewUrl}): _manipulations = manipulations,_customProperties = customProperties,_responsiveImages = responsiveImages;
  factory _BannerBackground.fromJson(Map<String, dynamic> json) => _$BannerBackgroundFromJson(json);

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

@override@JsonKey(name: "generated_conversions") final  GeneratedConversions generatedConversions;
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

/// Create a copy of BannerBackground
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BannerBackgroundCopyWith<_BannerBackground> get copyWith => __$BannerBackgroundCopyWithImpl<_BannerBackground>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BannerBackgroundToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BannerBackground&&(identical(other.id, id) || other.id == id)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.disk, disk) || other.disk == disk)&&(identical(other.conversionsDisk, conversionsDisk) || other.conversionsDisk == conversionsDisk)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._manipulations, _manipulations)&&const DeepCollectionEquality().equals(other._customProperties, _customProperties)&&(identical(other.generatedConversions, generatedConversions) || other.generatedConversions == generatedConversions)&&const DeepCollectionEquality().equals(other._responsiveImages, _responsiveImages)&&(identical(other.orderColumn, orderColumn) || other.orderColumn == orderColumn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,modelType,modelId,uuid,collectionName,name,fileName,mimeType,disk,conversionsDisk,size,const DeepCollectionEquality().hash(_manipulations),const DeepCollectionEquality().hash(_customProperties),generatedConversions,const DeepCollectionEquality().hash(_responsiveImages),orderColumn,createdAt,updatedAt,originalUrl,previewUrl]);

@override
String toString() {
  return 'BannerBackground(id: $id, modelType: $modelType, modelId: $modelId, uuid: $uuid, collectionName: $collectionName, name: $name, fileName: $fileName, mimeType: $mimeType, disk: $disk, conversionsDisk: $conversionsDisk, size: $size, manipulations: $manipulations, customProperties: $customProperties, generatedConversions: $generatedConversions, responsiveImages: $responsiveImages, orderColumn: $orderColumn, createdAt: $createdAt, updatedAt: $updatedAt, originalUrl: $originalUrl, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class _$BannerBackgroundCopyWith<$Res> implements $BannerBackgroundCopyWith<$Res> {
  factory _$BannerBackgroundCopyWith(_BannerBackground value, $Res Function(_BannerBackground) _then) = __$BannerBackgroundCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "model_type") String modelType,@JsonKey(name: "model_id") int modelId,@JsonKey(name: "uuid") String uuid,@JsonKey(name: "collection_name") String collectionName,@JsonKey(name: "name") String name,@JsonKey(name: "file_name") String fileName,@JsonKey(name: "mime_type") String mimeType,@JsonKey(name: "disk") String disk,@JsonKey(name: "conversions_disk") String conversionsDisk,@JsonKey(name: "size") int size,@JsonKey(name: "manipulations") List<dynamic> manipulations,@JsonKey(name: "custom_properties") List<dynamic> customProperties,@JsonKey(name: "generated_conversions") GeneratedConversions generatedConversions,@JsonKey(name: "responsive_images") List<dynamic> responsiveImages,@JsonKey(name: "order_column") int orderColumn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "original_url") String originalUrl,@JsonKey(name: "preview_url") String previewUrl
});


@override $GeneratedConversionsCopyWith<$Res> get generatedConversions;

}
/// @nodoc
class __$BannerBackgroundCopyWithImpl<$Res>
    implements _$BannerBackgroundCopyWith<$Res> {
  __$BannerBackgroundCopyWithImpl(this._self, this._then);

  final _BannerBackground _self;
  final $Res Function(_BannerBackground) _then;

/// Create a copy of BannerBackground
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? modelType = null,Object? modelId = null,Object? uuid = null,Object? collectionName = null,Object? name = null,Object? fileName = null,Object? mimeType = null,Object? disk = null,Object? conversionsDisk = null,Object? size = null,Object? manipulations = null,Object? customProperties = null,Object? generatedConversions = null,Object? responsiveImages = null,Object? orderColumn = null,Object? createdAt = null,Object? updatedAt = null,Object? originalUrl = null,Object? previewUrl = null,}) {
  return _then(_BannerBackground(
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
as GeneratedConversions,responsiveImages: null == responsiveImages ? _self._responsiveImages : responsiveImages // ignore: cast_nullable_to_non_nullable
as List<dynamic>,orderColumn: null == orderColumn ? _self.orderColumn : orderColumn // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,previewUrl: null == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of BannerBackground
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeneratedConversionsCopyWith<$Res> get generatedConversions {
  
  return $GeneratedConversionsCopyWith<$Res>(_self.generatedConversions, (value) {
    return _then(_self.copyWith(generatedConversions: value));
  });
}
}


/// @nodoc
mixin _$GeneratedConversions {

@JsonKey(name: "thumb") bool get thumb;@JsonKey(name: "preview") bool get preview;
/// Create a copy of GeneratedConversions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneratedConversionsCopyWith<GeneratedConversions> get copyWith => _$GeneratedConversionsCopyWithImpl<GeneratedConversions>(this as GeneratedConversions, _$identity);

  /// Serializes this GeneratedConversions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneratedConversions&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.preview, preview) || other.preview == preview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thumb,preview);

@override
String toString() {
  return 'GeneratedConversions(thumb: $thumb, preview: $preview)';
}


}

/// @nodoc
abstract mixin class $GeneratedConversionsCopyWith<$Res>  {
  factory $GeneratedConversionsCopyWith(GeneratedConversions value, $Res Function(GeneratedConversions) _then) = _$GeneratedConversionsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "thumb") bool thumb,@JsonKey(name: "preview") bool preview
});




}
/// @nodoc
class _$GeneratedConversionsCopyWithImpl<$Res>
    implements $GeneratedConversionsCopyWith<$Res> {
  _$GeneratedConversionsCopyWithImpl(this._self, this._then);

  final GeneratedConversions _self;
  final $Res Function(GeneratedConversions) _then;

/// Create a copy of GeneratedConversions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? thumb = null,Object? preview = null,}) {
  return _then(_self.copyWith(
thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as bool,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneratedConversions].
extension GeneratedConversionsPatterns on GeneratedConversions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneratedConversions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneratedConversions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneratedConversions value)  $default,){
final _that = this;
switch (_that) {
case _GeneratedConversions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneratedConversions value)?  $default,){
final _that = this;
switch (_that) {
case _GeneratedConversions() when $default != null:
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
case _GeneratedConversions() when $default != null:
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
case _GeneratedConversions():
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
case _GeneratedConversions() when $default != null:
return $default(_that.thumb,_that.preview);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneratedConversions implements GeneratedConversions {
  const _GeneratedConversions({@JsonKey(name: "thumb") required this.thumb, @JsonKey(name: "preview") required this.preview});
  factory _GeneratedConversions.fromJson(Map<String, dynamic> json) => _$GeneratedConversionsFromJson(json);

@override@JsonKey(name: "thumb") final  bool thumb;
@override@JsonKey(name: "preview") final  bool preview;

/// Create a copy of GeneratedConversions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneratedConversionsCopyWith<_GeneratedConversions> get copyWith => __$GeneratedConversionsCopyWithImpl<_GeneratedConversions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneratedConversionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneratedConversions&&(identical(other.thumb, thumb) || other.thumb == thumb)&&(identical(other.preview, preview) || other.preview == preview));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,thumb,preview);

@override
String toString() {
  return 'GeneratedConversions(thumb: $thumb, preview: $preview)';
}


}

/// @nodoc
abstract mixin class _$GeneratedConversionsCopyWith<$Res> implements $GeneratedConversionsCopyWith<$Res> {
  factory _$GeneratedConversionsCopyWith(_GeneratedConversions value, $Res Function(_GeneratedConversions) _then) = __$GeneratedConversionsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "thumb") bool thumb,@JsonKey(name: "preview") bool preview
});




}
/// @nodoc
class __$GeneratedConversionsCopyWithImpl<$Res>
    implements _$GeneratedConversionsCopyWith<$Res> {
  __$GeneratedConversionsCopyWithImpl(this._self, this._then);

  final _GeneratedConversions _self;
  final $Res Function(_GeneratedConversions) _then;

/// Create a copy of GeneratedConversions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? thumb = null,Object? preview = null,}) {
  return _then(_GeneratedConversions(
thumb: null == thumb ? _self.thumb : thumb // ignore: cast_nullable_to_non_nullable
as bool,preview: null == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
