// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") ProfileData? get data;
/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileResponseCopyWith<ProfileResponse> get copyWith => _$ProfileResponseCopyWithImpl<ProfileResponse>(this as ProfileResponse, _$identity);

  /// Serializes this ProfileResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ProfileResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ProfileResponseCopyWith<$Res>  {
  factory $ProfileResponseCopyWith(ProfileResponse value, $Res Function(ProfileResponse) _then) = _$ProfileResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") ProfileData? data
});


$ProfileDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ProfileResponseCopyWithImpl<$Res>
    implements $ProfileResponseCopyWith<$Res> {
  _$ProfileResponseCopyWithImpl(this._self, this._then);

  final ProfileResponse _self;
  final $Res Function(ProfileResponse) _then;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProfileData?,
  ));
}
/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ProfileDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileResponse].
extension ProfileResponsePatterns on ProfileResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProfileResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  ProfileData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  ProfileData? data)  $default,) {final _that = this;
switch (_that) {
case _ProfileResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  ProfileData? data)?  $default,) {final _that = this;
switch (_that) {
case _ProfileResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileResponse implements ProfileResponse {
  const _ProfileResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _ProfileResponse.fromJson(Map<String, dynamic> json) => _$ProfileResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  ProfileData? data;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileResponseCopyWith<_ProfileResponse> get copyWith => __$ProfileResponseCopyWithImpl<_ProfileResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'ProfileResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ProfileResponseCopyWith<$Res> implements $ProfileResponseCopyWith<$Res> {
  factory _$ProfileResponseCopyWith(_ProfileResponse value, $Res Function(_ProfileResponse) _then) = __$ProfileResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") ProfileData? data
});


@override $ProfileDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ProfileResponseCopyWithImpl<$Res>
    implements _$ProfileResponseCopyWith<$Res> {
  __$ProfileResponseCopyWithImpl(this._self, this._then);

  final _ProfileResponse _self;
  final $Res Function(_ProfileResponse) _then;

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ProfileResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProfileData?,
  ));
}

/// Create a copy of ProfileResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ProfileDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ProfileData {

@JsonKey(name: "id") int? get id;@JsonKey(name: "slug") String? get slug;@JsonKey(name: "full_name") String? get fullName;@JsonKey(name: "title") String? get title;@JsonKey(name: "title_en") String? get titleEn;@JsonKey(name: "email") String? get email;@JsonKey(name: "phone") String? get phone;@JsonKey(name: "extension_number") String? get extensionNumber;@JsonKey(name: "instagram_url") String? get instagramUrl;@JsonKey(name: "linkedin_url") String? get linkedinUrl;@JsonKey(name: "appointment_status") String? get appointmentStatus;@JsonKey(name: "photo_url") String? get photoUrl;@JsonKey(name: "photo_thumb_url") String? get photoThumbUrl;@JsonKey(name: "department") ProfileDepartment? get department;@JsonKey(name: "firm") ProfileFirm? get firm;@JsonKey(name: "office_address") ProfileOfficeAddress? get officeAddress;@JsonKey(name: "editable_fields") List<String>? get editableFields;
/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDataCopyWith<ProfileData> get copyWith => _$ProfileDataCopyWithImpl<ProfileData>(this as ProfileData, _$identity);

  /// Serializes this ProfileData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileData&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.extensionNumber, extensionNumber) || other.extensionNumber == extensionNumber)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.appointmentStatus, appointmentStatus) || other.appointmentStatus == appointmentStatus)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoThumbUrl, photoThumbUrl) || other.photoThumbUrl == photoThumbUrl)&&(identical(other.department, department) || other.department == department)&&(identical(other.firm, firm) || other.firm == firm)&&(identical(other.officeAddress, officeAddress) || other.officeAddress == officeAddress)&&const DeepCollectionEquality().equals(other.editableFields, editableFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,fullName,title,titleEn,email,phone,extensionNumber,instagramUrl,linkedinUrl,appointmentStatus,photoUrl,photoThumbUrl,department,firm,officeAddress,const DeepCollectionEquality().hash(editableFields));

@override
String toString() {
  return 'ProfileData(id: $id, slug: $slug, fullName: $fullName, title: $title, titleEn: $titleEn, email: $email, phone: $phone, extensionNumber: $extensionNumber, instagramUrl: $instagramUrl, linkedinUrl: $linkedinUrl, appointmentStatus: $appointmentStatus, photoUrl: $photoUrl, photoThumbUrl: $photoThumbUrl, department: $department, firm: $firm, officeAddress: $officeAddress, editableFields: $editableFields)';
}


}

/// @nodoc
abstract mixin class $ProfileDataCopyWith<$Res>  {
  factory $ProfileDataCopyWith(ProfileData value, $Res Function(ProfileData) _then) = _$ProfileDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "slug") String? slug,@JsonKey(name: "full_name") String? fullName,@JsonKey(name: "title") String? title,@JsonKey(name: "title_en") String? titleEn,@JsonKey(name: "email") String? email,@JsonKey(name: "phone") String? phone,@JsonKey(name: "extension_number") String? extensionNumber,@JsonKey(name: "instagram_url") String? instagramUrl,@JsonKey(name: "linkedin_url") String? linkedinUrl,@JsonKey(name: "appointment_status") String? appointmentStatus,@JsonKey(name: "photo_url") String? photoUrl,@JsonKey(name: "photo_thumb_url") String? photoThumbUrl,@JsonKey(name: "department") ProfileDepartment? department,@JsonKey(name: "firm") ProfileFirm? firm,@JsonKey(name: "office_address") ProfileOfficeAddress? officeAddress,@JsonKey(name: "editable_fields") List<String>? editableFields
});


$ProfileDepartmentCopyWith<$Res>? get department;$ProfileFirmCopyWith<$Res>? get firm;$ProfileOfficeAddressCopyWith<$Res>? get officeAddress;

}
/// @nodoc
class _$ProfileDataCopyWithImpl<$Res>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._self, this._then);

  final ProfileData _self;
  final $Res Function(ProfileData) _then;

/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? slug = freezed,Object? fullName = freezed,Object? title = freezed,Object? titleEn = freezed,Object? email = freezed,Object? phone = freezed,Object? extensionNumber = freezed,Object? instagramUrl = freezed,Object? linkedinUrl = freezed,Object? appointmentStatus = freezed,Object? photoUrl = freezed,Object? photoThumbUrl = freezed,Object? department = freezed,Object? firm = freezed,Object? officeAddress = freezed,Object? editableFields = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleEn: freezed == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,extensionNumber: freezed == extensionNumber ? _self.extensionNumber : extensionNumber // ignore: cast_nullable_to_non_nullable
as String?,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String?,linkedinUrl: freezed == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as String?,appointmentStatus: freezed == appointmentStatus ? _self.appointmentStatus : appointmentStatus // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoThumbUrl: freezed == photoThumbUrl ? _self.photoThumbUrl : photoThumbUrl // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as ProfileDepartment?,firm: freezed == firm ? _self.firm : firm // ignore: cast_nullable_to_non_nullable
as ProfileFirm?,officeAddress: freezed == officeAddress ? _self.officeAddress : officeAddress // ignore: cast_nullable_to_non_nullable
as ProfileOfficeAddress?,editableFields: freezed == editableFields ? _self.editableFields : editableFields // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}
/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileDepartmentCopyWith<$Res>? get department {
    if (_self.department == null) {
    return null;
  }

  return $ProfileDepartmentCopyWith<$Res>(_self.department!, (value) {
    return _then(_self.copyWith(department: value));
  });
}/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileFirmCopyWith<$Res>? get firm {
    if (_self.firm == null) {
    return null;
  }

  return $ProfileFirmCopyWith<$Res>(_self.firm!, (value) {
    return _then(_self.copyWith(firm: value));
  });
}/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileOfficeAddressCopyWith<$Res>? get officeAddress {
    if (_self.officeAddress == null) {
    return null;
  }

  return $ProfileOfficeAddressCopyWith<$Res>(_self.officeAddress!, (value) {
    return _then(_self.copyWith(officeAddress: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileData].
extension ProfileDataPatterns on ProfileData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileData value)  $default,){
final _that = this;
switch (_that) {
case _ProfileData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileData value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "title")  String? title, @JsonKey(name: "title_en")  String? titleEn, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "extension_number")  String? extensionNumber, @JsonKey(name: "instagram_url")  String? instagramUrl, @JsonKey(name: "linkedin_url")  String? linkedinUrl, @JsonKey(name: "appointment_status")  String? appointmentStatus, @JsonKey(name: "photo_url")  String? photoUrl, @JsonKey(name: "photo_thumb_url")  String? photoThumbUrl, @JsonKey(name: "department")  ProfileDepartment? department, @JsonKey(name: "firm")  ProfileFirm? firm, @JsonKey(name: "office_address")  ProfileOfficeAddress? officeAddress, @JsonKey(name: "editable_fields")  List<String>? editableFields)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileData() when $default != null:
return $default(_that.id,_that.slug,_that.fullName,_that.title,_that.titleEn,_that.email,_that.phone,_that.extensionNumber,_that.instagramUrl,_that.linkedinUrl,_that.appointmentStatus,_that.photoUrl,_that.photoThumbUrl,_that.department,_that.firm,_that.officeAddress,_that.editableFields);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "title")  String? title, @JsonKey(name: "title_en")  String? titleEn, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "extension_number")  String? extensionNumber, @JsonKey(name: "instagram_url")  String? instagramUrl, @JsonKey(name: "linkedin_url")  String? linkedinUrl, @JsonKey(name: "appointment_status")  String? appointmentStatus, @JsonKey(name: "photo_url")  String? photoUrl, @JsonKey(name: "photo_thumb_url")  String? photoThumbUrl, @JsonKey(name: "department")  ProfileDepartment? department, @JsonKey(name: "firm")  ProfileFirm? firm, @JsonKey(name: "office_address")  ProfileOfficeAddress? officeAddress, @JsonKey(name: "editable_fields")  List<String>? editableFields)  $default,) {final _that = this;
switch (_that) {
case _ProfileData():
return $default(_that.id,_that.slug,_that.fullName,_that.title,_that.titleEn,_that.email,_that.phone,_that.extensionNumber,_that.instagramUrl,_that.linkedinUrl,_that.appointmentStatus,_that.photoUrl,_that.photoThumbUrl,_that.department,_that.firm,_that.officeAddress,_that.editableFields);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "full_name")  String? fullName, @JsonKey(name: "title")  String? title, @JsonKey(name: "title_en")  String? titleEn, @JsonKey(name: "email")  String? email, @JsonKey(name: "phone")  String? phone, @JsonKey(name: "extension_number")  String? extensionNumber, @JsonKey(name: "instagram_url")  String? instagramUrl, @JsonKey(name: "linkedin_url")  String? linkedinUrl, @JsonKey(name: "appointment_status")  String? appointmentStatus, @JsonKey(name: "photo_url")  String? photoUrl, @JsonKey(name: "photo_thumb_url")  String? photoThumbUrl, @JsonKey(name: "department")  ProfileDepartment? department, @JsonKey(name: "firm")  ProfileFirm? firm, @JsonKey(name: "office_address")  ProfileOfficeAddress? officeAddress, @JsonKey(name: "editable_fields")  List<String>? editableFields)?  $default,) {final _that = this;
switch (_that) {
case _ProfileData() when $default != null:
return $default(_that.id,_that.slug,_that.fullName,_that.title,_that.titleEn,_that.email,_that.phone,_that.extensionNumber,_that.instagramUrl,_that.linkedinUrl,_that.appointmentStatus,_that.photoUrl,_that.photoThumbUrl,_that.department,_that.firm,_that.officeAddress,_that.editableFields);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileData implements ProfileData {
  const _ProfileData({@JsonKey(name: "id") this.id, @JsonKey(name: "slug") this.slug, @JsonKey(name: "full_name") this.fullName, @JsonKey(name: "title") this.title, @JsonKey(name: "title_en") this.titleEn, @JsonKey(name: "email") this.email, @JsonKey(name: "phone") this.phone, @JsonKey(name: "extension_number") this.extensionNumber, @JsonKey(name: "instagram_url") this.instagramUrl, @JsonKey(name: "linkedin_url") this.linkedinUrl, @JsonKey(name: "appointment_status") this.appointmentStatus, @JsonKey(name: "photo_url") this.photoUrl, @JsonKey(name: "photo_thumb_url") this.photoThumbUrl, @JsonKey(name: "department") this.department, @JsonKey(name: "firm") this.firm, @JsonKey(name: "office_address") this.officeAddress, @JsonKey(name: "editable_fields") final  List<String>? editableFields}): _editableFields = editableFields;
  factory _ProfileData.fromJson(Map<String, dynamic> json) => _$ProfileDataFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "slug") final  String? slug;
@override@JsonKey(name: "full_name") final  String? fullName;
@override@JsonKey(name: "title") final  String? title;
@override@JsonKey(name: "title_en") final  String? titleEn;
@override@JsonKey(name: "email") final  String? email;
@override@JsonKey(name: "phone") final  String? phone;
@override@JsonKey(name: "extension_number") final  String? extensionNumber;
@override@JsonKey(name: "instagram_url") final  String? instagramUrl;
@override@JsonKey(name: "linkedin_url") final  String? linkedinUrl;
@override@JsonKey(name: "appointment_status") final  String? appointmentStatus;
@override@JsonKey(name: "photo_url") final  String? photoUrl;
@override@JsonKey(name: "photo_thumb_url") final  String? photoThumbUrl;
@override@JsonKey(name: "department") final  ProfileDepartment? department;
@override@JsonKey(name: "firm") final  ProfileFirm? firm;
@override@JsonKey(name: "office_address") final  ProfileOfficeAddress? officeAddress;
 final  List<String>? _editableFields;
@override@JsonKey(name: "editable_fields") List<String>? get editableFields {
  final value = _editableFields;
  if (value == null) return null;
  if (_editableFields is EqualUnmodifiableListView) return _editableFields;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDataCopyWith<_ProfileData> get copyWith => __$ProfileDataCopyWithImpl<_ProfileData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileData&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.extensionNumber, extensionNumber) || other.extensionNumber == extensionNumber)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.appointmentStatus, appointmentStatus) || other.appointmentStatus == appointmentStatus)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoThumbUrl, photoThumbUrl) || other.photoThumbUrl == photoThumbUrl)&&(identical(other.department, department) || other.department == department)&&(identical(other.firm, firm) || other.firm == firm)&&(identical(other.officeAddress, officeAddress) || other.officeAddress == officeAddress)&&const DeepCollectionEquality().equals(other._editableFields, _editableFields));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,fullName,title,titleEn,email,phone,extensionNumber,instagramUrl,linkedinUrl,appointmentStatus,photoUrl,photoThumbUrl,department,firm,officeAddress,const DeepCollectionEquality().hash(_editableFields));

@override
String toString() {
  return 'ProfileData(id: $id, slug: $slug, fullName: $fullName, title: $title, titleEn: $titleEn, email: $email, phone: $phone, extensionNumber: $extensionNumber, instagramUrl: $instagramUrl, linkedinUrl: $linkedinUrl, appointmentStatus: $appointmentStatus, photoUrl: $photoUrl, photoThumbUrl: $photoThumbUrl, department: $department, firm: $firm, officeAddress: $officeAddress, editableFields: $editableFields)';
}


}

/// @nodoc
abstract mixin class _$ProfileDataCopyWith<$Res> implements $ProfileDataCopyWith<$Res> {
  factory _$ProfileDataCopyWith(_ProfileData value, $Res Function(_ProfileData) _then) = __$ProfileDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "slug") String? slug,@JsonKey(name: "full_name") String? fullName,@JsonKey(name: "title") String? title,@JsonKey(name: "title_en") String? titleEn,@JsonKey(name: "email") String? email,@JsonKey(name: "phone") String? phone,@JsonKey(name: "extension_number") String? extensionNumber,@JsonKey(name: "instagram_url") String? instagramUrl,@JsonKey(name: "linkedin_url") String? linkedinUrl,@JsonKey(name: "appointment_status") String? appointmentStatus,@JsonKey(name: "photo_url") String? photoUrl,@JsonKey(name: "photo_thumb_url") String? photoThumbUrl,@JsonKey(name: "department") ProfileDepartment? department,@JsonKey(name: "firm") ProfileFirm? firm,@JsonKey(name: "office_address") ProfileOfficeAddress? officeAddress,@JsonKey(name: "editable_fields") List<String>? editableFields
});


@override $ProfileDepartmentCopyWith<$Res>? get department;@override $ProfileFirmCopyWith<$Res>? get firm;@override $ProfileOfficeAddressCopyWith<$Res>? get officeAddress;

}
/// @nodoc
class __$ProfileDataCopyWithImpl<$Res>
    implements _$ProfileDataCopyWith<$Res> {
  __$ProfileDataCopyWithImpl(this._self, this._then);

  final _ProfileData _self;
  final $Res Function(_ProfileData) _then;

/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? slug = freezed,Object? fullName = freezed,Object? title = freezed,Object? titleEn = freezed,Object? email = freezed,Object? phone = freezed,Object? extensionNumber = freezed,Object? instagramUrl = freezed,Object? linkedinUrl = freezed,Object? appointmentStatus = freezed,Object? photoUrl = freezed,Object? photoThumbUrl = freezed,Object? department = freezed,Object? firm = freezed,Object? officeAddress = freezed,Object? editableFields = freezed,}) {
  return _then(_ProfileData(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleEn: freezed == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,extensionNumber: freezed == extensionNumber ? _self.extensionNumber : extensionNumber // ignore: cast_nullable_to_non_nullable
as String?,instagramUrl: freezed == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String?,linkedinUrl: freezed == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as String?,appointmentStatus: freezed == appointmentStatus ? _self.appointmentStatus : appointmentStatus // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoThumbUrl: freezed == photoThumbUrl ? _self.photoThumbUrl : photoThumbUrl // ignore: cast_nullable_to_non_nullable
as String?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as ProfileDepartment?,firm: freezed == firm ? _self.firm : firm // ignore: cast_nullable_to_non_nullable
as ProfileFirm?,officeAddress: freezed == officeAddress ? _self.officeAddress : officeAddress // ignore: cast_nullable_to_non_nullable
as ProfileOfficeAddress?,editableFields: freezed == editableFields ? _self._editableFields : editableFields // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileDepartmentCopyWith<$Res>? get department {
    if (_self.department == null) {
    return null;
  }

  return $ProfileDepartmentCopyWith<$Res>(_self.department!, (value) {
    return _then(_self.copyWith(department: value));
  });
}/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileFirmCopyWith<$Res>? get firm {
    if (_self.firm == null) {
    return null;
  }

  return $ProfileFirmCopyWith<$Res>(_self.firm!, (value) {
    return _then(_self.copyWith(firm: value));
  });
}/// Create a copy of ProfileData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileOfficeAddressCopyWith<$Res>? get officeAddress {
    if (_self.officeAddress == null) {
    return null;
  }

  return $ProfileOfficeAddressCopyWith<$Res>(_self.officeAddress!, (value) {
    return _then(_self.copyWith(officeAddress: value));
  });
}
}


/// @nodoc
mixin _$ProfileDepartment {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "name_en") String? get nameEn;
/// Create a copy of ProfileDepartment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDepartmentCopyWith<ProfileDepartment> get copyWith => _$ProfileDepartmentCopyWithImpl<ProfileDepartment>(this as ProfileDepartment, _$identity);

  /// Serializes this ProfileDepartment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDepartment&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameEn);

@override
String toString() {
  return 'ProfileDepartment(id: $id, name: $name, nameEn: $nameEn)';
}


}

/// @nodoc
abstract mixin class $ProfileDepartmentCopyWith<$Res>  {
  factory $ProfileDepartmentCopyWith(ProfileDepartment value, $Res Function(ProfileDepartment) _then) = _$ProfileDepartmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "name_en") String? nameEn
});




}
/// @nodoc
class _$ProfileDepartmentCopyWithImpl<$Res>
    implements $ProfileDepartmentCopyWith<$Res> {
  _$ProfileDepartmentCopyWithImpl(this._self, this._then);

  final ProfileDepartment _self;
  final $Res Function(ProfileDepartment) _then;

/// Create a copy of ProfileDepartment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? nameEn = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDepartment].
extension ProfileDepartmentPatterns on ProfileDepartment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileDepartment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileDepartment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileDepartment value)  $default,){
final _that = this;
switch (_that) {
case _ProfileDepartment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileDepartment value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileDepartment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "name_en")  String? nameEn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileDepartment() when $default != null:
return $default(_that.id,_that.name,_that.nameEn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "name_en")  String? nameEn)  $default,) {final _that = this;
switch (_that) {
case _ProfileDepartment():
return $default(_that.id,_that.name,_that.nameEn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "name_en")  String? nameEn)?  $default,) {final _that = this;
switch (_that) {
case _ProfileDepartment() when $default != null:
return $default(_that.id,_that.name,_that.nameEn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileDepartment implements ProfileDepartment {
  const _ProfileDepartment({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "name_en") this.nameEn});
  factory _ProfileDepartment.fromJson(Map<String, dynamic> json) => _$ProfileDepartmentFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "name_en") final  String? nameEn;

/// Create a copy of ProfileDepartment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileDepartmentCopyWith<_ProfileDepartment> get copyWith => __$ProfileDepartmentCopyWithImpl<_ProfileDepartment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileDepartmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileDepartment&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameEn, nameEn) || other.nameEn == nameEn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameEn);

@override
String toString() {
  return 'ProfileDepartment(id: $id, name: $name, nameEn: $nameEn)';
}


}

/// @nodoc
abstract mixin class _$ProfileDepartmentCopyWith<$Res> implements $ProfileDepartmentCopyWith<$Res> {
  factory _$ProfileDepartmentCopyWith(_ProfileDepartment value, $Res Function(_ProfileDepartment) _then) = __$ProfileDepartmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "name_en") String? nameEn
});




}
/// @nodoc
class __$ProfileDepartmentCopyWithImpl<$Res>
    implements _$ProfileDepartmentCopyWith<$Res> {
  __$ProfileDepartmentCopyWithImpl(this._self, this._then);

  final _ProfileDepartment _self;
  final $Res Function(_ProfileDepartment) _then;

/// Create a copy of ProfileDepartment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? nameEn = freezed,}) {
  return _then(_ProfileDepartment(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,nameEn: freezed == nameEn ? _self.nameEn : nameEn // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProfileFirm {

@JsonKey(name: "id") int? get id;@JsonKey(name: "firm_name") String? get firmName;
/// Create a copy of ProfileFirm
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileFirmCopyWith<ProfileFirm> get copyWith => _$ProfileFirmCopyWithImpl<ProfileFirm>(this as ProfileFirm, _$identity);

  /// Serializes this ProfileFirm to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileFirm&&(identical(other.id, id) || other.id == id)&&(identical(other.firmName, firmName) || other.firmName == firmName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firmName);

@override
String toString() {
  return 'ProfileFirm(id: $id, firmName: $firmName)';
}


}

/// @nodoc
abstract mixin class $ProfileFirmCopyWith<$Res>  {
  factory $ProfileFirmCopyWith(ProfileFirm value, $Res Function(ProfileFirm) _then) = _$ProfileFirmCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "firm_name") String? firmName
});




}
/// @nodoc
class _$ProfileFirmCopyWithImpl<$Res>
    implements $ProfileFirmCopyWith<$Res> {
  _$ProfileFirmCopyWithImpl(this._self, this._then);

  final ProfileFirm _self;
  final $Res Function(ProfileFirm) _then;

/// Create a copy of ProfileFirm
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? firmName = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,firmName: freezed == firmName ? _self.firmName : firmName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileFirm].
extension ProfileFirmPatterns on ProfileFirm {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileFirm value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileFirm() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileFirm value)  $default,){
final _that = this;
switch (_that) {
case _ProfileFirm():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileFirm value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileFirm() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "firm_name")  String? firmName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileFirm() when $default != null:
return $default(_that.id,_that.firmName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "firm_name")  String? firmName)  $default,) {final _that = this;
switch (_that) {
case _ProfileFirm():
return $default(_that.id,_that.firmName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "firm_name")  String? firmName)?  $default,) {final _that = this;
switch (_that) {
case _ProfileFirm() when $default != null:
return $default(_that.id,_that.firmName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileFirm implements ProfileFirm {
  const _ProfileFirm({@JsonKey(name: "id") this.id, @JsonKey(name: "firm_name") this.firmName});
  factory _ProfileFirm.fromJson(Map<String, dynamic> json) => _$ProfileFirmFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "firm_name") final  String? firmName;

/// Create a copy of ProfileFirm
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileFirmCopyWith<_ProfileFirm> get copyWith => __$ProfileFirmCopyWithImpl<_ProfileFirm>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileFirmToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileFirm&&(identical(other.id, id) || other.id == id)&&(identical(other.firmName, firmName) || other.firmName == firmName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firmName);

@override
String toString() {
  return 'ProfileFirm(id: $id, firmName: $firmName)';
}


}

/// @nodoc
abstract mixin class _$ProfileFirmCopyWith<$Res> implements $ProfileFirmCopyWith<$Res> {
  factory _$ProfileFirmCopyWith(_ProfileFirm value, $Res Function(_ProfileFirm) _then) = __$ProfileFirmCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "firm_name") String? firmName
});




}
/// @nodoc
class __$ProfileFirmCopyWithImpl<$Res>
    implements _$ProfileFirmCopyWith<$Res> {
  __$ProfileFirmCopyWithImpl(this._self, this._then);

  final _ProfileFirm _self;
  final $Res Function(_ProfileFirm) _then;

/// Create a copy of ProfileFirm
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? firmName = freezed,}) {
  return _then(_ProfileFirm(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,firmName: freezed == firmName ? _self.firmName : firmName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProfileOfficeAddress {

@JsonKey(name: "id") int? get id;@JsonKey(name: "address_name") String? get addressName;@JsonKey(name: "street_address") String? get streetAddress;@JsonKey(name: "phone") String? get phone;
/// Create a copy of ProfileOfficeAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileOfficeAddressCopyWith<ProfileOfficeAddress> get copyWith => _$ProfileOfficeAddressCopyWithImpl<ProfileOfficeAddress>(this as ProfileOfficeAddress, _$identity);

  /// Serializes this ProfileOfficeAddress to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileOfficeAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.addressName, addressName) || other.addressName == addressName)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,addressName,streetAddress,phone);

@override
String toString() {
  return 'ProfileOfficeAddress(id: $id, addressName: $addressName, streetAddress: $streetAddress, phone: $phone)';
}


}

/// @nodoc
abstract mixin class $ProfileOfficeAddressCopyWith<$Res>  {
  factory $ProfileOfficeAddressCopyWith(ProfileOfficeAddress value, $Res Function(ProfileOfficeAddress) _then) = _$ProfileOfficeAddressCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "address_name") String? addressName,@JsonKey(name: "street_address") String? streetAddress,@JsonKey(name: "phone") String? phone
});




}
/// @nodoc
class _$ProfileOfficeAddressCopyWithImpl<$Res>
    implements $ProfileOfficeAddressCopyWith<$Res> {
  _$ProfileOfficeAddressCopyWithImpl(this._self, this._then);

  final ProfileOfficeAddress _self;
  final $Res Function(ProfileOfficeAddress) _then;

/// Create a copy of ProfileOfficeAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? addressName = freezed,Object? streetAddress = freezed,Object? phone = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,addressName: freezed == addressName ? _self.addressName : addressName // ignore: cast_nullable_to_non_nullable
as String?,streetAddress: freezed == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileOfficeAddress].
extension ProfileOfficeAddressPatterns on ProfileOfficeAddress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileOfficeAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileOfficeAddress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileOfficeAddress value)  $default,){
final _that = this;
switch (_that) {
case _ProfileOfficeAddress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileOfficeAddress value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileOfficeAddress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "address_name")  String? addressName, @JsonKey(name: "street_address")  String? streetAddress, @JsonKey(name: "phone")  String? phone)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileOfficeAddress() when $default != null:
return $default(_that.id,_that.addressName,_that.streetAddress,_that.phone);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "address_name")  String? addressName, @JsonKey(name: "street_address")  String? streetAddress, @JsonKey(name: "phone")  String? phone)  $default,) {final _that = this;
switch (_that) {
case _ProfileOfficeAddress():
return $default(_that.id,_that.addressName,_that.streetAddress,_that.phone);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "address_name")  String? addressName, @JsonKey(name: "street_address")  String? streetAddress, @JsonKey(name: "phone")  String? phone)?  $default,) {final _that = this;
switch (_that) {
case _ProfileOfficeAddress() when $default != null:
return $default(_that.id,_that.addressName,_that.streetAddress,_that.phone);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileOfficeAddress implements ProfileOfficeAddress {
  const _ProfileOfficeAddress({@JsonKey(name: "id") this.id, @JsonKey(name: "address_name") this.addressName, @JsonKey(name: "street_address") this.streetAddress, @JsonKey(name: "phone") this.phone});
  factory _ProfileOfficeAddress.fromJson(Map<String, dynamic> json) => _$ProfileOfficeAddressFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "address_name") final  String? addressName;
@override@JsonKey(name: "street_address") final  String? streetAddress;
@override@JsonKey(name: "phone") final  String? phone;

/// Create a copy of ProfileOfficeAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileOfficeAddressCopyWith<_ProfileOfficeAddress> get copyWith => __$ProfileOfficeAddressCopyWithImpl<_ProfileOfficeAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileOfficeAddressToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileOfficeAddress&&(identical(other.id, id) || other.id == id)&&(identical(other.addressName, addressName) || other.addressName == addressName)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.phone, phone) || other.phone == phone));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,addressName,streetAddress,phone);

@override
String toString() {
  return 'ProfileOfficeAddress(id: $id, addressName: $addressName, streetAddress: $streetAddress, phone: $phone)';
}


}

/// @nodoc
abstract mixin class _$ProfileOfficeAddressCopyWith<$Res> implements $ProfileOfficeAddressCopyWith<$Res> {
  factory _$ProfileOfficeAddressCopyWith(_ProfileOfficeAddress value, $Res Function(_ProfileOfficeAddress) _then) = __$ProfileOfficeAddressCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "address_name") String? addressName,@JsonKey(name: "street_address") String? streetAddress,@JsonKey(name: "phone") String? phone
});




}
/// @nodoc
class __$ProfileOfficeAddressCopyWithImpl<$Res>
    implements _$ProfileOfficeAddressCopyWith<$Res> {
  __$ProfileOfficeAddressCopyWithImpl(this._self, this._then);

  final _ProfileOfficeAddress _self;
  final $Res Function(_ProfileOfficeAddress) _then;

/// Create a copy of ProfileOfficeAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? addressName = freezed,Object? streetAddress = freezed,Object? phone = freezed,}) {
  return _then(_ProfileOfficeAddress(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,addressName: freezed == addressName ? _self.addressName : addressName // ignore: cast_nullable_to_non_nullable
as String?,streetAddress: freezed == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
