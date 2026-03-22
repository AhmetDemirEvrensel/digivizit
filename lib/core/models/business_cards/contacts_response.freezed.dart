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
mixin _$ContactsResponse {

@JsonKey(name: "success") bool get success;@JsonKey(name: "message") String get message;@JsonKey(name: "data") List<ContactsData> get data;
/// Create a copy of ContactsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactsResponseCopyWith<ContactsResponse> get copyWith => _$ContactsResponseCopyWithImpl<ContactsResponse>(this as ContactsResponse, _$identity);

  /// Serializes this ContactsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ContactsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $ContactsResponseCopyWith<$Res>  {
  factory $ContactsResponseCopyWith(ContactsResponse value, $Res Function(ContactsResponse) _then) = _$ContactsResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message,@JsonKey(name: "data") List<ContactsData> data
});




}
/// @nodoc
class _$ContactsResponseCopyWithImpl<$Res>
    implements $ContactsResponseCopyWith<$Res> {
  _$ContactsResponseCopyWithImpl(this._self, this._then);

  final ContactsResponse _self;
  final $Res Function(ContactsResponse) _then;

/// Create a copy of ContactsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_self.copyWith(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ContactsData>,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactsResponse].
extension ContactsResponsePatterns on ContactsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactsResponse value)  $default,){
final _that = this;
switch (_that) {
case _ContactsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ContactsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "message")  String message, @JsonKey(name: "data")  List<ContactsData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactsResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "message")  String message, @JsonKey(name: "data")  List<ContactsData> data)  $default,) {final _that = this;
switch (_that) {
case _ContactsResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool success, @JsonKey(name: "message")  String message, @JsonKey(name: "data")  List<ContactsData> data)?  $default,) {final _that = this;
switch (_that) {
case _ContactsResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactsResponse implements ContactsResponse {
  const _ContactsResponse({@JsonKey(name: "success") required this.success, @JsonKey(name: "message") required this.message, @JsonKey(name: "data") required final  List<ContactsData> data}): _data = data;
  factory _ContactsResponse.fromJson(Map<String, dynamic> json) => _$ContactsResponseFromJson(json);

@override@JsonKey(name: "success") final  bool success;
@override@JsonKey(name: "message") final  String message;
 final  List<ContactsData> _data;
@override@JsonKey(name: "data") List<ContactsData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ContactsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactsResponseCopyWith<_ContactsResponse> get copyWith => __$ContactsResponseCopyWithImpl<_ContactsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactsResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ContactsResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ContactsResponseCopyWith<$Res> implements $ContactsResponseCopyWith<$Res> {
  factory _$ContactsResponseCopyWith(_ContactsResponse value, $Res Function(_ContactsResponse) _then) = __$ContactsResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message,@JsonKey(name: "data") List<ContactsData> data
});




}
/// @nodoc
class __$ContactsResponseCopyWithImpl<$Res>
    implements _$ContactsResponseCopyWith<$Res> {
  __$ContactsResponseCopyWithImpl(this._self, this._then);

  final _ContactsResponse _self;
  final $Res Function(_ContactsResponse) _then;

/// Create a copy of ContactsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_ContactsResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ContactsData>,
  ));
}


}


/// @nodoc
mixin _$ContactsData {

@JsonKey(name: "id") int get id;@JsonKey(name: "user_id") int get userId;@JsonKey(name: "company_name") String get companyName;@JsonKey(name: "name_surname") List<String> get nameSurname;@JsonKey(name: "unvan") List<String> get unvan;@JsonKey(name: "email_list") List<String> get emailList;@JsonKey(name: "phone_list") List<String> get phoneList;@JsonKey(name: "email") String get email;@JsonKey(name: "phone") String get phone;@JsonKey(name: "website") String get website;@JsonKey(name: "address") String get address;@JsonKey(name: "sector") String get sector;@JsonKey(name: "country_id") int get countryId;@JsonKey(name: "country") String get country;@JsonKey(name: "note") dynamic get note;@JsonKey(name: "cards") List<dynamic> get cards;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;
/// Create a copy of ContactsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactsDataCopyWith<ContactsData> get copyWith => _$ContactsDataCopyWithImpl<ContactsData>(this as ContactsData, _$identity);

  /// Serializes this ContactsData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ContactsData&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&const DeepCollectionEquality().equals(other.nameSurname, nameSurname)&&const DeepCollectionEquality().equals(other.unvan, unvan)&&const DeepCollectionEquality().equals(other.emailList, emailList)&&const DeepCollectionEquality().equals(other.phoneList, phoneList)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other.note, note)&&const DeepCollectionEquality().equals(other.cards, cards)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,companyName,const DeepCollectionEquality().hash(nameSurname),const DeepCollectionEquality().hash(unvan),const DeepCollectionEquality().hash(emailList),const DeepCollectionEquality().hash(phoneList),email,phone,website,address,sector,countryId,country,const DeepCollectionEquality().hash(note),const DeepCollectionEquality().hash(cards),createdAt,updatedAt);

@override
String toString() {
  return 'ContactsData(id: $id, userId: $userId, companyName: $companyName, nameSurname: $nameSurname, unvan: $unvan, emailList: $emailList, phoneList: $phoneList, email: $email, phone: $phone, website: $website, address: $address, sector: $sector, countryId: $countryId, country: $country, note: $note, cards: $cards, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ContactsDataCopyWith<$Res>  {
  factory $ContactsDataCopyWith(ContactsData value, $Res Function(ContactsData) _then) = _$ContactsDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "user_id") int userId,@JsonKey(name: "company_name") String companyName,@JsonKey(name: "name_surname") List<String> nameSurname,@JsonKey(name: "unvan") List<String> unvan,@JsonKey(name: "email_list") List<String> emailList,@JsonKey(name: "phone_list") List<String> phoneList,@JsonKey(name: "email") String email,@JsonKey(name: "phone") String phone,@JsonKey(name: "website") String website,@JsonKey(name: "address") String address,@JsonKey(name: "sector") String sector,@JsonKey(name: "country_id") int countryId,@JsonKey(name: "country") String country,@JsonKey(name: "note") dynamic note,@JsonKey(name: "cards") List<dynamic> cards,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt
});




}
/// @nodoc
class _$ContactsDataCopyWithImpl<$Res>
    implements $ContactsDataCopyWith<$Res> {
  _$ContactsDataCopyWithImpl(this._self, this._then);

  final ContactsData _self;
  final $Res Function(ContactsData) _then;

/// Create a copy of ContactsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? companyName = null,Object? nameSurname = null,Object? unvan = null,Object? emailList = null,Object? phoneList = null,Object? email = null,Object? phone = null,Object? website = null,Object? address = null,Object? sector = null,Object? countryId = null,Object? country = null,Object? note = freezed,Object? cards = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,nameSurname: null == nameSurname ? _self.nameSurname : nameSurname // ignore: cast_nullable_to_non_nullable
as List<String>,unvan: null == unvan ? _self.unvan : unvan // ignore: cast_nullable_to_non_nullable
as List<String>,emailList: null == emailList ? _self.emailList : emailList // ignore: cast_nullable_to_non_nullable
as List<String>,phoneList: null == phoneList ? _self.phoneList : phoneList // ignore: cast_nullable_to_non_nullable
as List<String>,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as dynamic,cards: null == cards ? _self.cards : cards // ignore: cast_nullable_to_non_nullable
as List<dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ContactsData].
extension ContactsDataPatterns on ContactsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ContactsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ContactsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ContactsData value)  $default,){
final _that = this;
switch (_that) {
case _ContactsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ContactsData value)?  $default,){
final _that = this;
switch (_that) {
case _ContactsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "user_id")  int userId, @JsonKey(name: "company_name")  String companyName, @JsonKey(name: "name_surname")  List<String> nameSurname, @JsonKey(name: "unvan")  List<String> unvan, @JsonKey(name: "email_list")  List<String> emailList, @JsonKey(name: "phone_list")  List<String> phoneList, @JsonKey(name: "email")  String email, @JsonKey(name: "phone")  String phone, @JsonKey(name: "website")  String website, @JsonKey(name: "address")  String address, @JsonKey(name: "sector")  String sector, @JsonKey(name: "country_id")  int countryId, @JsonKey(name: "country")  String country, @JsonKey(name: "note")  dynamic note, @JsonKey(name: "cards")  List<dynamic> cards, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ContactsData() when $default != null:
return $default(_that.id,_that.userId,_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.email,_that.phone,_that.website,_that.address,_that.sector,_that.countryId,_that.country,_that.note,_that.cards,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "user_id")  int userId, @JsonKey(name: "company_name")  String companyName, @JsonKey(name: "name_surname")  List<String> nameSurname, @JsonKey(name: "unvan")  List<String> unvan, @JsonKey(name: "email_list")  List<String> emailList, @JsonKey(name: "phone_list")  List<String> phoneList, @JsonKey(name: "email")  String email, @JsonKey(name: "phone")  String phone, @JsonKey(name: "website")  String website, @JsonKey(name: "address")  String address, @JsonKey(name: "sector")  String sector, @JsonKey(name: "country_id")  int countryId, @JsonKey(name: "country")  String country, @JsonKey(name: "note")  dynamic note, @JsonKey(name: "cards")  List<dynamic> cards, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ContactsData():
return $default(_that.id,_that.userId,_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.email,_that.phone,_that.website,_that.address,_that.sector,_that.countryId,_that.country,_that.note,_that.cards,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "user_id")  int userId, @JsonKey(name: "company_name")  String companyName, @JsonKey(name: "name_surname")  List<String> nameSurname, @JsonKey(name: "unvan")  List<String> unvan, @JsonKey(name: "email_list")  List<String> emailList, @JsonKey(name: "phone_list")  List<String> phoneList, @JsonKey(name: "email")  String email, @JsonKey(name: "phone")  String phone, @JsonKey(name: "website")  String website, @JsonKey(name: "address")  String address, @JsonKey(name: "sector")  String sector, @JsonKey(name: "country_id")  int countryId, @JsonKey(name: "country")  String country, @JsonKey(name: "note")  dynamic note, @JsonKey(name: "cards")  List<dynamic> cards, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ContactsData() when $default != null:
return $default(_that.id,_that.userId,_that.companyName,_that.nameSurname,_that.unvan,_that.emailList,_that.phoneList,_that.email,_that.phone,_that.website,_that.address,_that.sector,_that.countryId,_that.country,_that.note,_that.cards,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ContactsData implements ContactsData {
  const _ContactsData({@JsonKey(name: "id") required this.id, @JsonKey(name: "user_id") required this.userId, @JsonKey(name: "company_name") required this.companyName, @JsonKey(name: "name_surname") required final  List<String> nameSurname, @JsonKey(name: "unvan") required final  List<String> unvan, @JsonKey(name: "email_list") required final  List<String> emailList, @JsonKey(name: "phone_list") required final  List<String> phoneList, @JsonKey(name: "email") required this.email, @JsonKey(name: "phone") required this.phone, @JsonKey(name: "website") required this.website, @JsonKey(name: "address") required this.address, @JsonKey(name: "sector") required this.sector, @JsonKey(name: "country_id") required this.countryId, @JsonKey(name: "country") required this.country, @JsonKey(name: "note") required this.note, @JsonKey(name: "cards") required final  List<dynamic> cards, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt}): _nameSurname = nameSurname,_unvan = unvan,_emailList = emailList,_phoneList = phoneList,_cards = cards;
  factory _ContactsData.fromJson(Map<String, dynamic> json) => _$ContactsDataFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "user_id") final  int userId;
@override@JsonKey(name: "company_name") final  String companyName;
 final  List<String> _nameSurname;
@override@JsonKey(name: "name_surname") List<String> get nameSurname {
  if (_nameSurname is EqualUnmodifiableListView) return _nameSurname;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nameSurname);
}

 final  List<String> _unvan;
@override@JsonKey(name: "unvan") List<String> get unvan {
  if (_unvan is EqualUnmodifiableListView) return _unvan;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unvan);
}

 final  List<String> _emailList;
@override@JsonKey(name: "email_list") List<String> get emailList {
  if (_emailList is EqualUnmodifiableListView) return _emailList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_emailList);
}

 final  List<String> _phoneList;
@override@JsonKey(name: "phone_list") List<String> get phoneList {
  if (_phoneList is EqualUnmodifiableListView) return _phoneList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_phoneList);
}

@override@JsonKey(name: "email") final  String email;
@override@JsonKey(name: "phone") final  String phone;
@override@JsonKey(name: "website") final  String website;
@override@JsonKey(name: "address") final  String address;
@override@JsonKey(name: "sector") final  String sector;
@override@JsonKey(name: "country_id") final  int countryId;
@override@JsonKey(name: "country") final  String country;
@override@JsonKey(name: "note") final  dynamic note;
 final  List<dynamic> _cards;
@override@JsonKey(name: "cards") List<dynamic> get cards {
  if (_cards is EqualUnmodifiableListView) return _cards;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cards);
}

@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;

/// Create a copy of ContactsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactsDataCopyWith<_ContactsData> get copyWith => __$ContactsDataCopyWithImpl<_ContactsData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactsDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ContactsData&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.companyName, companyName) || other.companyName == companyName)&&const DeepCollectionEquality().equals(other._nameSurname, _nameSurname)&&const DeepCollectionEquality().equals(other._unvan, _unvan)&&const DeepCollectionEquality().equals(other._emailList, _emailList)&&const DeepCollectionEquality().equals(other._phoneList, _phoneList)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.website, website) || other.website == website)&&(identical(other.address, address) || other.address == address)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.countryId, countryId) || other.countryId == countryId)&&(identical(other.country, country) || other.country == country)&&const DeepCollectionEquality().equals(other.note, note)&&const DeepCollectionEquality().equals(other._cards, _cards)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,companyName,const DeepCollectionEquality().hash(_nameSurname),const DeepCollectionEquality().hash(_unvan),const DeepCollectionEquality().hash(_emailList),const DeepCollectionEquality().hash(_phoneList),email,phone,website,address,sector,countryId,country,const DeepCollectionEquality().hash(note),const DeepCollectionEquality().hash(_cards),createdAt,updatedAt);

@override
String toString() {
  return 'ContactsData(id: $id, userId: $userId, companyName: $companyName, nameSurname: $nameSurname, unvan: $unvan, emailList: $emailList, phoneList: $phoneList, email: $email, phone: $phone, website: $website, address: $address, sector: $sector, countryId: $countryId, country: $country, note: $note, cards: $cards, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ContactsDataCopyWith<$Res> implements $ContactsDataCopyWith<$Res> {
  factory _$ContactsDataCopyWith(_ContactsData value, $Res Function(_ContactsData) _then) = __$ContactsDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "user_id") int userId,@JsonKey(name: "company_name") String companyName,@JsonKey(name: "name_surname") List<String> nameSurname,@JsonKey(name: "unvan") List<String> unvan,@JsonKey(name: "email_list") List<String> emailList,@JsonKey(name: "phone_list") List<String> phoneList,@JsonKey(name: "email") String email,@JsonKey(name: "phone") String phone,@JsonKey(name: "website") String website,@JsonKey(name: "address") String address,@JsonKey(name: "sector") String sector,@JsonKey(name: "country_id") int countryId,@JsonKey(name: "country") String country,@JsonKey(name: "note") dynamic note,@JsonKey(name: "cards") List<dynamic> cards,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt
});




}
/// @nodoc
class __$ContactsDataCopyWithImpl<$Res>
    implements _$ContactsDataCopyWith<$Res> {
  __$ContactsDataCopyWithImpl(this._self, this._then);

  final _ContactsData _self;
  final $Res Function(_ContactsData) _then;

/// Create a copy of ContactsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? companyName = null,Object? nameSurname = null,Object? unvan = null,Object? emailList = null,Object? phoneList = null,Object? email = null,Object? phone = null,Object? website = null,Object? address = null,Object? sector = null,Object? countryId = null,Object? country = null,Object? note = freezed,Object? cards = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ContactsData(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int,companyName: null == companyName ? _self.companyName : companyName // ignore: cast_nullable_to_non_nullable
as String,nameSurname: null == nameSurname ? _self._nameSurname : nameSurname // ignore: cast_nullable_to_non_nullable
as List<String>,unvan: null == unvan ? _self._unvan : unvan // ignore: cast_nullable_to_non_nullable
as List<String>,emailList: null == emailList ? _self._emailList : emailList // ignore: cast_nullable_to_non_nullable
as List<String>,phoneList: null == phoneList ? _self._phoneList : phoneList // ignore: cast_nullable_to_non_nullable
as List<String>,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,website: null == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,countryId: null == countryId ? _self.countryId : countryId // ignore: cast_nullable_to_non_nullable
as int,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as dynamic,cards: null == cards ? _self._cards : cards // ignore: cast_nullable_to_non_nullable
as List<dynamic>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
