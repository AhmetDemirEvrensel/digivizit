// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppointmentListResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") AppointmentListData? get data;
/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentListResponseCopyWith<AppointmentListResponse> get copyWith => _$AppointmentListResponseCopyWithImpl<AppointmentListResponse>(this as AppointmentListResponse, _$identity);

  /// Serializes this AppointmentListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'AppointmentListResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $AppointmentListResponseCopyWith<$Res>  {
  factory $AppointmentListResponseCopyWith(AppointmentListResponse value, $Res Function(AppointmentListResponse) _then) = _$AppointmentListResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") AppointmentListData? data
});


$AppointmentListDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$AppointmentListResponseCopyWithImpl<$Res>
    implements $AppointmentListResponseCopyWith<$Res> {
  _$AppointmentListResponseCopyWithImpl(this._self, this._then);

  final AppointmentListResponse _self;
  final $Res Function(AppointmentListResponse) _then;

/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppointmentListData?,
  ));
}
/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentListDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AppointmentListDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppointmentListResponse].
extension AppointmentListResponsePatterns on AppointmentListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentListResponse value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  AppointmentListData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  AppointmentListData? data)  $default,) {final _that = this;
switch (_that) {
case _AppointmentListResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  AppointmentListData? data)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentListResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentListResponse implements AppointmentListResponse {
  const _AppointmentListResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _AppointmentListResponse.fromJson(Map<String, dynamic> json) => _$AppointmentListResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  AppointmentListData? data;

/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentListResponseCopyWith<_AppointmentListResponse> get copyWith => __$AppointmentListResponseCopyWithImpl<_AppointmentListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentListResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'AppointmentListResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AppointmentListResponseCopyWith<$Res> implements $AppointmentListResponseCopyWith<$Res> {
  factory _$AppointmentListResponseCopyWith(_AppointmentListResponse value, $Res Function(_AppointmentListResponse) _then) = __$AppointmentListResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") AppointmentListData? data
});


@override $AppointmentListDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$AppointmentListResponseCopyWithImpl<$Res>
    implements _$AppointmentListResponseCopyWith<$Res> {
  __$AppointmentListResponseCopyWithImpl(this._self, this._then);

  final _AppointmentListResponse _self;
  final $Res Function(_AppointmentListResponse) _then;

/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_AppointmentListResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppointmentListData?,
  ));
}

/// Create a copy of AppointmentListResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentListDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AppointmentListDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$AppointmentListData {

@JsonKey(name: "items") List<AppointmentListItem>? get items;@JsonKey(name: "meta") PageMeta? get meta;
/// Create a copy of AppointmentListData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentListDataCopyWith<AppointmentListData> get copyWith => _$AppointmentListDataCopyWithImpl<AppointmentListData>(this as AppointmentListData, _$identity);

  /// Serializes this AppointmentListData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentListData&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),meta);

@override
String toString() {
  return 'AppointmentListData(items: $items, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $AppointmentListDataCopyWith<$Res>  {
  factory $AppointmentListDataCopyWith(AppointmentListData value, $Res Function(AppointmentListData) _then) = _$AppointmentListDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "items") List<AppointmentListItem>? items,@JsonKey(name: "meta") PageMeta? meta
});


$PageMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class _$AppointmentListDataCopyWithImpl<$Res>
    implements $AppointmentListDataCopyWith<$Res> {
  _$AppointmentListDataCopyWithImpl(this._self, this._then);

  final AppointmentListData _self;
  final $Res Function(AppointmentListData) _then;

/// Create a copy of AppointmentListData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
items: freezed == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<AppointmentListItem>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PageMeta?,
  ));
}
/// Create a copy of AppointmentListData
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


/// Adds pattern-matching-related methods to [AppointmentListData].
extension AppointmentListDataPatterns on AppointmentListData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentListData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentListData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentListData value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentListData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentListData value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentListData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "items")  List<AppointmentListItem>? items, @JsonKey(name: "meta")  PageMeta? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentListData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "items")  List<AppointmentListItem>? items, @JsonKey(name: "meta")  PageMeta? meta)  $default,) {final _that = this;
switch (_that) {
case _AppointmentListData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "items")  List<AppointmentListItem>? items, @JsonKey(name: "meta")  PageMeta? meta)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentListData() when $default != null:
return $default(_that.items,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentListData implements AppointmentListData {
  const _AppointmentListData({@JsonKey(name: "items") final  List<AppointmentListItem>? items, @JsonKey(name: "meta") this.meta}): _items = items;
  factory _AppointmentListData.fromJson(Map<String, dynamic> json) => _$AppointmentListDataFromJson(json);

 final  List<AppointmentListItem>? _items;
@override@JsonKey(name: "items") List<AppointmentListItem>? get items {
  final value = _items;
  if (value == null) return null;
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: "meta") final  PageMeta? meta;

/// Create a copy of AppointmentListData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentListDataCopyWith<_AppointmentListData> get copyWith => __$AppointmentListDataCopyWithImpl<_AppointmentListData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentListDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentListData&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.meta, meta) || other.meta == meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),meta);

@override
String toString() {
  return 'AppointmentListData(items: $items, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$AppointmentListDataCopyWith<$Res> implements $AppointmentListDataCopyWith<$Res> {
  factory _$AppointmentListDataCopyWith(_AppointmentListData value, $Res Function(_AppointmentListData) _then) = __$AppointmentListDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "items") List<AppointmentListItem>? items,@JsonKey(name: "meta") PageMeta? meta
});


@override $PageMetaCopyWith<$Res>? get meta;

}
/// @nodoc
class __$AppointmentListDataCopyWithImpl<$Res>
    implements _$AppointmentListDataCopyWith<$Res> {
  __$AppointmentListDataCopyWithImpl(this._self, this._then);

  final _AppointmentListData _self;
  final $Res Function(_AppointmentListData) _then;

/// Create a copy of AppointmentListData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = freezed,Object? meta = freezed,}) {
  return _then(_AppointmentListData(
items: freezed == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<AppointmentListItem>?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as PageMeta?,
  ));
}

/// Create a copy of AppointmentListData
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
mixin _$AppointmentListItem {

@JsonKey(name: "id") int? get id;@JsonKey(name: "full_name") String? get fullName;@JsonKey(name: "email") String? get email;@JsonKey(name: "phone") String? get phone;@JsonKey(name: "company") String? get company;@JsonKey(name: "subject") String? get subject;@JsonKey(name: "note") String? get note;@JsonKey(name: "preferred_date") String? get preferredDate;@JsonKey(name: "status") String? get status;@JsonKey(name: "status_label") String? get statusLabel;@JsonKey(name: "created_at") String? get createdAt;
/// Create a copy of AppointmentListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentListItemCopyWith<AppointmentListItem> get copyWith => _$AppointmentListItemCopyWithImpl<AppointmentListItem>(this as AppointmentListItem, _$identity);

  /// Serializes this AppointmentListItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.company, company) || other.company == company)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.note, note) || other.note == note)&&(identical(other.preferredDate, preferredDate) || other.preferredDate == preferredDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,phone,company,subject,note,preferredDate,status,statusLabel,createdAt);

@override
String toString() {
  return 'AppointmentListItem(id: $id, fullName: $fullName, email: $email, phone: $phone, company: $company, subject: $subject, note: $note, preferredDate: $preferredDate, status: $status, statusLabel: $statusLabel, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AppointmentListItemCopyWith<$Res>  {
  factory $AppointmentListItemCopyWith(AppointmentListItem value, $Res Function(AppointmentListItem) _then) = _$AppointmentListItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "full_name") String? fullName,@JsonKey(name: "email") String? email,@JsonKey(name: "phone") String? phone,@JsonKey(name: "company") String? company,@JsonKey(name: "subject") String? subject,@JsonKey(name: "note") String? note,@JsonKey(name: "preferred_date") String? preferredDate,@JsonKey(name: "status") String? status,@JsonKey(name: "status_label") String? statusLabel,@JsonKey(name: "created_at") String? createdAt
});




}
/// @nodoc
class _$AppointmentListItemCopyWithImpl<$Res>
    implements $AppointmentListItemCopyWith<$Res> {
  _$AppointmentListItemCopyWithImpl(this._self, this._then);

  final AppointmentListItem _self;
  final $Res Function(AppointmentListItem) _then;

/// Create a copy of AppointmentListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? fullName = freezed,Object? email = freezed,Object? phone = freezed,Object? company = freezed,Object? subject = freezed,Object? note = freezed,Object? preferredDate = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,preferredDate: freezed == preferredDate ? _self.preferredDate : preferredDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentListItem].
extension AppointmentListItemPatterns on AppointmentListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentListItem value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentListItem value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "company")  String? company, @JsonKey(name: "subject")  String? subject, @JsonKey(name: "note")  String? note, @JsonKey(name: "preferred_date")  String? preferredDate, @JsonKey(name: "status")  String? status, @JsonKey(name: "status_label")  String? statusLabel, @JsonKey(name: "created_at")  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentListItem() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.company,_that.subject,_that.note,_that.preferredDate,_that.status,_that.statusLabel,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "company")  String? company, @JsonKey(name: "subject")  String? subject, @JsonKey(name: "note")  String? note, @JsonKey(name: "preferred_date")  String? preferredDate, @JsonKey(name: "status")  String? status, @JsonKey(name: "status_label")  String? statusLabel, @JsonKey(name: "created_at")  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _AppointmentListItem():
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.company,_that.subject,_that.note,_that.preferredDate,_that.status,_that.statusLabel,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "company")  String? company, @JsonKey(name: "subject")  String? subject, @JsonKey(name: "note")  String? note, @JsonKey(name: "preferred_date")  String? preferredDate, @JsonKey(name: "status")  String? status, @JsonKey(name: "status_label")  String? statusLabel, @JsonKey(name: "created_at")  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentListItem() when $default != null:
return $default(_that.id,_that.fullName,_that.email,_that.phone,_that.company,_that.subject,_that.note,_that.preferredDate,_that.status,_that.statusLabel,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentListItem implements AppointmentListItem {
  const _AppointmentListItem({@JsonKey(name: "id") this.id, @JsonKey(name: "full_name") this.fullName, @JsonKey(name: "email") this.email, @JsonKey(name: "phone") this.phone, @JsonKey(name: "company") this.company, @JsonKey(name: "subject") this.subject, @JsonKey(name: "note") this.note, @JsonKey(name: "preferred_date") this.preferredDate, @JsonKey(name: "status") this.status, @JsonKey(name: "status_label") this.statusLabel, @JsonKey(name: "created_at") this.createdAt});
  factory _AppointmentListItem.fromJson(Map<String, dynamic> json) => _$AppointmentListItemFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "full_name") final  String? fullName;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "phone") final  String? phone;
@override@JsonKey(name: "company") final  String? company;
@override@JsonKey(name: "subject") final  String? subject;
@override@JsonKey(name: "note") final  String? note;
@override@JsonKey(name: "preferred_date") final  String? preferredDate;
@override@JsonKey(name: "status") final  String? status;
@override@JsonKey(name: "status_label") final  String? statusLabel;
@override@JsonKey(name: "created_at") final  String? createdAt;

/// Create a copy of AppointmentListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentListItemCopyWith<_AppointmentListItem> get copyWith => __$AppointmentListItemCopyWithImpl<_AppointmentListItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentListItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentListItem&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.company, company) || other.company == company)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.note, note) || other.note == note)&&(identical(other.preferredDate, preferredDate) || other.preferredDate == preferredDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.statusLabel, statusLabel) || other.statusLabel == statusLabel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,fullName,email,phone,company,subject,note,preferredDate,status,statusLabel,createdAt);

@override
String toString() {
  return 'AppointmentListItem(id: $id, fullName: $fullName, email: $email, phone: $phone, company: $company, subject: $subject, note: $note, preferredDate: $preferredDate, status: $status, statusLabel: $statusLabel, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AppointmentListItemCopyWith<$Res> implements $AppointmentListItemCopyWith<$Res> {
  factory _$AppointmentListItemCopyWith(_AppointmentListItem value, $Res Function(_AppointmentListItem) _then) = __$AppointmentListItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "full_name") String? fullName,@JsonKey(name: "email") String? email,@JsonKey(name: "phone") String? phone,@JsonKey(name: "company") String? company,@JsonKey(name: "subject") String? subject,@JsonKey(name: "note") String? note,@JsonKey(name: "preferred_date") String? preferredDate,@JsonKey(name: "status") String? status,@JsonKey(name: "status_label") String? statusLabel,@JsonKey(name: "created_at") String? createdAt
});




}
/// @nodoc
class __$AppointmentListItemCopyWithImpl<$Res>
    implements _$AppointmentListItemCopyWith<$Res> {
  __$AppointmentListItemCopyWithImpl(this._self, this._then);

  final _AppointmentListItem _self;
  final $Res Function(_AppointmentListItem) _then;

/// Create a copy of AppointmentListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? fullName = freezed,Object? email = freezed,Object? phone = freezed,Object? company = freezed,Object? subject = freezed,Object? note = freezed,Object? preferredDate = freezed,Object? status = freezed,Object? statusLabel = freezed,Object? createdAt = freezed,}) {
  return _then(_AppointmentListItem(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,subject: freezed == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,preferredDate: freezed == preferredDate ? _self.preferredDate : preferredDate // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,statusLabel: freezed == statusLabel ? _self.statusLabel : statusLabel // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$AppointmentDetailResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") AppointmentListItem? get data;
/// Create a copy of AppointmentDetailResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentDetailResponseCopyWith<AppointmentDetailResponse> get copyWith => _$AppointmentDetailResponseCopyWithImpl<AppointmentDetailResponse>(this as AppointmentDetailResponse, _$identity);

  /// Serializes this AppointmentDetailResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentDetailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'AppointmentDetailResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $AppointmentDetailResponseCopyWith<$Res>  {
  factory $AppointmentDetailResponseCopyWith(AppointmentDetailResponse value, $Res Function(AppointmentDetailResponse) _then) = _$AppointmentDetailResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") AppointmentListItem? data
});


$AppointmentListItemCopyWith<$Res>? get data;

}
/// @nodoc
class _$AppointmentDetailResponseCopyWithImpl<$Res>
    implements $AppointmentDetailResponseCopyWith<$Res> {
  _$AppointmentDetailResponseCopyWithImpl(this._self, this._then);

  final AppointmentDetailResponse _self;
  final $Res Function(AppointmentDetailResponse) _then;

/// Create a copy of AppointmentDetailResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppointmentListItem?,
  ));
}
/// Create a copy of AppointmentDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentListItemCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AppointmentListItemCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppointmentDetailResponse].
extension AppointmentDetailResponsePatterns on AppointmentDetailResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentDetailResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentDetailResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentDetailResponse value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentDetailResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentDetailResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentDetailResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  AppointmentListItem? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentDetailResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  AppointmentListItem? data)  $default,) {final _that = this;
switch (_that) {
case _AppointmentDetailResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  AppointmentListItem? data)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentDetailResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentDetailResponse implements AppointmentDetailResponse {
  const _AppointmentDetailResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _AppointmentDetailResponse.fromJson(Map<String, dynamic> json) => _$AppointmentDetailResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  AppointmentListItem? data;

/// Create a copy of AppointmentDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentDetailResponseCopyWith<_AppointmentDetailResponse> get copyWith => __$AppointmentDetailResponseCopyWithImpl<_AppointmentDetailResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentDetailResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentDetailResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'AppointmentDetailResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AppointmentDetailResponseCopyWith<$Res> implements $AppointmentDetailResponseCopyWith<$Res> {
  factory _$AppointmentDetailResponseCopyWith(_AppointmentDetailResponse value, $Res Function(_AppointmentDetailResponse) _then) = __$AppointmentDetailResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") AppointmentListItem? data
});


@override $AppointmentListItemCopyWith<$Res>? get data;

}
/// @nodoc
class __$AppointmentDetailResponseCopyWithImpl<$Res>
    implements _$AppointmentDetailResponseCopyWith<$Res> {
  __$AppointmentDetailResponseCopyWithImpl(this._self, this._then);

  final _AppointmentDetailResponse _self;
  final $Res Function(_AppointmentDetailResponse) _then;

/// Create a copy of AppointmentDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_AppointmentDetailResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as AppointmentListItem?,
  ));
}

/// Create a copy of AppointmentDetailResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppointmentListItemCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $AppointmentListItemCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
