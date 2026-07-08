// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contacts_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BusinessCardListResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") BusinessCardListData? get data;
/// Create a copy of BusinessCardListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCardListResponseCopyWith<BusinessCardListResponse> get copyWith => _$BusinessCardListResponseCopyWithImpl<BusinessCardListResponse>(this as BusinessCardListResponse, _$identity);

  /// Serializes this BusinessCardListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCardListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'BusinessCardListResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $BusinessCardListResponseCopyWith<$Res>  {
  factory $BusinessCardListResponseCopyWith(BusinessCardListResponse value, $Res Function(BusinessCardListResponse) _then) = _$BusinessCardListResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") BusinessCardListData? data
});


$BusinessCardListDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$BusinessCardListResponseCopyWithImpl<$Res>
    implements $BusinessCardListResponseCopyWith<$Res> {
  _$BusinessCardListResponseCopyWithImpl(this._self, this._then);

  final BusinessCardListResponse _self;
  final $Res Function(BusinessCardListResponse) _then;

/// Create a copy of BusinessCardListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BusinessCardListData?,
  ));
}
/// Create a copy of BusinessCardListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessCardListDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BusinessCardListDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [BusinessCardListResponse].
extension BusinessCardListResponsePatterns on BusinessCardListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessCardListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessCardListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessCardListResponse value)  $default,){
final _that = this;
switch (_that) {
case _BusinessCardListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessCardListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessCardListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  BusinessCardListData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessCardListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  BusinessCardListData? data)  $default,) {final _that = this;
switch (_that) {
case _BusinessCardListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  BusinessCardListData? data)?  $default,) {final _that = this;
switch (_that) {
case _BusinessCardListResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessCardListResponse implements BusinessCardListResponse {
  const _BusinessCardListResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _BusinessCardListResponse.fromJson(Map<String, dynamic> json) => _$BusinessCardListResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  BusinessCardListData? data;

/// Create a copy of BusinessCardListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCardListResponseCopyWith<_BusinessCardListResponse> get copyWith => __$BusinessCardListResponseCopyWithImpl<_BusinessCardListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCardListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCardListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'BusinessCardListResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BusinessCardListResponseCopyWith<$Res> implements $BusinessCardListResponseCopyWith<$Res> {
  factory _$BusinessCardListResponseCopyWith(_BusinessCardListResponse value, $Res Function(_BusinessCardListResponse) _then) = __$BusinessCardListResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") BusinessCardListData? data
});


@override $BusinessCardListDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$BusinessCardListResponseCopyWithImpl<$Res>
    implements _$BusinessCardListResponseCopyWith<$Res> {
  __$BusinessCardListResponseCopyWithImpl(this._self, this._then);

  final _BusinessCardListResponse _self;
  final $Res Function(_BusinessCardListResponse) _then;

/// Create a copy of BusinessCardListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_BusinessCardListResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BusinessCardListData?,
  ));
}

/// Create a copy of BusinessCardListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessCardListDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BusinessCardListDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$BusinessCardListData {

@JsonKey(name: "items") List<BusinessCardListItem>? get items;@JsonKey(name: "meta") PageMeta? get meta;
/// Create a copy of BusinessCardListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCardListDataCopyWith<BusinessCardListData> get copyWith => _$BusinessCardListDataCopyWithImpl<BusinessCardListData>(this as BusinessCardListData, _$identity);

  /// Serializes this BusinessCardListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCardListData&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),meta);

@override
String toString() {
  return 'BusinessCardListData(items: $items, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $BusinessCardListDataCopyWith<$Res>  {
  factory $BusinessCardListDataCopyWith(BusinessCardListData value, $Res Function(BusinessCardListData) _then) = _$BusinessCardListDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "items") List<BusinessCardListItem>? items,@JsonKey(name: "meta") PageMeta? meta
});


$PageMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$BusinessCardListDataCopyWithImpl<$Res>
    implements $BusinessCardListDataCopyWith<$Res> {
  _$BusinessCardListDataCopyWithImpl(this._self, this._then);

  final BusinessCardListData _self;
  final $Res Function(BusinessCardListData) _then;

/// Create a copy of BusinessCardListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BusinessCardListItem>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PageMeta?,
  ));
}
/// Create a copy of BusinessCardListData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PageMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// Adds pattern-matching-related methods to [BusinessCardListData].
extension BusinessCardListDataPatterns on BusinessCardListData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessCardListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessCardListData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessCardListData value)  $default,){
final _that = this;
switch (_that) {
case _BusinessCardListData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessCardListData value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessCardListData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "items")  List<BusinessCardListItem>? items, @JsonKey(name: "meta")  PageMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessCardListData() when $default != null:
return $default(_that.items,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "items")  List<BusinessCardListItem>? items, @JsonKey(name: "meta")  PageMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _BusinessCardListData():
return $default(_that.items,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "items")  List<BusinessCardListItem>? items, @JsonKey(name: "meta")  PageMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _BusinessCardListData() when $default != null:
return $default(_that.items,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessCardListData implements BusinessCardListData {
  const _BusinessCardListData({@JsonKey(name: "items") final  List<BusinessCardListItem>? items, @JsonKey(name: "meta") this.meta}): _items = items;
  factory _BusinessCardListData.fromJson(Map<String, dynamic> json) => _$BusinessCardListDataFromJson(json);

 final  List<BusinessCardListItem>? _items;
@override@JsonKey(name: "items") List<BusinessCardListItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "meta") final  PageMeta? meta;

/// Create a copy of BusinessCardListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCardListDataCopyWith<_BusinessCardListData> get copyWith => __$BusinessCardListDataCopyWithImpl<_BusinessCardListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCardListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCardListData&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),meta);

@override
String toString() {
  return 'BusinessCardListData(items: $items, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$BusinessCardListDataCopyWith<$Res> implements $BusinessCardListDataCopyWith<$Res> {
  factory _$BusinessCardListDataCopyWith(_BusinessCardListData value, $Res Function(_BusinessCardListData) _then) = __$BusinessCardListDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "items") List<BusinessCardListItem>? items,@JsonKey(name: "meta") PageMeta? meta
});


@override $PageMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$BusinessCardListDataCopyWithImpl<$Res>
    implements _$BusinessCardListDataCopyWith<$Res> {
  __$BusinessCardListDataCopyWithImpl(this._self, this._then);

  final _BusinessCardListData _self;
  final $Res Function(_BusinessCardListData) _then;

/// Create a copy of BusinessCardListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = freezed,Object? meta = freezed,}) {
  return _then(_BusinessCardListData(
items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BusinessCardListItem>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PageMeta?,
  ));
}

/// Create a copy of BusinessCardListData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PageMetaCopyWith<$Res>? get meta {
    if (_self.meta == null) {
    return null;
  }

  return $PageMetaCopyWith<$Res>(_self.meta!, (value) {
    return _then(_self.copyWith(meta: value));
  });
}
}


/// @nodoc
mixin _$BusinessCardListItem {

@JsonKey(name: "id") int? get id;@JsonKey(name: "company_name") String? get companyName;@JsonKey(name: "sector") String? get sector;@JsonKey(name: "primary_contact") String? get primaryContact;@JsonKey(name: "phone") String? get phone;@JsonKey(name: "email") String? get email;@JsonKey(name: "thumbnail") String? get thumbnail;@JsonKey(name: "has_image") bool? get hasImage;@JsonKey(name: "created_at") String? get createdAt;
/// Create a copy of BusinessCardListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCardListItemCopyWith<BusinessCardListItem> get copyWith => _$BusinessCardListItemCopyWithImpl<BusinessCardListItem>(this as BusinessCardListItem, _$identity);

  /// Serializes this BusinessCardListItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCardListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.primaryContact, primaryContact) || other.primaryContact == primaryContact)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.hasImage, hasImage) || other.hasImage == hasImage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyName,sector,primaryContact,phone,email,thumbnail,hasImage,createdAt);

@override
String toString() {
  return 'BusinessCardListItem(id: $id, companyName: $companyName, sector: $sector, primaryContact: $primaryContact, phone: $phone, email: $email, thumbnail: $thumbnail, hasImage: $hasImage, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BusinessCardListItemCopyWith<$Res>  {
  factory $BusinessCardListItemCopyWith(BusinessCardListItem value, $Res Function(BusinessCardListItem) _then) = _$BusinessCardListItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "company_name") String? companyName,@JsonKey(name: "sector") String? sector,@JsonKey(name: "primary_contact") String? primaryContact,@JsonKey(name: "phone") String? phone,@JsonKey(name: "email") String? email,@JsonKey(name: "thumbnail") String? thumbnail,@JsonKey(name: "has_image") bool? hasImage,@JsonKey(name: "created_at") String? createdAt
});




}
/// @nodoc
class _$BusinessCardListItemCopyWithImpl<$Res>
    implements $BusinessCardListItemCopyWith<$Res> {
  _$BusinessCardListItemCopyWithImpl(this._self, this._then);

  final BusinessCardListItem _self;
  final $Res Function(BusinessCardListItem) _then;

/// Create a copy of BusinessCardListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? companyName = freezed,Object? sector = freezed,Object? primaryContact = freezed,Object? phone = freezed,Object? email = freezed,Object? thumbnail = freezed,Object? hasImage = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,sector: freezed == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String?,primaryContact: freezed == primaryContact ? _self.primaryContact : primaryContact // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,hasImage: freezed == hasImage ? _self.hasImage : hasImage // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessCardListItem].
extension BusinessCardListItemPatterns on BusinessCardListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessCardListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessCardListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessCardListItem value)  $default,){
final _that = this;
switch (_that) {
case _BusinessCardListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessCardListItem value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessCardListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "primary_contact")  String? primaryContact, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "email")  String? email, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "has_image")  bool? hasImage, @JsonKey(name: "created_at")  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessCardListItem() when $default != null:
return $default(_that.id,_that.companyName,_that.sector,_that.primaryContact,_that.phone,_that.email,_that.thumbnail,_that.hasImage,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "primary_contact")  String? primaryContact, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "email")  String? email, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "has_image")  bool? hasImage, @JsonKey(name: "created_at")  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _BusinessCardListItem():
return $default(_that.id,_that.companyName,_that.sector,_that.primaryContact,_that.phone,_that.email,_that.thumbnail,_that.hasImage,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "primary_contact")  String? primaryContact, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "email")  String? email, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "has_image")  bool? hasImage, @JsonKey(name: "created_at")  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BusinessCardListItem() when $default != null:
return $default(_that.id,_that.companyName,_that.sector,_that.primaryContact,_that.phone,_that.email,_that.thumbnail,_that.hasImage,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessCardListItem implements BusinessCardListItem {
  const _BusinessCardListItem({@JsonKey(name: "id") this.id, @JsonKey(name: "company_name") this.companyName, @JsonKey(name: "sector") this.sector, @JsonKey(name: "primary_contact") this.primaryContact, @JsonKey(name: "phone") this.phone, @JsonKey(name: "email") this.email, @JsonKey(name: "thumbnail") this.thumbnail, @JsonKey(name: "has_image") this.hasImage, @JsonKey(name: "created_at") this.createdAt});
  factory _BusinessCardListItem.fromJson(Map<String, dynamic> json) => _$BusinessCardListItemFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "company_name") final  String? companyName;
@override@JsonKey(name: "sector") final  String? sector;
@override@JsonKey(name: "primary_contact") final  String? primaryContact;
@override@JsonKey(name: "phone") final  String? phone;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "thumbnail") final  String? thumbnail;
@override@JsonKey(name: "has_image") final  bool? hasImage;
@override@JsonKey(name: "created_at") final  String? createdAt;

/// Create a copy of BusinessCardListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCardListItemCopyWith<_BusinessCardListItem> get copyWith => __$BusinessCardListItemCopyWithImpl<_BusinessCardListItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCardListItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCardListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.primaryContact, primaryContact) || other.primaryContact == primaryContact)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.hasImage, hasImage) || other.hasImage == hasImage)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,companyName,sector,primaryContact,phone,email,thumbnail,hasImage,createdAt);

@override
String toString() {
  return 'BusinessCardListItem(id: $id, companyName: $companyName, sector: $sector, primaryContact: $primaryContact, phone: $phone, email: $email, thumbnail: $thumbnail, hasImage: $hasImage, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BusinessCardListItemCopyWith<$Res> implements $BusinessCardListItemCopyWith<$Res> {
  factory _$BusinessCardListItemCopyWith(_BusinessCardListItem value, $Res Function(_BusinessCardListItem) _then) = __$BusinessCardListItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "company_name") String? companyName,@JsonKey(name: "sector") String? sector,@JsonKey(name: "primary_contact") String? primaryContact,@JsonKey(name: "phone") String? phone,@JsonKey(name: "email") String? email,@JsonKey(name: "thumbnail") String? thumbnail,@JsonKey(name: "has_image") bool? hasImage,@JsonKey(name: "created_at") String? createdAt
});




}
/// @nodoc
class __$BusinessCardListItemCopyWithImpl<$Res>
    implements _$BusinessCardListItemCopyWith<$Res> {
  __$BusinessCardListItemCopyWithImpl(this._self, this._then);

  final _BusinessCardListItem _self;
  final $Res Function(_BusinessCardListItem) _then;

/// Create a copy of BusinessCardListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? companyName = freezed,Object? sector = freezed,Object? primaryContact = freezed,Object? phone = freezed,Object? email = freezed,Object? thumbnail = freezed,Object? hasImage = freezed,Object? createdAt = freezed,}) {
  return _then(_BusinessCardListItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,sector: freezed == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String?,primaryContact: freezed == primaryContact ? _self.primaryContact : primaryContact // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,hasImage: freezed == hasImage ? _self.hasImage : hasImage // ignore: cast_nullable_to_non_nullable
as bool?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BusinessCardDetailResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") BusinessCardDetailData? get data;
/// Create a copy of BusinessCardDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCardDetailResponseCopyWith<BusinessCardDetailResponse> get copyWith => _$BusinessCardDetailResponseCopyWithImpl<BusinessCardDetailResponse>(this as BusinessCardDetailResponse, _$identity);

  /// Serializes this BusinessCardDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCardDetailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'BusinessCardDetailResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $BusinessCardDetailResponseCopyWith<$Res>  {
  factory $BusinessCardDetailResponseCopyWith(BusinessCardDetailResponse value, $Res Function(BusinessCardDetailResponse) _then) = _$BusinessCardDetailResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") BusinessCardDetailData? data
});


$BusinessCardDetailDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$BusinessCardDetailResponseCopyWithImpl<$Res>
    implements $BusinessCardDetailResponseCopyWith<$Res> {
  _$BusinessCardDetailResponseCopyWithImpl(this._self, this._then);

  final BusinessCardDetailResponse _self;
  final $Res Function(BusinessCardDetailResponse) _then;

/// Create a copy of BusinessCardDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BusinessCardDetailData?,
  ));
}
/// Create a copy of BusinessCardDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessCardDetailDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BusinessCardDetailDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [BusinessCardDetailResponse].
extension BusinessCardDetailResponsePatterns on BusinessCardDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessCardDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessCardDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessCardDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _BusinessCardDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessCardDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessCardDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  BusinessCardDetailData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessCardDetailResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  BusinessCardDetailData? data)  $default,) {final _that = this;
switch (_that) {
case _BusinessCardDetailResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  BusinessCardDetailData? data)?  $default,) {final _that = this;
switch (_that) {
case _BusinessCardDetailResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessCardDetailResponse implements BusinessCardDetailResponse {
  const _BusinessCardDetailResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _BusinessCardDetailResponse.fromJson(Map<String, dynamic> json) => _$BusinessCardDetailResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  BusinessCardDetailData? data;

/// Create a copy of BusinessCardDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCardDetailResponseCopyWith<_BusinessCardDetailResponse> get copyWith => __$BusinessCardDetailResponseCopyWithImpl<_BusinessCardDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCardDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCardDetailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'BusinessCardDetailResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BusinessCardDetailResponseCopyWith<$Res> implements $BusinessCardDetailResponseCopyWith<$Res> {
  factory _$BusinessCardDetailResponseCopyWith(_BusinessCardDetailResponse value, $Res Function(_BusinessCardDetailResponse) _then) = __$BusinessCardDetailResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") BusinessCardDetailData? data
});


@override $BusinessCardDetailDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$BusinessCardDetailResponseCopyWithImpl<$Res>
    implements _$BusinessCardDetailResponseCopyWith<$Res> {
  __$BusinessCardDetailResponseCopyWithImpl(this._self, this._then);

  final _BusinessCardDetailResponse _self;
  final $Res Function(_BusinessCardDetailResponse) _then;

/// Create a copy of BusinessCardDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_BusinessCardDetailResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BusinessCardDetailData?,
  ));
}

/// Create a copy of BusinessCardDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BusinessCardDetailDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BusinessCardDetailDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$BusinessCardDetailData {

@JsonKey(name: "id") int? get id;@JsonKey(name: "user_id") int? get userId;@JsonKey(name: "company_name") String? get companyName;@JsonKey(name: "name_surname") List<String>? get nameSurname;@JsonKey(name: "unvan") List<String>? get unvan;@JsonKey(name: "email_list") List<String>? get emailList;@JsonKey(name: "phone_list") List<String>? get phoneList;@JsonKey(name: "email") String? get email;@JsonKey(name: "phone") String? get phone;@JsonKey(name: "website") String? get website;@JsonKey(name: "address") String? get address;@JsonKey(name: "sector") String? get sector;@JsonKey(name: "country_id") int? get countryId;@JsonKey(name: "country") String? get country;@JsonKey(name: "notes") List<BusinessCardNote>? get notes;@JsonKey(name: "cards") List<BusinessCardImage>? get cards;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "updated_at") String? get updatedAt;
/// Create a copy of BusinessCardDetailData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCardDetailDataCopyWith<BusinessCardDetailData> get copyWith => _$BusinessCardDetailDataCopyWithImpl<BusinessCardDetailData>(this as BusinessCardDetailData, _$identity);

  /// Serializes this BusinessCardDetailData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCardDetailData&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&const DeepCollectionEquality().equals(other.nameSurname, nameSurname)&&const DeepCollectionEquality().equals(other.unvan, unvan)&&const DeepCollectionEquality().equals(other.emailList, emailList)&&const DeepCollectionEquality().equals(other.phoneList, phoneList)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other.notes, notes)&&const DeepCollectionEquality().equals(other.cards, cards)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,companyName,const DeepCollectionEquality().hash(nameSurname),const DeepCollectionEquality().hash(unvan),const DeepCollectionEquality().hash(emailList),const DeepCollectionEquality().hash(phoneList),email,phone,website,address,sector,countryId,country,const DeepCollectionEquality().hash(notes),const DeepCollectionEquality().hash(cards),createdAt,updatedAt);

@override
String toString() {
  return 'BusinessCardDetailData(id: $id, userId: $userId, companyName: $companyName, nameSurname: $nameSurname, unvan: $unvan, emailList: $emailList, phoneList: $phoneList, email: $email, phone: $phone, website: $website, address: $address, sector: $sector, countryId: $countryId, country: $country, notes: $notes, cards: $cards, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BusinessCardDetailDataCopyWith<$Res>  {
  factory $BusinessCardDetailDataCopyWith(BusinessCardDetailData value, $Res Function(BusinessCardDetailData) _then) = _$BusinessCardDetailDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "user_id") int? userId,@JsonKey(name: "company_name") String? companyName,@JsonKey(name: "name_surname") List<String>? nameSurname,@JsonKey(name: "unvan") List<String>? unvan,@JsonKey(name: "email_list") List<String>? emailList,@JsonKey(name: "phone_list") List<String>? phoneList,@JsonKey(name: "email") String? email,@JsonKey(name: "phone") String? phone,@JsonKey(name: "website") String? website,@JsonKey(name: "address") String? address,@JsonKey(name: "sector") String? sector,@JsonKey(name: "country_id") int? countryId,@JsonKey(name: "country") String? country,@JsonKey(name: "notes") List<BusinessCardNote>? notes,@JsonKey(name: "cards") List<BusinessCardImage>? cards,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});




}
/// @nodoc
class _$BusinessCardDetailDataCopyWithImpl<$Res>
    implements $BusinessCardDetailDataCopyWith<$Res> {
  _$BusinessCardDetailDataCopyWithImpl(this._self, this._then);

  final BusinessCardDetailData _self;
  final $Res Function(BusinessCardDetailData) _then;

/// Create a copy of BusinessCardDetailData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? companyName = freezed,Object? nameSurname = freezed,Object? unvan = freezed,Object? emailList = freezed,Object? phoneList = freezed,Object? email = freezed,Object? phone = freezed,Object? website = freezed,Object? address = freezed,Object? sector = freezed,Object? countryId = freezed,Object? country = freezed,Object? notes = freezed,Object? cards = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,nameSurname: freezed == nameSurname ? _self.nameSurname : nameSurname // ignore: cast_nullable_to_non_nullable
as List<String>?,unvan: freezed == unvan ? _self.unvan : unvan // ignore: cast_nullable_to_non_nullable
as List<String>?,emailList: freezed == emailList ? _self.emailList : emailList // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneList: freezed == phoneList ? _self.phoneList : phoneList // ignore: cast_nullable_to_non_nullable
as List<String>?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,sector: freezed == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as List<BusinessCardNote>?,cards: freezed == cards ? _self.cards : cards // ignore: cast_nullable_to_non_nullable
as List<BusinessCardImage>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessCardDetailData].
extension BusinessCardDetailDataPatterns on BusinessCardDetailData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessCardDetailData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessCardDetailData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessCardDetailData value)  $default,){
final _that = this;
switch (_that) {
case _BusinessCardDetailData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessCardDetailData value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessCardDetailData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "user_id")  int? userId, @JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "name_surname")  List<String>? nameSurname, @JsonKey(name: "unvan")  List<String>? unvan, @JsonKey(name: "email_list")  List<String>? emailList, @JsonKey(name: "phone_list")  List<String>? phoneList, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "website")  String? website, @JsonKey(name: "address")  String? address, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "country_id")  int? countryId, @JsonKey(name: "country")  String? country, @JsonKey(name: "notes")  List<BusinessCardNote>? notes, @JsonKey(name: "cards")  List<BusinessCardImage>? cards, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessCardDetailData() when $default != null:
return $default(_that.id,_that.userId,_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.email,_that.phone,_that.website,_that.address,_that.sector,_that.countryId,_that.country,_that.notes,_that.cards,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "user_id")  int? userId, @JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "name_surname")  List<String>? nameSurname, @JsonKey(name: "unvan")  List<String>? unvan, @JsonKey(name: "email_list")  List<String>? emailList, @JsonKey(name: "phone_list")  List<String>? phoneList, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "website")  String? website, @JsonKey(name: "address")  String? address, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "country_id")  int? countryId, @JsonKey(name: "country")  String? country, @JsonKey(name: "notes")  List<BusinessCardNote>? notes, @JsonKey(name: "cards")  List<BusinessCardImage>? cards, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BusinessCardDetailData():
return $default(_that.id,_that.userId,_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.email,_that.phone,_that.website,_that.address,_that.sector,_that.countryId,_that.country,_that.notes,_that.cards,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "user_id")  int? userId, @JsonKey(name: "company_name")  String? companyName, @JsonKey(name: "name_surname")  List<String>? nameSurname, @JsonKey(name: "unvan")  List<String>? unvan, @JsonKey(name: "email_list")  List<String>? emailList, @JsonKey(name: "phone_list")  List<String>? phoneList, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "website")  String? website, @JsonKey(name: "address")  String? address, @JsonKey(name: "sector")  String? sector, @JsonKey(name: "country_id")  int? countryId, @JsonKey(name: "country")  String? country, @JsonKey(name: "notes")  List<BusinessCardNote>? notes, @JsonKey(name: "cards")  List<BusinessCardImage>? cards, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BusinessCardDetailData() when $default != null:
return $default(_that.id,_that.userId,_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.email,_that.phone,_that.website,_that.address,_that.sector,_that.countryId,_that.country,_that.notes,_that.cards,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessCardDetailData implements BusinessCardDetailData {
  const _BusinessCardDetailData({@JsonKey(name: "id") this.id, @JsonKey(name: "user_id") this.userId, @JsonKey(name: "company_name") this.companyName, @JsonKey(name: "name_surname") final  List<String>? nameSurname, @JsonKey(name: "unvan") final  List<String>? unvan, @JsonKey(name: "email_list") final  List<String>? emailList, @JsonKey(name: "phone_list") final  List<String>? phoneList, @JsonKey(name: "email") this.email, @JsonKey(name: "phone") this.phone, @JsonKey(name: "website") this.website, @JsonKey(name: "address") this.address, @JsonKey(name: "sector") this.sector, @JsonKey(name: "country_id") this.countryId, @JsonKey(name: "country") this.country, @JsonKey(name: "notes") final  List<BusinessCardNote>? notes, @JsonKey(name: "cards") final  List<BusinessCardImage>? cards, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt}): _nameSurname = nameSurname,_unvan = unvan,_emailList = emailList,_phoneList = phoneList,_notes = notes,_cards = cards;
  factory _BusinessCardDetailData.fromJson(Map<String, dynamic> json) => _$BusinessCardDetailDataFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "user_id") final  int? userId;
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

 final  List<String>? _phoneList;
@override@JsonKey(name: "phone_list") List<String>? get phoneList {
  final value = _phoneList;
  if (value == null) return null;
  if (_phoneList is EqualUnmodifiableListView) return _phoneList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "phone") final  String? phone;
@override@JsonKey(name: "website") final  String? website;
@override@JsonKey(name: "address") final  String? address;
@override@JsonKey(name: "sector") final  String? sector;
@override@JsonKey(name: "country_id") final  int? countryId;
@override@JsonKey(name: "country") final  String? country;
 final  List<BusinessCardNote>? _notes;
@override@JsonKey(name: "notes") List<BusinessCardNote>? get notes {
  final value = _notes;
  if (value == null) return null;
  if (_notes is EqualUnmodifiableListView) return _notes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<BusinessCardImage>? _cards;
@override@JsonKey(name: "cards") List<BusinessCardImage>? get cards {
  final value = _cards;
  if (value == null) return null;
  if (_cards is EqualUnmodifiableListView) return _cards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "updated_at") final  String? updatedAt;

/// Create a copy of BusinessCardDetailData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCardDetailDataCopyWith<_BusinessCardDetailData> get copyWith => __$BusinessCardDetailDataCopyWithImpl<_BusinessCardDetailData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCardDetailDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCardDetailData&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&const DeepCollectionEquality().equals(other._nameSurname, _nameSurname)&&const DeepCollectionEquality().equals(other._unvan, _unvan)&&const DeepCollectionEquality().equals(other._emailList, _emailList)&&const DeepCollectionEquality().equals(other._phoneList, _phoneList)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other._notes, _notes)&&const DeepCollectionEquality().equals(other._cards, _cards)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,companyName,const DeepCollectionEquality().hash(_nameSurname),const DeepCollectionEquality().hash(_unvan),const DeepCollectionEquality().hash(_emailList),const DeepCollectionEquality().hash(_phoneList),email,phone,website,address,sector,countryId,country,const DeepCollectionEquality().hash(_notes),const DeepCollectionEquality().hash(_cards),createdAt,updatedAt);

@override
String toString() {
  return 'BusinessCardDetailData(id: $id, userId: $userId, companyName: $companyName, nameSurname: $nameSurname, unvan: $unvan, emailList: $emailList, phoneList: $phoneList, email: $email, phone: $phone, website: $website, address: $address, sector: $sector, countryId: $countryId, country: $country, notes: $notes, cards: $cards, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BusinessCardDetailDataCopyWith<$Res> implements $BusinessCardDetailDataCopyWith<$Res> {
  factory _$BusinessCardDetailDataCopyWith(_BusinessCardDetailData value, $Res Function(_BusinessCardDetailData) _then) = __$BusinessCardDetailDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "user_id") int? userId,@JsonKey(name: "company_name") String? companyName,@JsonKey(name: "name_surname") List<String>? nameSurname,@JsonKey(name: "unvan") List<String>? unvan,@JsonKey(name: "email_list") List<String>? emailList,@JsonKey(name: "phone_list") List<String>? phoneList,@JsonKey(name: "email") String? email,@JsonKey(name: "phone") String? phone,@JsonKey(name: "website") String? website,@JsonKey(name: "address") String? address,@JsonKey(name: "sector") String? sector,@JsonKey(name: "country_id") int? countryId,@JsonKey(name: "country") String? country,@JsonKey(name: "notes") List<BusinessCardNote>? notes,@JsonKey(name: "cards") List<BusinessCardImage>? cards,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});




}
/// @nodoc
class __$BusinessCardDetailDataCopyWithImpl<$Res>
    implements _$BusinessCardDetailDataCopyWith<$Res> {
  __$BusinessCardDetailDataCopyWithImpl(this._self, this._then);

  final _BusinessCardDetailData _self;
  final $Res Function(_BusinessCardDetailData) _then;

/// Create a copy of BusinessCardDetailData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? companyName = freezed,Object? nameSurname = freezed,Object? unvan = freezed,Object? emailList = freezed,Object? phoneList = freezed,Object? email = freezed,Object? phone = freezed,Object? website = freezed,Object? address = freezed,Object? sector = freezed,Object? countryId = freezed,Object? country = freezed,Object? notes = freezed,Object? cards = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BusinessCardDetailData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,companyName: freezed == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String?,nameSurname: freezed == nameSurname ? _self._nameSurname : nameSurname // ignore: cast_nullable_to_non_nullable
as List<String>?,unvan: freezed == unvan ? _self._unvan : unvan // ignore: cast_nullable_to_non_nullable
as List<String>?,emailList: freezed == emailList ? _self._emailList : emailList // ignore: cast_nullable_to_non_nullable
as List<String>?,phoneList: freezed == phoneList ? _self._phoneList : phoneList // ignore: cast_nullable_to_non_nullable
as List<String>?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,sector: freezed == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String?,countryId: freezed == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self._notes : notes // ignore: cast_nullable_to_non_nullable
as List<BusinessCardNote>?,cards: freezed == cards ? _self._cards : cards // ignore: cast_nullable_to_non_nullable
as List<BusinessCardImage>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BusinessCardImage {

@JsonKey(name: "id") int? get id;@JsonKey(name: "url") String? get url;@JsonKey(name: "thumbnail") String? get thumbnail;@JsonKey(name: "preview") String? get preview;@JsonKey(name: "file_name") String? get fileName;@JsonKey(name: "mime_type") String? get mimeType;@JsonKey(name: "size") int? get size;
/// Create a copy of BusinessCardImage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCardImageCopyWith<BusinessCardImage> get copyWith => _$BusinessCardImageCopyWithImpl<BusinessCardImage>(this as BusinessCardImage, _$identity);

  /// Serializes this BusinessCardImage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCardImage&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,thumbnail,preview,fileName,mimeType,size);

@override
String toString() {
  return 'BusinessCardImage(id: $id, url: $url, thumbnail: $thumbnail, preview: $preview, fileName: $fileName, mimeType: $mimeType, size: $size)';
}


}

/// @nodoc
abstract mixin class $BusinessCardImageCopyWith<$Res>  {
  factory $BusinessCardImageCopyWith(BusinessCardImage value, $Res Function(BusinessCardImage) _then) = _$BusinessCardImageCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "url") String? url,@JsonKey(name: "thumbnail") String? thumbnail,@JsonKey(name: "preview") String? preview,@JsonKey(name: "file_name") String? fileName,@JsonKey(name: "mime_type") String? mimeType,@JsonKey(name: "size") int? size
});




}
/// @nodoc
class _$BusinessCardImageCopyWithImpl<$Res>
    implements $BusinessCardImageCopyWith<$Res> {
  _$BusinessCardImageCopyWithImpl(this._self, this._then);

  final BusinessCardImage _self;
  final $Res Function(BusinessCardImage) _then;

/// Create a copy of BusinessCardImage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? url = freezed,Object? thumbnail = freezed,Object? preview = freezed,Object? fileName = freezed,Object? mimeType = freezed,Object? size = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessCardImage].
extension BusinessCardImagePatterns on BusinessCardImage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessCardImage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessCardImage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessCardImage value)  $default,){
final _that = this;
switch (_that) {
case _BusinessCardImage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessCardImage value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessCardImage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview, @JsonKey(name: "file_name")  String? fileName, @JsonKey(name: "mime_type")  String? mimeType, @JsonKey(name: "size")  int? size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessCardImage() when $default != null:
return $default(_that.id,_that.url,_that.thumbnail,_that.preview,_that.fileName,_that.mimeType,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview, @JsonKey(name: "file_name")  String? fileName, @JsonKey(name: "mime_type")  String? mimeType, @JsonKey(name: "size")  int? size)  $default,) {final _that = this;
switch (_that) {
case _BusinessCardImage():
return $default(_that.id,_that.url,_that.thumbnail,_that.preview,_that.fileName,_that.mimeType,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview, @JsonKey(name: "file_name")  String? fileName, @JsonKey(name: "mime_type")  String? mimeType, @JsonKey(name: "size")  int? size)?  $default,) {final _that = this;
switch (_that) {
case _BusinessCardImage() when $default != null:
return $default(_that.id,_that.url,_that.thumbnail,_that.preview,_that.fileName,_that.mimeType,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessCardImage implements BusinessCardImage {
  const _BusinessCardImage({@JsonKey(name: "id") this.id, @JsonKey(name: "url") this.url, @JsonKey(name: "thumbnail") this.thumbnail, @JsonKey(name: "preview") this.preview, @JsonKey(name: "file_name") this.fileName, @JsonKey(name: "mime_type") this.mimeType, @JsonKey(name: "size") this.size});
  factory _BusinessCardImage.fromJson(Map<String, dynamic> json) => _$BusinessCardImageFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "url") final  String? url;
@override@JsonKey(name: "thumbnail") final  String? thumbnail;
@override@JsonKey(name: "preview") final  String? preview;
@override@JsonKey(name: "file_name") final  String? fileName;
@override@JsonKey(name: "mime_type") final  String? mimeType;
@override@JsonKey(name: "size") final  int? size;

/// Create a copy of BusinessCardImage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCardImageCopyWith<_BusinessCardImage> get copyWith => __$BusinessCardImageCopyWithImpl<_BusinessCardImage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCardImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCardImage&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,thumbnail,preview,fileName,mimeType,size);

@override
String toString() {
  return 'BusinessCardImage(id: $id, url: $url, thumbnail: $thumbnail, preview: $preview, fileName: $fileName, mimeType: $mimeType, size: $size)';
}


}

/// @nodoc
abstract mixin class _$BusinessCardImageCopyWith<$Res> implements $BusinessCardImageCopyWith<$Res> {
  factory _$BusinessCardImageCopyWith(_BusinessCardImage value, $Res Function(_BusinessCardImage) _then) = __$BusinessCardImageCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "url") String? url,@JsonKey(name: "thumbnail") String? thumbnail,@JsonKey(name: "preview") String? preview,@JsonKey(name: "file_name") String? fileName,@JsonKey(name: "mime_type") String? mimeType,@JsonKey(name: "size") int? size
});




}
/// @nodoc
class __$BusinessCardImageCopyWithImpl<$Res>
    implements _$BusinessCardImageCopyWith<$Res> {
  __$BusinessCardImageCopyWithImpl(this._self, this._then);

  final _BusinessCardImage _self;
  final $Res Function(_BusinessCardImage) _then;

/// Create a copy of BusinessCardImage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? url = freezed,Object? thumbnail = freezed,Object? preview = freezed,Object? fileName = freezed,Object? mimeType = freezed,Object? size = freezed,}) {
  return _then(_BusinessCardImage(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,fileName: freezed == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$BusinessCardNote {

@JsonKey(name: "id") int? get id;@JsonKey(name: "tenant_id") int? get tenantId;@JsonKey(name: "business_card_id") int? get businessCardId;@JsonKey(name: "note") String? get note;@JsonKey(name: "created_at") String? get createdAt;@JsonKey(name: "updated_at") String? get updatedAt;
/// Create a copy of BusinessCardNote
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BusinessCardNoteCopyWith<BusinessCardNote> get copyWith => _$BusinessCardNoteCopyWithImpl<BusinessCardNote>(this as BusinessCardNote, _$identity);

  /// Serializes this BusinessCardNote to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusinessCardNote&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessCardId, businessCardId) || other.businessCardId == businessCardId)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantId,businessCardId,note,createdAt,updatedAt);

@override
String toString() {
  return 'BusinessCardNote(id: $id, tenantId: $tenantId, businessCardId: $businessCardId, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $BusinessCardNoteCopyWith<$Res>  {
  factory $BusinessCardNoteCopyWith(BusinessCardNote value, $Res Function(BusinessCardNote) _then) = _$BusinessCardNoteCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "tenant_id") int? tenantId,@JsonKey(name: "business_card_id") int? businessCardId,@JsonKey(name: "note") String? note,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});




}
/// @nodoc
class _$BusinessCardNoteCopyWithImpl<$Res>
    implements $BusinessCardNoteCopyWith<$Res> {
  _$BusinessCardNoteCopyWithImpl(this._self, this._then);

  final BusinessCardNote _self;
  final $Res Function(BusinessCardNote) _then;

/// Create a copy of BusinessCardNote
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? tenantId = freezed,Object? businessCardId = freezed,Object? note = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int?,businessCardId: freezed == businessCardId ? _self.businessCardId : businessCardId // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BusinessCardNote].
extension BusinessCardNotePatterns on BusinessCardNote {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BusinessCardNote value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BusinessCardNote() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BusinessCardNote value)  $default,){
final _that = this;
switch (_that) {
case _BusinessCardNote():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BusinessCardNote value)?  $default,){
final _that = this;
switch (_that) {
case _BusinessCardNote() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "tenant_id")  int? tenantId, @JsonKey(name: "business_card_id")  int? businessCardId, @JsonKey(name: "note")  String? note, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BusinessCardNote() when $default != null:
return $default(_that.id,_that.tenantId,_that.businessCardId,_that.note,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "tenant_id")  int? tenantId, @JsonKey(name: "business_card_id")  int? businessCardId, @JsonKey(name: "note")  String? note, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _BusinessCardNote():
return $default(_that.id,_that.tenantId,_that.businessCardId,_that.note,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "tenant_id")  int? tenantId, @JsonKey(name: "business_card_id")  int? businessCardId, @JsonKey(name: "note")  String? note, @JsonKey(name: "created_at")  String? createdAt, @JsonKey(name: "updated_at")  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _BusinessCardNote() when $default != null:
return $default(_that.id,_that.tenantId,_that.businessCardId,_that.note,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BusinessCardNote implements BusinessCardNote {
  const _BusinessCardNote({@JsonKey(name: "id") this.id, @JsonKey(name: "tenant_id") this.tenantId, @JsonKey(name: "business_card_id") this.businessCardId, @JsonKey(name: "note") this.note, @JsonKey(name: "created_at") this.createdAt, @JsonKey(name: "updated_at") this.updatedAt});
  factory _BusinessCardNote.fromJson(Map<String, dynamic> json) => _$BusinessCardNoteFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "tenant_id") final  int? tenantId;
@override@JsonKey(name: "business_card_id") final  int? businessCardId;
@override@JsonKey(name: "note") final  String? note;
@override@JsonKey(name: "created_at") final  String? createdAt;
@override@JsonKey(name: "updated_at") final  String? updatedAt;

/// Create a copy of BusinessCardNote
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BusinessCardNoteCopyWith<_BusinessCardNote> get copyWith => __$BusinessCardNoteCopyWithImpl<_BusinessCardNote>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BusinessCardNoteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BusinessCardNote&&(identical(other.id, id) || other.id == id)&&(identical(other.tenantId, tenantId) || other.tenantId == tenantId)&&(identical(other.businessCardId, businessCardId) || other.businessCardId == businessCardId)&&(identical(other.note, note) || other.note == note)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tenantId,businessCardId,note,createdAt,updatedAt);

@override
String toString() {
  return 'BusinessCardNote(id: $id, tenantId: $tenantId, businessCardId: $businessCardId, note: $note, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$BusinessCardNoteCopyWith<$Res> implements $BusinessCardNoteCopyWith<$Res> {
  factory _$BusinessCardNoteCopyWith(_BusinessCardNote value, $Res Function(_BusinessCardNote) _then) = __$BusinessCardNoteCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "tenant_id") int? tenantId,@JsonKey(name: "business_card_id") int? businessCardId,@JsonKey(name: "note") String? note,@JsonKey(name: "created_at") String? createdAt,@JsonKey(name: "updated_at") String? updatedAt
});




}
/// @nodoc
class __$BusinessCardNoteCopyWithImpl<$Res>
    implements _$BusinessCardNoteCopyWith<$Res> {
  __$BusinessCardNoteCopyWithImpl(this._self, this._then);

  final _BusinessCardNote _self;
  final $Res Function(_BusinessCardNote) _then;

/// Create a copy of BusinessCardNote
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? tenantId = freezed,Object? businessCardId = freezed,Object? note = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_BusinessCardNote(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,tenantId: freezed == tenantId ? _self.tenantId : tenantId // ignore: cast_nullable_to_non_nullable
as int?,businessCardId: freezed == businessCardId ? _self.businessCardId : businessCardId // ignore: cast_nullable_to_non_nullable
as int?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
