// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponse {

@JsonKey(name: "success") bool? get success;@JsonKey(name: "message") String? get message;@JsonKey(name: "data") LoginData? get data;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'LoginResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") LoginData? data
});


$LoginDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginData?,
  ));
}
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LoginDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  LoginData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  LoginData? data)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "success")  bool? success, @JsonKey(name: "message")  String? message, @JsonKey(name: "data")  LoginData? data)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse implements LoginResponse {
  const _LoginResponse({@JsonKey(name: "success") this.success, @JsonKey(name: "message") this.message, @JsonKey(name: "data") this.data});
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override@JsonKey(name: "success") final  bool? success;
@override@JsonKey(name: "message") final  String? message;
@override@JsonKey(name: "data") final  LoginData? data;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,data);

@override
String toString() {
  return 'LoginResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool? success,@JsonKey(name: "message") String? message,@JsonKey(name: "data") LoginData? data
});


@override $LoginDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_LoginResponse(
success: freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginData?,
  ));
}

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LoginDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$LoginData {

@JsonKey(name: "token") String get token;@JsonKey(name: "token_type") String? get tokenType;@JsonKey(name: "me") LoginMe get me;
/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginDataCopyWith<LoginData> get copyWith => _$LoginDataCopyWithImpl<LoginData>(this as LoginData, _$identity);

  /// Serializes this LoginData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginData&&(identical(other.token, token) || other.token == token)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.me, me) || other.me == me));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,tokenType,me);

@override
String toString() {
  return 'LoginData(token: $token, tokenType: $tokenType, me: $me)';
}


}

/// @nodoc
abstract mixin class $LoginDataCopyWith<$Res>  {
  factory $LoginDataCopyWith(LoginData value, $Res Function(LoginData) _then) = _$LoginDataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "token") String token,@JsonKey(name: "token_type") String? tokenType,@JsonKey(name: "me") LoginMe me
});


$LoginMeCopyWith<$Res> get me;

}
/// @nodoc
class _$LoginDataCopyWithImpl<$Res>
    implements $LoginDataCopyWith<$Res> {
  _$LoginDataCopyWithImpl(this._self, this._then);

  final LoginData _self;
  final $Res Function(LoginData) _then;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? tokenType = freezed,Object? me = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,me: null == me ? _self.me : me // ignore: cast_nullable_to_non_nullable
as LoginMe,
  ));
}
/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginMeCopyWith<$Res> get me {
  
  return $LoginMeCopyWith<$Res>(_self.me, (value) {
    return _then(_self.copyWith(me: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginData].
extension LoginDataPatterns on LoginData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginData value)  $default,){
final _that = this;
switch (_that) {
case _LoginData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginData value)?  $default,){
final _that = this;
switch (_that) {
case _LoginData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "token")  String token, @JsonKey(name: "token_type")  String? tokenType, @JsonKey(name: "me")  LoginMe me)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginData() when $default != null:
return $default(_that.token,_that.tokenType,_that.me);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "token")  String token, @JsonKey(name: "token_type")  String? tokenType, @JsonKey(name: "me")  LoginMe me)  $default,) {final _that = this;
switch (_that) {
case _LoginData():
return $default(_that.token,_that.tokenType,_that.me);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "token")  String token, @JsonKey(name: "token_type")  String? tokenType, @JsonKey(name: "me")  LoginMe me)?  $default,) {final _that = this;
switch (_that) {
case _LoginData() when $default != null:
return $default(_that.token,_that.tokenType,_that.me);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginData implements LoginData {
  const _LoginData({@JsonKey(name: "token") required this.token, @JsonKey(name: "token_type") this.tokenType, @JsonKey(name: "me") required this.me});
  factory _LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);

@override@JsonKey(name: "token") final  String token;
@override@JsonKey(name: "token_type") final  String? tokenType;
@override@JsonKey(name: "me") final  LoginMe me;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginDataCopyWith<_LoginData> get copyWith => __$LoginDataCopyWithImpl<_LoginData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginData&&(identical(other.token, token) || other.token == token)&&(identical(other.tokenType, tokenType) || other.tokenType == tokenType)&&(identical(other.me, me) || other.me == me));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,tokenType,me);

@override
String toString() {
  return 'LoginData(token: $token, tokenType: $tokenType, me: $me)';
}


}

/// @nodoc
abstract mixin class _$LoginDataCopyWith<$Res> implements $LoginDataCopyWith<$Res> {
  factory _$LoginDataCopyWith(_LoginData value, $Res Function(_LoginData) _then) = __$LoginDataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "token") String token,@JsonKey(name: "token_type") String? tokenType,@JsonKey(name: "me") LoginMe me
});


@override $LoginMeCopyWith<$Res> get me;

}
/// @nodoc
class __$LoginDataCopyWithImpl<$Res>
    implements _$LoginDataCopyWith<$Res> {
  __$LoginDataCopyWithImpl(this._self, this._then);

  final _LoginData _self;
  final $Res Function(_LoginData) _then;

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? tokenType = freezed,Object? me = null,}) {
  return _then(_LoginData(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,tokenType: freezed == tokenType ? _self.tokenType : tokenType // ignore: cast_nullable_to_non_nullable
as String?,me: null == me ? _self.me : me // ignore: cast_nullable_to_non_nullable
as LoginMe,
  ));
}

/// Create a copy of LoginData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginMeCopyWith<$Res> get me {
  
  return $LoginMeCopyWith<$Res>(_self.me, (value) {
    return _then(_self.copyWith(me: value));
  });
}
}


/// @nodoc
mixin _$LoginMe {

@JsonKey(name: "user") LoginUser get user;@JsonKey(name: "employee") LoginEmployee? get employee;@JsonKey(name: "tenant") LoginTenant? get tenant;@JsonKey(name: "limits") LoginLimits? get limits;
/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginMeCopyWith<LoginMe> get copyWith => _$LoginMeCopyWithImpl<LoginMe>(this as LoginMe, _$identity);

  /// Serializes this LoginMe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginMe&&(identical(other.user, user) || other.user == user)&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.tenant, tenant) || other.tenant == tenant)&&(identical(other.limits, limits) || other.limits == limits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,employee,tenant,limits);

@override
String toString() {
  return 'LoginMe(user: $user, employee: $employee, tenant: $tenant, limits: $limits)';
}


}

/// @nodoc
abstract mixin class $LoginMeCopyWith<$Res>  {
  factory $LoginMeCopyWith(LoginMe value, $Res Function(LoginMe) _then) = _$LoginMeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "user") LoginUser user,@JsonKey(name: "employee") LoginEmployee? employee,@JsonKey(name: "tenant") LoginTenant? tenant,@JsonKey(name: "limits") LoginLimits? limits
});


$LoginUserCopyWith<$Res> get user;$LoginEmployeeCopyWith<$Res>? get employee;$LoginTenantCopyWith<$Res>? get tenant;$LoginLimitsCopyWith<$Res>? get limits;

}
/// @nodoc
class _$LoginMeCopyWithImpl<$Res>
    implements $LoginMeCopyWith<$Res> {
  _$LoginMeCopyWithImpl(this._self, this._then);

  final LoginMe _self;
  final $Res Function(LoginMe) _then;

/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? employee = freezed,Object? tenant = freezed,Object? limits = freezed,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as LoginUser,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as LoginEmployee?,tenant: freezed == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as LoginTenant?,limits: freezed == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as LoginLimits?,
  ));
}
/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginUserCopyWith<$Res> get user {
  
  return $LoginUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginEmployeeCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $LoginEmployeeCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginTenantCopyWith<$Res>? get tenant {
    if (_self.tenant == null) {
    return null;
  }

  return $LoginTenantCopyWith<$Res>(_self.tenant!, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginLimitsCopyWith<$Res>? get limits {
    if (_self.limits == null) {
    return null;
  }

  return $LoginLimitsCopyWith<$Res>(_self.limits!, (value) {
    return _then(_self.copyWith(limits: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginMe].
extension LoginMePatterns on LoginMe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginMe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginMe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginMe value)  $default,){
final _that = this;
switch (_that) {
case _LoginMe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginMe value)?  $default,){
final _that = this;
switch (_that) {
case _LoginMe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "user")  LoginUser user, @JsonKey(name: "employee")  LoginEmployee? employee, @JsonKey(name: "tenant")  LoginTenant? tenant, @JsonKey(name: "limits")  LoginLimits? limits)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginMe() when $default != null:
return $default(_that.user,_that.employee,_that.tenant,_that.limits);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "user")  LoginUser user, @JsonKey(name: "employee")  LoginEmployee? employee, @JsonKey(name: "tenant")  LoginTenant? tenant, @JsonKey(name: "limits")  LoginLimits? limits)  $default,) {final _that = this;
switch (_that) {
case _LoginMe():
return $default(_that.user,_that.employee,_that.tenant,_that.limits);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "user")  LoginUser user, @JsonKey(name: "employee")  LoginEmployee? employee, @JsonKey(name: "tenant")  LoginTenant? tenant, @JsonKey(name: "limits")  LoginLimits? limits)?  $default,) {final _that = this;
switch (_that) {
case _LoginMe() when $default != null:
return $default(_that.user,_that.employee,_that.tenant,_that.limits);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginMe implements LoginMe {
  const _LoginMe({@JsonKey(name: "user") required this.user, @JsonKey(name: "employee") this.employee, @JsonKey(name: "tenant") this.tenant, @JsonKey(name: "limits") this.limits});
  factory _LoginMe.fromJson(Map<String, dynamic> json) => _$LoginMeFromJson(json);

@override@JsonKey(name: "user") final  LoginUser user;
@override@JsonKey(name: "employee") final  LoginEmployee? employee;
@override@JsonKey(name: "tenant") final  LoginTenant? tenant;
@override@JsonKey(name: "limits") final  LoginLimits? limits;

/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginMeCopyWith<_LoginMe> get copyWith => __$LoginMeCopyWithImpl<_LoginMe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginMeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginMe&&(identical(other.user, user) || other.user == user)&&(identical(other.employee, employee) || other.employee == employee)&&(identical(other.tenant, tenant) || other.tenant == tenant)&&(identical(other.limits, limits) || other.limits == limits));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,employee,tenant,limits);

@override
String toString() {
  return 'LoginMe(user: $user, employee: $employee, tenant: $tenant, limits: $limits)';
}


}

/// @nodoc
abstract mixin class _$LoginMeCopyWith<$Res> implements $LoginMeCopyWith<$Res> {
  factory _$LoginMeCopyWith(_LoginMe value, $Res Function(_LoginMe) _then) = __$LoginMeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "user") LoginUser user,@JsonKey(name: "employee") LoginEmployee? employee,@JsonKey(name: "tenant") LoginTenant? tenant,@JsonKey(name: "limits") LoginLimits? limits
});


@override $LoginUserCopyWith<$Res> get user;@override $LoginEmployeeCopyWith<$Res>? get employee;@override $LoginTenantCopyWith<$Res>? get tenant;@override $LoginLimitsCopyWith<$Res>? get limits;

}
/// @nodoc
class __$LoginMeCopyWithImpl<$Res>
    implements _$LoginMeCopyWith<$Res> {
  __$LoginMeCopyWithImpl(this._self, this._then);

  final _LoginMe _self;
  final $Res Function(_LoginMe) _then;

/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? employee = freezed,Object? tenant = freezed,Object? limits = freezed,}) {
  return _then(_LoginMe(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as LoginUser,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as LoginEmployee?,tenant: freezed == tenant ? _self.tenant : tenant // ignore: cast_nullable_to_non_nullable
as LoginTenant?,limits: freezed == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as LoginLimits?,
  ));
}

/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginUserCopyWith<$Res> get user {
  
  return $LoginUserCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginEmployeeCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $LoginEmployeeCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginTenantCopyWith<$Res>? get tenant {
    if (_self.tenant == null) {
    return null;
  }

  return $LoginTenantCopyWith<$Res>(_self.tenant!, (value) {
    return _then(_self.copyWith(tenant: value));
  });
}/// Create a copy of LoginMe
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginLimitsCopyWith<$Res>? get limits {
    if (_self.limits == null) {
    return null;
  }

  return $LoginLimitsCopyWith<$Res>(_self.limits!, (value) {
    return _then(_self.copyWith(limits: value));
  });
}
}


/// @nodoc
mixin _$LoginUser {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String get name;@JsonKey(name: "email") String? get email;
/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginUserCopyWith<LoginUser> get copyWith => _$LoginUserCopyWithImpl<LoginUser>(this as LoginUser, _$identity);

  /// Serializes this LoginUser to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email);

@override
String toString() {
  return 'LoginUser(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class $LoginUserCopyWith<$Res>  {
  factory $LoginUserCopyWith(LoginUser value, $Res Function(LoginUser) _then) = _$LoginUserCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String name,@JsonKey(name: "email") String? email
});




}
/// @nodoc
class _$LoginUserCopyWithImpl<$Res>
    implements $LoginUserCopyWith<$Res> {
  _$LoginUserCopyWithImpl(this._self, this._then);

  final LoginUser _self;
  final $Res Function(LoginUser) _then;

/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? email = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginUser].
extension LoginUserPatterns on LoginUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginUser value)  $default,){
final _that = this;
switch (_that) {
case _LoginUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginUser value)?  $default,){
final _that = this;
switch (_that) {
case _LoginUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String name, @JsonKey(name: "email")  String? email)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginUser() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String name, @JsonKey(name: "email")  String? email)  $default,) {final _that = this;
switch (_that) {
case _LoginUser():
return $default(_that.id,_that.name,_that.email);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String name, @JsonKey(name: "email")  String? email)?  $default,) {final _that = this;
switch (_that) {
case _LoginUser() when $default != null:
return $default(_that.id,_that.name,_that.email);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginUser implements LoginUser {
  const _LoginUser({@JsonKey(name: "id") this.id, @JsonKey(name: "name") required this.name, @JsonKey(name: "email") this.email});
  factory _LoginUser.fromJson(Map<String, dynamic> json) => _$LoginUserFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "email") final  String? email;

/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginUserCopyWith<_LoginUser> get copyWith => __$LoginUserCopyWithImpl<_LoginUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginUserToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginUser&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,email);

@override
String toString() {
  return 'LoginUser(id: $id, name: $name, email: $email)';
}


}

/// @nodoc
abstract mixin class _$LoginUserCopyWith<$Res> implements $LoginUserCopyWith<$Res> {
  factory _$LoginUserCopyWith(_LoginUser value, $Res Function(_LoginUser) _then) = __$LoginUserCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String name,@JsonKey(name: "email") String? email
});




}
/// @nodoc
class __$LoginUserCopyWithImpl<$Res>
    implements _$LoginUserCopyWith<$Res> {
  __$LoginUserCopyWithImpl(this._self, this._then);

  final _LoginUser _self;
  final $Res Function(_LoginUser) _then;

/// Create a copy of LoginUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? email = freezed,}) {
  return _then(_LoginUser(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LoginEmployee {

@JsonKey(name: "id") int? get id;@JsonKey(name: "slug") String? get slug;@JsonKey(name: "title") String? get title;@JsonKey(name: "title_en") String? get titleEn;@JsonKey(name: "appointment_status") String? get appointmentStatus;@JsonKey(name: "photo_url") String? get photoUrl;@JsonKey(name: "photo_thumb_url") String? get photoThumbUrl;
/// Create a copy of LoginEmployee
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginEmployeeCopyWith<LoginEmployee> get copyWith => _$LoginEmployeeCopyWithImpl<LoginEmployee>(this as LoginEmployee, _$identity);

  /// Serializes this LoginEmployee to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEmployee&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.appointmentStatus, appointmentStatus) || other.appointmentStatus == appointmentStatus)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoThumbUrl, photoThumbUrl) || other.photoThumbUrl == photoThumbUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,titleEn,appointmentStatus,photoUrl,photoThumbUrl);

@override
String toString() {
  return 'LoginEmployee(id: $id, slug: $slug, title: $title, titleEn: $titleEn, appointmentStatus: $appointmentStatus, photoUrl: $photoUrl, photoThumbUrl: $photoThumbUrl)';
}


}

/// @nodoc
abstract mixin class $LoginEmployeeCopyWith<$Res>  {
  factory $LoginEmployeeCopyWith(LoginEmployee value, $Res Function(LoginEmployee) _then) = _$LoginEmployeeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "slug") String? slug,@JsonKey(name: "title") String? title,@JsonKey(name: "title_en") String? titleEn,@JsonKey(name: "appointment_status") String? appointmentStatus,@JsonKey(name: "photo_url") String? photoUrl,@JsonKey(name: "photo_thumb_url") String? photoThumbUrl
});




}
/// @nodoc
class _$LoginEmployeeCopyWithImpl<$Res>
    implements $LoginEmployeeCopyWith<$Res> {
  _$LoginEmployeeCopyWithImpl(this._self, this._then);

  final LoginEmployee _self;
  final $Res Function(LoginEmployee) _then;

/// Create a copy of LoginEmployee
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? slug = freezed,Object? title = freezed,Object? titleEn = freezed,Object? appointmentStatus = freezed,Object? photoUrl = freezed,Object? photoThumbUrl = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleEn: freezed == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String?,appointmentStatus: freezed == appointmentStatus ? _self.appointmentStatus : appointmentStatus // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoThumbUrl: freezed == photoThumbUrl ? _self.photoThumbUrl : photoThumbUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginEmployee].
extension LoginEmployeePatterns on LoginEmployee {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginEmployee value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginEmployee() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginEmployee value)  $default,){
final _that = this;
switch (_that) {
case _LoginEmployee():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginEmployee value)?  $default,){
final _that = this;
switch (_that) {
case _LoginEmployee() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "title")  String? title, @JsonKey(name: "title_en")  String? titleEn, @JsonKey(name: "appointment_status")  String? appointmentStatus, @JsonKey(name: "photo_url")  String? photoUrl, @JsonKey(name: "photo_thumb_url")  String? photoThumbUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginEmployee() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.titleEn,_that.appointmentStatus,_that.photoUrl,_that.photoThumbUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "title")  String? title, @JsonKey(name: "title_en")  String? titleEn, @JsonKey(name: "appointment_status")  String? appointmentStatus, @JsonKey(name: "photo_url")  String? photoUrl, @JsonKey(name: "photo_thumb_url")  String? photoThumbUrl)  $default,) {final _that = this;
switch (_that) {
case _LoginEmployee():
return $default(_that.id,_that.slug,_that.title,_that.titleEn,_that.appointmentStatus,_that.photoUrl,_that.photoThumbUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "slug")  String? slug, @JsonKey(name: "title")  String? title, @JsonKey(name: "title_en")  String? titleEn, @JsonKey(name: "appointment_status")  String? appointmentStatus, @JsonKey(name: "photo_url")  String? photoUrl, @JsonKey(name: "photo_thumb_url")  String? photoThumbUrl)?  $default,) {final _that = this;
switch (_that) {
case _LoginEmployee() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.titleEn,_that.appointmentStatus,_that.photoUrl,_that.photoThumbUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginEmployee implements LoginEmployee {
  const _LoginEmployee({@JsonKey(name: "id") this.id, @JsonKey(name: "slug") this.slug, @JsonKey(name: "title") this.title, @JsonKey(name: "title_en") this.titleEn, @JsonKey(name: "appointment_status") this.appointmentStatus, @JsonKey(name: "photo_url") this.photoUrl, @JsonKey(name: "photo_thumb_url") this.photoThumbUrl});
  factory _LoginEmployee.fromJson(Map<String, dynamic> json) => _$LoginEmployeeFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "slug") final  String? slug;
@override@JsonKey(name: "title") final  String? title;
@override@JsonKey(name: "title_en") final  String? titleEn;
@override@JsonKey(name: "appointment_status") final  String? appointmentStatus;
@override@JsonKey(name: "photo_url") final  String? photoUrl;
@override@JsonKey(name: "photo_thumb_url") final  String? photoThumbUrl;

/// Create a copy of LoginEmployee
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginEmployeeCopyWith<_LoginEmployee> get copyWith => __$LoginEmployeeCopyWithImpl<_LoginEmployee>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginEmployeeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginEmployee&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&(identical(other.appointmentStatus, appointmentStatus) || other.appointmentStatus == appointmentStatus)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoThumbUrl, photoThumbUrl) || other.photoThumbUrl == photoThumbUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,titleEn,appointmentStatus,photoUrl,photoThumbUrl);

@override
String toString() {
  return 'LoginEmployee(id: $id, slug: $slug, title: $title, titleEn: $titleEn, appointmentStatus: $appointmentStatus, photoUrl: $photoUrl, photoThumbUrl: $photoThumbUrl)';
}


}

/// @nodoc
abstract mixin class _$LoginEmployeeCopyWith<$Res> implements $LoginEmployeeCopyWith<$Res> {
  factory _$LoginEmployeeCopyWith(_LoginEmployee value, $Res Function(_LoginEmployee) _then) = __$LoginEmployeeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "slug") String? slug,@JsonKey(name: "title") String? title,@JsonKey(name: "title_en") String? titleEn,@JsonKey(name: "appointment_status") String? appointmentStatus,@JsonKey(name: "photo_url") String? photoUrl,@JsonKey(name: "photo_thumb_url") String? photoThumbUrl
});




}
/// @nodoc
class __$LoginEmployeeCopyWithImpl<$Res>
    implements _$LoginEmployeeCopyWith<$Res> {
  __$LoginEmployeeCopyWithImpl(this._self, this._then);

  final _LoginEmployee _self;
  final $Res Function(_LoginEmployee) _then;

/// Create a copy of LoginEmployee
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? slug = freezed,Object? title = freezed,Object? titleEn = freezed,Object? appointmentStatus = freezed,Object? photoUrl = freezed,Object? photoThumbUrl = freezed,}) {
  return _then(_LoginEmployee(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleEn: freezed == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String?,appointmentStatus: freezed == appointmentStatus ? _self.appointmentStatus : appointmentStatus // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoThumbUrl: freezed == photoThumbUrl ? _self.photoThumbUrl : photoThumbUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LoginTenant {

@JsonKey(name: "id") int? get id;@JsonKey(name: "name") String? get name;@JsonKey(name: "slug") String? get slug;
/// Create a copy of LoginTenant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginTenantCopyWith<LoginTenant> get copyWith => _$LoginTenantCopyWithImpl<LoginTenant>(this as LoginTenant, _$identity);

  /// Serializes this LoginTenant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginTenant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'LoginTenant(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class $LoginTenantCopyWith<$Res>  {
  factory $LoginTenantCopyWith(LoginTenant value, $Res Function(LoginTenant) _then) = _$LoginTenantCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug
});




}
/// @nodoc
class _$LoginTenantCopyWithImpl<$Res>
    implements $LoginTenantCopyWith<$Res> {
  _$LoginTenantCopyWithImpl(this._self, this._then);

  final LoginTenant _self;
  final $Res Function(LoginTenant) _then;

/// Create a copy of LoginTenant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginTenant].
extension LoginTenantPatterns on LoginTenant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginTenant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginTenant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginTenant value)  $default,){
final _that = this;
switch (_that) {
case _LoginTenant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginTenant value)?  $default,){
final _that = this;
switch (_that) {
case _LoginTenant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "slug")  String? slug)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginTenant() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "slug")  String? slug)  $default,) {final _that = this;
switch (_that) {
case _LoginTenant():
return $default(_that.id,_that.name,_that.slug);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int? id, @JsonKey(name: "name")  String? name, @JsonKey(name: "slug")  String? slug)?  $default,) {final _that = this;
switch (_that) {
case _LoginTenant() when $default != null:
return $default(_that.id,_that.name,_that.slug);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginTenant implements LoginTenant {
  const _LoginTenant({@JsonKey(name: "id") this.id, @JsonKey(name: "name") this.name, @JsonKey(name: "slug") this.slug});
  factory _LoginTenant.fromJson(Map<String, dynamic> json) => _$LoginTenantFromJson(json);

@override@JsonKey(name: "id") final  int? id;
@override@JsonKey(name: "name") final  String? name;
@override@JsonKey(name: "slug") final  String? slug;

/// Create a copy of LoginTenant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginTenantCopyWith<_LoginTenant> get copyWith => __$LoginTenantCopyWithImpl<_LoginTenant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginTenantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginTenant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug);

@override
String toString() {
  return 'LoginTenant(id: $id, name: $name, slug: $slug)';
}


}

/// @nodoc
abstract mixin class _$LoginTenantCopyWith<$Res> implements $LoginTenantCopyWith<$Res> {
  factory _$LoginTenantCopyWith(_LoginTenant value, $Res Function(_LoginTenant) _then) = __$LoginTenantCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int? id,@JsonKey(name: "name") String? name,@JsonKey(name: "slug") String? slug
});




}
/// @nodoc
class __$LoginTenantCopyWithImpl<$Res>
    implements _$LoginTenantCopyWith<$Res> {
  __$LoginTenantCopyWithImpl(this._self, this._then);

  final _LoginTenant _self;
  final $Res Function(_LoginTenant) _then;

/// Create a copy of LoginTenant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? slug = freezed,}) {
  return _then(_LoginTenant(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$LoginLimits {

@JsonKey(name: "current") int? get current;@JsonKey(name: "max") int? get max;@JsonKey(name: "has_license") bool? get hasLicense;
/// Create a copy of LoginLimits
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginLimitsCopyWith<LoginLimits> get copyWith => _$LoginLimitsCopyWithImpl<LoginLimits>(this as LoginLimits, _$identity);

  /// Serializes this LoginLimits to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginLimits&&(identical(other.current, current) || other.current == current)&&(identical(other.max, max) || other.max == max)&&(identical(other.hasLicense, hasLicense) || other.hasLicense == hasLicense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,max,hasLicense);

@override
String toString() {
  return 'LoginLimits(current: $current, max: $max, hasLicense: $hasLicense)';
}


}

/// @nodoc
abstract mixin class $LoginLimitsCopyWith<$Res>  {
  factory $LoginLimitsCopyWith(LoginLimits value, $Res Function(LoginLimits) _then) = _$LoginLimitsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "current") int? current,@JsonKey(name: "max") int? max,@JsonKey(name: "has_license") bool? hasLicense
});




}
/// @nodoc
class _$LoginLimitsCopyWithImpl<$Res>
    implements $LoginLimitsCopyWith<$Res> {
  _$LoginLimitsCopyWithImpl(this._self, this._then);

  final LoginLimits _self;
  final $Res Function(LoginLimits) _then;

/// Create a copy of LoginLimits
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = freezed,Object? max = freezed,Object? hasLicense = freezed,}) {
  return _then(_self.copyWith(
current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,hasLicense: freezed == hasLicense ? _self.hasLicense : hasLicense // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginLimits].
extension LoginLimitsPatterns on LoginLimits {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginLimits value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginLimits() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginLimits value)  $default,){
final _that = this;
switch (_that) {
case _LoginLimits():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginLimits value)?  $default,){
final _that = this;
switch (_that) {
case _LoginLimits() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "current")  int? current, @JsonKey(name: "max")  int? max, @JsonKey(name: "has_license")  bool? hasLicense)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginLimits() when $default != null:
return $default(_that.current,_that.max,_that.hasLicense);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "current")  int? current, @JsonKey(name: "max")  int? max, @JsonKey(name: "has_license")  bool? hasLicense)  $default,) {final _that = this;
switch (_that) {
case _LoginLimits():
return $default(_that.current,_that.max,_that.hasLicense);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "current")  int? current, @JsonKey(name: "max")  int? max, @JsonKey(name: "has_license")  bool? hasLicense)?  $default,) {final _that = this;
switch (_that) {
case _LoginLimits() when $default != null:
return $default(_that.current,_that.max,_that.hasLicense);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginLimits implements LoginLimits {
  const _LoginLimits({@JsonKey(name: "current") this.current, @JsonKey(name: "max") this.max, @JsonKey(name: "has_license") this.hasLicense});
  factory _LoginLimits.fromJson(Map<String, dynamic> json) => _$LoginLimitsFromJson(json);

@override@JsonKey(name: "current") final  int? current;
@override@JsonKey(name: "max") final  int? max;
@override@JsonKey(name: "has_license") final  bool? hasLicense;

/// Create a copy of LoginLimits
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginLimitsCopyWith<_LoginLimits> get copyWith => __$LoginLimitsCopyWithImpl<_LoginLimits>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginLimitsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginLimits&&(identical(other.current, current) || other.current == current)&&(identical(other.max, max) || other.max == max)&&(identical(other.hasLicense, hasLicense) || other.hasLicense == hasLicense));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,max,hasLicense);

@override
String toString() {
  return 'LoginLimits(current: $current, max: $max, hasLicense: $hasLicense)';
}


}

/// @nodoc
abstract mixin class _$LoginLimitsCopyWith<$Res> implements $LoginLimitsCopyWith<$Res> {
  factory _$LoginLimitsCopyWith(_LoginLimits value, $Res Function(_LoginLimits) _then) = __$LoginLimitsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "current") int? current,@JsonKey(name: "max") int? max,@JsonKey(name: "has_license") bool? hasLicense
});




}
/// @nodoc
class __$LoginLimitsCopyWithImpl<$Res>
    implements _$LoginLimitsCopyWith<$Res> {
  __$LoginLimitsCopyWithImpl(this._self, this._then);

  final _LoginLimits _self;
  final $Res Function(_LoginLimits) _then;

/// Create a copy of LoginLimits
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = freezed,Object? max = freezed,Object? hasLicense = freezed,}) {
  return _then(_LoginLimits(
current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int?,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,hasLicense: freezed == hasLicense ? _self.hasLicense : hasLicense // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
