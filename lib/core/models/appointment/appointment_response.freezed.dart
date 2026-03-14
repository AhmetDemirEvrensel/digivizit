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
mixin _$AppointmentResponse {

@JsonKey(name: "success") bool get success;@JsonKey(name: "message") String get message;@JsonKey(name: "data") List<Datum> get data;
/// Create a copy of AppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentResponseCopyWith<AppointmentResponse> get copyWith => _$AppointmentResponseCopyWithImpl<AppointmentResponse>(this as AppointmentResponse, _$identity);

  /// Serializes this AppointmentResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'AppointmentResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class $AppointmentResponseCopyWith<$Res>  {
  factory $AppointmentResponseCopyWith(AppointmentResponse value, $Res Function(AppointmentResponse) _then) = _$AppointmentResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message,@JsonKey(name: "data") List<Datum> data
});




}
/// @nodoc
class _$AppointmentResponseCopyWithImpl<$Res>
    implements $AppointmentResponseCopyWith<$Res> {
  _$AppointmentResponseCopyWithImpl(this._self, this._then);

  final AppointmentResponse _self;
  final $Res Function(AppointmentResponse) _then;

/// Create a copy of AppointmentResponse
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


/// Adds pattern-matching-related methods to [AppointmentResponse].
extension AppointmentResponsePatterns on AppointmentResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentResponse value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentResponse value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentResponse() when $default != null:
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
case _AppointmentResponse() when $default != null:
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
case _AppointmentResponse():
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
case _AppointmentResponse() when $default != null:
return $default(_that.success,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentResponse implements AppointmentResponse {
  const _AppointmentResponse({@JsonKey(name: "success") required this.success, @JsonKey(name: "message") required this.message, @JsonKey(name: "data") required final  List<Datum> data}): _data = data;
  factory _AppointmentResponse.fromJson(Map<String, dynamic> json) => _$AppointmentResponseFromJson(json);

@override@JsonKey(name: "success") final  bool success;
@override@JsonKey(name: "message") final  String message;
 final  List<Datum> _data;
@override@JsonKey(name: "data") List<Datum> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of AppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentResponseCopyWith<_AppointmentResponse> get copyWith => __$AppointmentResponseCopyWithImpl<_AppointmentResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentResponse&&(identical(other.success, success) || other.success == success)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,success,message,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'AppointmentResponse(success: $success, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AppointmentResponseCopyWith<$Res> implements $AppointmentResponseCopyWith<$Res> {
  factory _$AppointmentResponseCopyWith(_AppointmentResponse value, $Res Function(_AppointmentResponse) _then) = __$AppointmentResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "success") bool success,@JsonKey(name: "message") String message,@JsonKey(name: "data") List<Datum> data
});




}
/// @nodoc
class __$AppointmentResponseCopyWithImpl<$Res>
    implements _$AppointmentResponseCopyWith<$Res> {
  __$AppointmentResponseCopyWithImpl(this._self, this._then);

  final _AppointmentResponse _self;
  final $Res Function(_AppointmentResponse) _then;

/// Create a copy of AppointmentResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? success = null,Object? message = null,Object? data = null,}) {
  return _then(_AppointmentResponse(
success: null == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as bool,message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Datum>,
  ));
}


}


/// @nodoc
mixin _$Datum {

@JsonKey(name: "id") int get id;@JsonKey(name: "employee_id") int get employeeId;@JsonKey(name: "full_name") String get fullName;@JsonKey(name: "company") String get company;@JsonKey(name: "subject") String get subject;@JsonKey(name: "note") String get note;@JsonKey(name: "preferred_date") String get preferredDate;@JsonKey(name: "status") String get status;@JsonKey(name: "created_at") String get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "deleted_at") dynamic get deletedAt;@JsonKey(name: "employee") Employee get employee;
/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DatumCopyWith<Datum> get copyWith => _$DatumCopyWithImpl<Datum>(this as Datum, _$identity);

  /// Serializes this Datum to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Datum&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.company, company) || other.company == company)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.note, note) || other.note == note)&&(identical(other.preferredDate, preferredDate) || other.preferredDate == preferredDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.employee, employee) || other.employee == employee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,fullName,company,subject,note,preferredDate,status,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),employee);

@override
String toString() {
  return 'Datum(id: $id, employeeId: $employeeId, fullName: $fullName, company: $company, subject: $subject, note: $note, preferredDate: $preferredDate, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, employee: $employee)';
}


}

/// @nodoc
abstract mixin class $DatumCopyWith<$Res>  {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) _then) = _$DatumCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "employee_id") int employeeId,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "company") String company,@JsonKey(name: "subject") String subject,@JsonKey(name: "note") String note,@JsonKey(name: "preferred_date") String preferredDate,@JsonKey(name: "status") String status,@JsonKey(name: "created_at") String createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "employee") Employee employee
});


$EmployeeCopyWith<$Res> get employee;

}
/// @nodoc
class _$DatumCopyWithImpl<$Res>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._self, this._then);

  final Datum _self;
  final $Res Function(Datum) _then;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? employeeId = null,Object? fullName = null,Object? company = null,Object? subject = null,Object? note = null,Object? preferredDate = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? employee = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,preferredDate: null == preferredDate ? _self.preferredDate : preferredDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,employee: null == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as Employee,
  ));
}
/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeCopyWith<$Res> get employee {
  
  return $EmployeeCopyWith<$Res>(_self.employee, (value) {
    return _then(_self.copyWith(employee: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "employee_id")  int employeeId, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "company")  String company, @JsonKey(name: "subject")  String subject, @JsonKey(name: "note")  String note, @JsonKey(name: "preferred_date")  String preferredDate, @JsonKey(name: "status")  String status, @JsonKey(name: "created_at")  String createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "employee")  Employee employee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that.id,_that.employeeId,_that.fullName,_that.company,_that.subject,_that.note,_that.preferredDate,_that.status,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.employee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "employee_id")  int employeeId, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "company")  String company, @JsonKey(name: "subject")  String subject, @JsonKey(name: "note")  String note, @JsonKey(name: "preferred_date")  String preferredDate, @JsonKey(name: "status")  String status, @JsonKey(name: "created_at")  String createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "employee")  Employee employee)  $default,) {final _that = this;
switch (_that) {
case _Datum():
return $default(_that.id,_that.employeeId,_that.fullName,_that.company,_that.subject,_that.note,_that.preferredDate,_that.status,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.employee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "employee_id")  int employeeId, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "company")  String company, @JsonKey(name: "subject")  String subject, @JsonKey(name: "note")  String note, @JsonKey(name: "preferred_date")  String preferredDate, @JsonKey(name: "status")  String status, @JsonKey(name: "created_at")  String createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "employee")  Employee employee)?  $default,) {final _that = this;
switch (_that) {
case _Datum() when $default != null:
return $default(_that.id,_that.employeeId,_that.fullName,_that.company,_that.subject,_that.note,_that.preferredDate,_that.status,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.employee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Datum implements Datum {
  const _Datum({@JsonKey(name: "id") required this.id, @JsonKey(name: "employee_id") required this.employeeId, @JsonKey(name: "full_name") required this.fullName, @JsonKey(name: "company") required this.company, @JsonKey(name: "subject") required this.subject, @JsonKey(name: "note") required this.note, @JsonKey(name: "preferred_date") required this.preferredDate, @JsonKey(name: "status") required this.status, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "deleted_at") required this.deletedAt, @JsonKey(name: "employee") required this.employee});
  factory _Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "employee_id") final  int employeeId;
@override@JsonKey(name: "full_name") final  String fullName;
@override@JsonKey(name: "company") final  String company;
@override@JsonKey(name: "subject") final  String subject;
@override@JsonKey(name: "note") final  String note;
@override@JsonKey(name: "preferred_date") final  String preferredDate;
@override@JsonKey(name: "status") final  String status;
@override@JsonKey(name: "created_at") final  String createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override@JsonKey(name: "deleted_at") final  dynamic deletedAt;
@override@JsonKey(name: "employee") final  Employee employee;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Datum&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.company, company) || other.company == company)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.note, note) || other.note == note)&&(identical(other.preferredDate, preferredDate) || other.preferredDate == preferredDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.employee, employee) || other.employee == employee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,employeeId,fullName,company,subject,note,preferredDate,status,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),employee);

@override
String toString() {
  return 'Datum(id: $id, employeeId: $employeeId, fullName: $fullName, company: $company, subject: $subject, note: $note, preferredDate: $preferredDate, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, employee: $employee)';
}


}

/// @nodoc
abstract mixin class _$DatumCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$DatumCopyWith(_Datum value, $Res Function(_Datum) _then) = __$DatumCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "employee_id") int employeeId,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "company") String company,@JsonKey(name: "subject") String subject,@JsonKey(name: "note") String note,@JsonKey(name: "preferred_date") String preferredDate,@JsonKey(name: "status") String status,@JsonKey(name: "created_at") String createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "employee") Employee employee
});


@override $EmployeeCopyWith<$Res> get employee;

}
/// @nodoc
class __$DatumCopyWithImpl<$Res>
    implements _$DatumCopyWith<$Res> {
  __$DatumCopyWithImpl(this._self, this._then);

  final _Datum _self;
  final $Res Function(_Datum) _then;

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? employeeId = null,Object? fullName = null,Object? company = null,Object? subject = null,Object? note = null,Object? preferredDate = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? employee = null,}) {
  return _then(_Datum(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,preferredDate: null == preferredDate ? _self.preferredDate : preferredDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,employee: null == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as Employee,
  ));
}

/// Create a copy of Datum
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeCopyWith<$Res> get employee {
  
  return $EmployeeCopyWith<$Res>(_self.employee, (value) {
    return _then(_self.copyWith(employee: value));
  });
}
}


/// @nodoc
mixin _$Employee {

@JsonKey(name: "id") int get id;@JsonKey(name: "user") int get user;@JsonKey(name: "name") String get name;@JsonKey(name: "surname") String get surname;@JsonKey(name: "title") String get title;@JsonKey(name: "email") String get email;@JsonKey(name: "phone") String get phone;@JsonKey(name: "extension_number") dynamic get extensionNumber;@JsonKey(name: "qr") int get qr;@JsonKey(name: "qr_code_url") String get qrCodeUrl;@JsonKey(name: "instagram_url") String get instagramUrl;@JsonKey(name: "linkedin_url") String get linkedinUrl;@JsonKey(name: "appointment_status") String get appointmentStatus;@JsonKey(name: "date") DateTime get date;@JsonKey(name: "status") String get status;@JsonKey(name: "slug") String get slug;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "deleted_at") dynamic get deletedAt;@JsonKey(name: "firm_name_id") int get firmNameId;@JsonKey(name: "department_id") dynamic get departmentId;@JsonKey(name: "office_address_id") int get officeAddressId;@JsonKey(name: "title_en") String get titleEn;@JsonKey(name: "department") dynamic get department;@JsonKey(name: "department_en") String get departmentEn;@JsonKey(name: "photo") Photo get photo;@JsonKey(name: "qr_photo") Photo get qrPhoto;@JsonKey(name: "media") List<Photo> get media;
/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeCopyWith<Employee> get copyWith => _$EmployeeCopyWithImpl<Employee>(this as Employee, _$identity);

  /// Serializes this Employee to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Employee&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.title, title) || other.title == title)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other.extensionNumber, extensionNumber)&&(identical(other.qr, qr) || other.qr == qr)&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.appointmentStatus, appointmentStatus) || other.appointmentStatus == appointmentStatus)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.firmNameId, firmNameId) || other.firmNameId == firmNameId)&&const DeepCollectionEquality().equals(other.departmentId, departmentId)&&(identical(other.officeAddressId, officeAddressId) || other.officeAddressId == officeAddressId)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&const DeepCollectionEquality().equals(other.department, department)&&(identical(other.departmentEn, departmentEn) || other.departmentEn == departmentEn)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.qrPhoto, qrPhoto) || other.qrPhoto == qrPhoto)&&const DeepCollectionEquality().equals(other.media, media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,user,name,surname,title,email,phone,const DeepCollectionEquality().hash(extensionNumber),qr,qrCodeUrl,instagramUrl,linkedinUrl,appointmentStatus,date,status,slug,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),firmNameId,const DeepCollectionEquality().hash(departmentId),officeAddressId,titleEn,const DeepCollectionEquality().hash(department),departmentEn,photo,qrPhoto,const DeepCollectionEquality().hash(media)]);

@override
String toString() {
  return 'Employee(id: $id, user: $user, name: $name, surname: $surname, title: $title, email: $email, phone: $phone, extensionNumber: $extensionNumber, qr: $qr, qrCodeUrl: $qrCodeUrl, instagramUrl: $instagramUrl, linkedinUrl: $linkedinUrl, appointmentStatus: $appointmentStatus, date: $date, status: $status, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, firmNameId: $firmNameId, departmentId: $departmentId, officeAddressId: $officeAddressId, titleEn: $titleEn, department: $department, departmentEn: $departmentEn, photo: $photo, qrPhoto: $qrPhoto, media: $media)';
}


}

/// @nodoc
abstract mixin class $EmployeeCopyWith<$Res>  {
  factory $EmployeeCopyWith(Employee value, $Res Function(Employee) _then) = _$EmployeeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "user") int user,@JsonKey(name: "name") String name,@JsonKey(name: "surname") String surname,@JsonKey(name: "title") String title,@JsonKey(name: "email") String email,@JsonKey(name: "phone") String phone,@JsonKey(name: "extension_number") dynamic extensionNumber,@JsonKey(name: "qr") int qr,@JsonKey(name: "qr_code_url") String qrCodeUrl,@JsonKey(name: "instagram_url") String instagramUrl,@JsonKey(name: "linkedin_url") String linkedinUrl,@JsonKey(name: "appointment_status") String appointmentStatus,@JsonKey(name: "date") DateTime date,@JsonKey(name: "status") String status,@JsonKey(name: "slug") String slug,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "firm_name_id") int firmNameId,@JsonKey(name: "department_id") dynamic departmentId,@JsonKey(name: "office_address_id") int officeAddressId,@JsonKey(name: "title_en") String titleEn,@JsonKey(name: "department") dynamic department,@JsonKey(name: "department_en") String departmentEn,@JsonKey(name: "photo") Photo photo,@JsonKey(name: "qr_photo") Photo qrPhoto,@JsonKey(name: "media") List<Photo> media
});


$PhotoCopyWith<$Res> get photo;$PhotoCopyWith<$Res> get qrPhoto;

}
/// @nodoc
class _$EmployeeCopyWithImpl<$Res>
    implements $EmployeeCopyWith<$Res> {
  _$EmployeeCopyWithImpl(this._self, this._then);

  final Employee _self;
  final $Res Function(Employee) _then;

/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? user = null,Object? name = null,Object? surname = null,Object? title = null,Object? email = null,Object? phone = null,Object? extensionNumber = freezed,Object? qr = null,Object? qrCodeUrl = null,Object? instagramUrl = null,Object? linkedinUrl = null,Object? appointmentStatus = null,Object? date = null,Object? status = null,Object? slug = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? firmNameId = null,Object? departmentId = freezed,Object? officeAddressId = null,Object? titleEn = null,Object? department = freezed,Object? departmentEn = null,Object? photo = null,Object? qrPhoto = null,Object? media = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,extensionNumber: freezed == extensionNumber ? _self.extensionNumber : extensionNumber // ignore: cast_nullable_to_non_nullable
as dynamic,qr: null == qr ? _self.qr : qr // ignore: cast_nullable_to_non_nullable
as int,qrCodeUrl: null == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String,instagramUrl: null == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String,linkedinUrl: null == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as String,appointmentStatus: null == appointmentStatus ? _self.appointmentStatus : appointmentStatus // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,firmNameId: null == firmNameId ? _self.firmNameId : firmNameId // ignore: cast_nullable_to_non_nullable
as int,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as dynamic,officeAddressId: null == officeAddressId ? _self.officeAddressId : officeAddressId // ignore: cast_nullable_to_non_nullable
as int,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as dynamic,departmentEn: null == departmentEn ? _self.departmentEn : departmentEn // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as Photo,qrPhoto: null == qrPhoto ? _self.qrPhoto : qrPhoto // ignore: cast_nullable_to_non_nullable
as Photo,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as List<Photo>,
  ));
}
/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoCopyWith<$Res> get photo {
  
  return $PhotoCopyWith<$Res>(_self.photo, (value) {
    return _then(_self.copyWith(photo: value));
  });
}/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoCopyWith<$Res> get qrPhoto {
  
  return $PhotoCopyWith<$Res>(_self.qrPhoto, (value) {
    return _then(_self.copyWith(qrPhoto: value));
  });
}
}


/// Adds pattern-matching-related methods to [Employee].
extension EmployeePatterns on Employee {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Employee value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Employee() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Employee value)  $default,){
final _that = this;
switch (_that) {
case _Employee():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Employee value)?  $default,){
final _that = this;
switch (_that) {
case _Employee() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "user")  int user, @JsonKey(name: "name")  String name, @JsonKey(name: "surname")  String surname, @JsonKey(name: "title")  String title, @JsonKey(name: "email")  String email, @JsonKey(name: "phone")  String phone, @JsonKey(name: "extension_number")  dynamic extensionNumber, @JsonKey(name: "qr")  int qr, @JsonKey(name: "qr_code_url")  String qrCodeUrl, @JsonKey(name: "instagram_url")  String instagramUrl, @JsonKey(name: "linkedin_url")  String linkedinUrl, @JsonKey(name: "appointment_status")  String appointmentStatus, @JsonKey(name: "date")  DateTime date, @JsonKey(name: "status")  String status, @JsonKey(name: "slug")  String slug, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "firm_name_id")  int firmNameId, @JsonKey(name: "department_id")  dynamic departmentId, @JsonKey(name: "office_address_id")  int officeAddressId, @JsonKey(name: "title_en")  String titleEn, @JsonKey(name: "department")  dynamic department, @JsonKey(name: "department_en")  String departmentEn, @JsonKey(name: "photo")  Photo photo, @JsonKey(name: "qr_photo")  Photo qrPhoto, @JsonKey(name: "media")  List<Photo> media)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Employee() when $default != null:
return $default(_that.id,_that.user,_that.name,_that.surname,_that.title,_that.email,_that.phone,_that.extensionNumber,_that.qr,_that.qrCodeUrl,_that.instagramUrl,_that.linkedinUrl,_that.appointmentStatus,_that.date,_that.status,_that.slug,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.firmNameId,_that.departmentId,_that.officeAddressId,_that.titleEn,_that.department,_that.departmentEn,_that.photo,_that.qrPhoto,_that.media);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "user")  int user, @JsonKey(name: "name")  String name, @JsonKey(name: "surname")  String surname, @JsonKey(name: "title")  String title, @JsonKey(name: "email")  String email, @JsonKey(name: "phone")  String phone, @JsonKey(name: "extension_number")  dynamic extensionNumber, @JsonKey(name: "qr")  int qr, @JsonKey(name: "qr_code_url")  String qrCodeUrl, @JsonKey(name: "instagram_url")  String instagramUrl, @JsonKey(name: "linkedin_url")  String linkedinUrl, @JsonKey(name: "appointment_status")  String appointmentStatus, @JsonKey(name: "date")  DateTime date, @JsonKey(name: "status")  String status, @JsonKey(name: "slug")  String slug, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "firm_name_id")  int firmNameId, @JsonKey(name: "department_id")  dynamic departmentId, @JsonKey(name: "office_address_id")  int officeAddressId, @JsonKey(name: "title_en")  String titleEn, @JsonKey(name: "department")  dynamic department, @JsonKey(name: "department_en")  String departmentEn, @JsonKey(name: "photo")  Photo photo, @JsonKey(name: "qr_photo")  Photo qrPhoto, @JsonKey(name: "media")  List<Photo> media)  $default,) {final _that = this;
switch (_that) {
case _Employee():
return $default(_that.id,_that.user,_that.name,_that.surname,_that.title,_that.email,_that.phone,_that.extensionNumber,_that.qr,_that.qrCodeUrl,_that.instagramUrl,_that.linkedinUrl,_that.appointmentStatus,_that.date,_that.status,_that.slug,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.firmNameId,_that.departmentId,_that.officeAddressId,_that.titleEn,_that.department,_that.departmentEn,_that.photo,_that.qrPhoto,_that.media);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "user")  int user, @JsonKey(name: "name")  String name, @JsonKey(name: "surname")  String surname, @JsonKey(name: "title")  String title, @JsonKey(name: "email")  String email, @JsonKey(name: "phone")  String phone, @JsonKey(name: "extension_number")  dynamic extensionNumber, @JsonKey(name: "qr")  int qr, @JsonKey(name: "qr_code_url")  String qrCodeUrl, @JsonKey(name: "instagram_url")  String instagramUrl, @JsonKey(name: "linkedin_url")  String linkedinUrl, @JsonKey(name: "appointment_status")  String appointmentStatus, @JsonKey(name: "date")  DateTime date, @JsonKey(name: "status")  String status, @JsonKey(name: "slug")  String slug, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "deleted_at")  dynamic deletedAt, @JsonKey(name: "firm_name_id")  int firmNameId, @JsonKey(name: "department_id")  dynamic departmentId, @JsonKey(name: "office_address_id")  int officeAddressId, @JsonKey(name: "title_en")  String titleEn, @JsonKey(name: "department")  dynamic department, @JsonKey(name: "department_en")  String departmentEn, @JsonKey(name: "photo")  Photo photo, @JsonKey(name: "qr_photo")  Photo qrPhoto, @JsonKey(name: "media")  List<Photo> media)?  $default,) {final _that = this;
switch (_that) {
case _Employee() when $default != null:
return $default(_that.id,_that.user,_that.name,_that.surname,_that.title,_that.email,_that.phone,_that.extensionNumber,_that.qr,_that.qrCodeUrl,_that.instagramUrl,_that.linkedinUrl,_that.appointmentStatus,_that.date,_that.status,_that.slug,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.firmNameId,_that.departmentId,_that.officeAddressId,_that.titleEn,_that.department,_that.departmentEn,_that.photo,_that.qrPhoto,_that.media);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Employee implements Employee {
  const _Employee({@JsonKey(name: "id") required this.id, @JsonKey(name: "user") required this.user, @JsonKey(name: "name") required this.name, @JsonKey(name: "surname") required this.surname, @JsonKey(name: "title") required this.title, @JsonKey(name: "email") required this.email, @JsonKey(name: "phone") required this.phone, @JsonKey(name: "extension_number") required this.extensionNumber, @JsonKey(name: "qr") required this.qr, @JsonKey(name: "qr_code_url") required this.qrCodeUrl, @JsonKey(name: "instagram_url") required this.instagramUrl, @JsonKey(name: "linkedin_url") required this.linkedinUrl, @JsonKey(name: "appointment_status") required this.appointmentStatus, @JsonKey(name: "date") required this.date, @JsonKey(name: "status") required this.status, @JsonKey(name: "slug") required this.slug, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "deleted_at") required this.deletedAt, @JsonKey(name: "firm_name_id") required this.firmNameId, @JsonKey(name: "department_id") required this.departmentId, @JsonKey(name: "office_address_id") required this.officeAddressId, @JsonKey(name: "title_en") required this.titleEn, @JsonKey(name: "department") required this.department, @JsonKey(name: "department_en") required this.departmentEn, @JsonKey(name: "photo") required this.photo, @JsonKey(name: "qr_photo") required this.qrPhoto, @JsonKey(name: "media") required final  List<Photo> media}): _media = media;
  factory _Employee.fromJson(Map<String, dynamic> json) => _$EmployeeFromJson(json);

@override@JsonKey(name: "id") final  int id;
@override@JsonKey(name: "user") final  int user;
@override@JsonKey(name: "name") final  String name;
@override@JsonKey(name: "surname") final  String surname;
@override@JsonKey(name: "title") final  String title;
@override@JsonKey(name: "email") final  String email;
@override@JsonKey(name: "phone") final  String phone;
@override@JsonKey(name: "extension_number") final  dynamic extensionNumber;
@override@JsonKey(name: "qr") final  int qr;
@override@JsonKey(name: "qr_code_url") final  String qrCodeUrl;
@override@JsonKey(name: "instagram_url") final  String instagramUrl;
@override@JsonKey(name: "linkedin_url") final  String linkedinUrl;
@override@JsonKey(name: "appointment_status") final  String appointmentStatus;
@override@JsonKey(name: "date") final  DateTime date;
@override@JsonKey(name: "status") final  String status;
@override@JsonKey(name: "slug") final  String slug;
@override@JsonKey(name: "created_at") final  DateTime createdAt;
@override@JsonKey(name: "updated_at") final  DateTime updatedAt;
@override@JsonKey(name: "deleted_at") final  dynamic deletedAt;
@override@JsonKey(name: "firm_name_id") final  int firmNameId;
@override@JsonKey(name: "department_id") final  dynamic departmentId;
@override@JsonKey(name: "office_address_id") final  int officeAddressId;
@override@JsonKey(name: "title_en") final  String titleEn;
@override@JsonKey(name: "department") final  dynamic department;
@override@JsonKey(name: "department_en") final  String departmentEn;
@override@JsonKey(name: "photo") final  Photo photo;
@override@JsonKey(name: "qr_photo") final  Photo qrPhoto;
 final  List<Photo> _media;
@override@JsonKey(name: "media") List<Photo> get media {
  if (_media is EqualUnmodifiableListView) return _media;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_media);
}


/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeCopyWith<_Employee> get copyWith => __$EmployeeCopyWithImpl<_Employee>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Employee&&(identical(other.id, id) || other.id == id)&&(identical(other.user, user) || other.user == user)&&(identical(other.name, name) || other.name == name)&&(identical(other.surname, surname) || other.surname == surname)&&(identical(other.title, title) || other.title == title)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other.extensionNumber, extensionNumber)&&(identical(other.qr, qr) || other.qr == qr)&&(identical(other.qrCodeUrl, qrCodeUrl) || other.qrCodeUrl == qrCodeUrl)&&(identical(other.instagramUrl, instagramUrl) || other.instagramUrl == instagramUrl)&&(identical(other.linkedinUrl, linkedinUrl) || other.linkedinUrl == linkedinUrl)&&(identical(other.appointmentStatus, appointmentStatus) || other.appointmentStatus == appointmentStatus)&&(identical(other.date, date) || other.date == date)&&(identical(other.status, status) || other.status == status)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.deletedAt, deletedAt)&&(identical(other.firmNameId, firmNameId) || other.firmNameId == firmNameId)&&const DeepCollectionEquality().equals(other.departmentId, departmentId)&&(identical(other.officeAddressId, officeAddressId) || other.officeAddressId == officeAddressId)&&(identical(other.titleEn, titleEn) || other.titleEn == titleEn)&&const DeepCollectionEquality().equals(other.department, department)&&(identical(other.departmentEn, departmentEn) || other.departmentEn == departmentEn)&&(identical(other.photo, photo) || other.photo == photo)&&(identical(other.qrPhoto, qrPhoto) || other.qrPhoto == qrPhoto)&&const DeepCollectionEquality().equals(other._media, _media));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,user,name,surname,title,email,phone,const DeepCollectionEquality().hash(extensionNumber),qr,qrCodeUrl,instagramUrl,linkedinUrl,appointmentStatus,date,status,slug,createdAt,updatedAt,const DeepCollectionEquality().hash(deletedAt),firmNameId,const DeepCollectionEquality().hash(departmentId),officeAddressId,titleEn,const DeepCollectionEquality().hash(department),departmentEn,photo,qrPhoto,const DeepCollectionEquality().hash(_media)]);

@override
String toString() {
  return 'Employee(id: $id, user: $user, name: $name, surname: $surname, title: $title, email: $email, phone: $phone, extensionNumber: $extensionNumber, qr: $qr, qrCodeUrl: $qrCodeUrl, instagramUrl: $instagramUrl, linkedinUrl: $linkedinUrl, appointmentStatus: $appointmentStatus, date: $date, status: $status, slug: $slug, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, firmNameId: $firmNameId, departmentId: $departmentId, officeAddressId: $officeAddressId, titleEn: $titleEn, department: $department, departmentEn: $departmentEn, photo: $photo, qrPhoto: $qrPhoto, media: $media)';
}


}

/// @nodoc
abstract mixin class _$EmployeeCopyWith<$Res> implements $EmployeeCopyWith<$Res> {
  factory _$EmployeeCopyWith(_Employee value, $Res Function(_Employee) _then) = __$EmployeeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "user") int user,@JsonKey(name: "name") String name,@JsonKey(name: "surname") String surname,@JsonKey(name: "title") String title,@JsonKey(name: "email") String email,@JsonKey(name: "phone") String phone,@JsonKey(name: "extension_number") dynamic extensionNumber,@JsonKey(name: "qr") int qr,@JsonKey(name: "qr_code_url") String qrCodeUrl,@JsonKey(name: "instagram_url") String instagramUrl,@JsonKey(name: "linkedin_url") String linkedinUrl,@JsonKey(name: "appointment_status") String appointmentStatus,@JsonKey(name: "date") DateTime date,@JsonKey(name: "status") String status,@JsonKey(name: "slug") String slug,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "deleted_at") dynamic deletedAt,@JsonKey(name: "firm_name_id") int firmNameId,@JsonKey(name: "department_id") dynamic departmentId,@JsonKey(name: "office_address_id") int officeAddressId,@JsonKey(name: "title_en") String titleEn,@JsonKey(name: "department") dynamic department,@JsonKey(name: "department_en") String departmentEn,@JsonKey(name: "photo") Photo photo,@JsonKey(name: "qr_photo") Photo qrPhoto,@JsonKey(name: "media") List<Photo> media
});


@override $PhotoCopyWith<$Res> get photo;@override $PhotoCopyWith<$Res> get qrPhoto;

}
/// @nodoc
class __$EmployeeCopyWithImpl<$Res>
    implements _$EmployeeCopyWith<$Res> {
  __$EmployeeCopyWithImpl(this._self, this._then);

  final _Employee _self;
  final $Res Function(_Employee) _then;

/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? user = null,Object? name = null,Object? surname = null,Object? title = null,Object? email = null,Object? phone = null,Object? extensionNumber = freezed,Object? qr = null,Object? qrCodeUrl = null,Object? instagramUrl = null,Object? linkedinUrl = null,Object? appointmentStatus = null,Object? date = null,Object? status = null,Object? slug = null,Object? createdAt = null,Object? updatedAt = null,Object? deletedAt = freezed,Object? firmNameId = null,Object? departmentId = freezed,Object? officeAddressId = null,Object? titleEn = null,Object? department = freezed,Object? departmentEn = null,Object? photo = null,Object? qrPhoto = null,Object? media = null,}) {
  return _then(_Employee(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,surname: null == surname ? _self.surname : surname // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,extensionNumber: freezed == extensionNumber ? _self.extensionNumber : extensionNumber // ignore: cast_nullable_to_non_nullable
as dynamic,qr: null == qr ? _self.qr : qr // ignore: cast_nullable_to_non_nullable
as int,qrCodeUrl: null == qrCodeUrl ? _self.qrCodeUrl : qrCodeUrl // ignore: cast_nullable_to_non_nullable
as String,instagramUrl: null == instagramUrl ? _self.instagramUrl : instagramUrl // ignore: cast_nullable_to_non_nullable
as String,linkedinUrl: null == linkedinUrl ? _self.linkedinUrl : linkedinUrl // ignore: cast_nullable_to_non_nullable
as String,appointmentStatus: null == appointmentStatus ? _self.appointmentStatus : appointmentStatus // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as dynamic,firmNameId: null == firmNameId ? _self.firmNameId : firmNameId // ignore: cast_nullable_to_non_nullable
as int,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as dynamic,officeAddressId: null == officeAddressId ? _self.officeAddressId : officeAddressId // ignore: cast_nullable_to_non_nullable
as int,titleEn: null == titleEn ? _self.titleEn : titleEn // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as dynamic,departmentEn: null == departmentEn ? _self.departmentEn : departmentEn // ignore: cast_nullable_to_non_nullable
as String,photo: null == photo ? _self.photo : photo // ignore: cast_nullable_to_non_nullable
as Photo,qrPhoto: null == qrPhoto ? _self.qrPhoto : qrPhoto // ignore: cast_nullable_to_non_nullable
as Photo,media: null == media ? _self._media : media // ignore: cast_nullable_to_non_nullable
as List<Photo>,
  ));
}

/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoCopyWith<$Res> get photo {
  
  return $PhotoCopyWith<$Res>(_self.photo, (value) {
    return _then(_self.copyWith(photo: value));
  });
}/// Create a copy of Employee
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PhotoCopyWith<$Res> get qrPhoto {
  
  return $PhotoCopyWith<$Res>(_self.qrPhoto, (value) {
    return _then(_self.copyWith(qrPhoto: value));
  });
}
}


/// @nodoc
mixin _$Photo {

@JsonKey(name: "id") int get id;@JsonKey(name: "model_type") String get modelType;@JsonKey(name: "model_id") int get modelId;@JsonKey(name: "uuid") String get uuid;@JsonKey(name: "collection_name") String get collectionName;@JsonKey(name: "name") String get name;@JsonKey(name: "file_name") String get fileName;@JsonKey(name: "mime_type") String get mimeType;@JsonKey(name: "disk") String get disk;@JsonKey(name: "conversions_disk") String get conversionsDisk;@JsonKey(name: "size") int get size;@JsonKey(name: "manipulations") List<dynamic> get manipulations;@JsonKey(name: "custom_properties") List<dynamic> get customProperties;@JsonKey(name: "generated_conversions") GeneratedConversions get generatedConversions;@JsonKey(name: "responsive_images") List<dynamic> get responsiveImages;@JsonKey(name: "order_column") int get orderColumn;@JsonKey(name: "created_at") DateTime get createdAt;@JsonKey(name: "updated_at") DateTime get updatedAt;@JsonKey(name: "url") String? get url;@JsonKey(name: "thumbnail") String? get thumbnail;@JsonKey(name: "preview") String? get preview;@JsonKey(name: "original_url") String get originalUrl;@JsonKey(name: "preview_url") String get previewUrl;
/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PhotoCopyWith<Photo> get copyWith => _$PhotoCopyWithImpl<Photo>(this as Photo, _$identity);

  /// Serializes this Photo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Photo&&(identical(other.id, id) || other.id == id)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.disk, disk) || other.disk == disk)&&(identical(other.conversionsDisk, conversionsDisk) || other.conversionsDisk == conversionsDisk)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.manipulations, manipulations)&&const DeepCollectionEquality().equals(other.customProperties, customProperties)&&(identical(other.generatedConversions, generatedConversions) || other.generatedConversions == generatedConversions)&&const DeepCollectionEquality().equals(other.responsiveImages, responsiveImages)&&(identical(other.orderColumn, orderColumn) || other.orderColumn == orderColumn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,modelType,modelId,uuid,collectionName,name,fileName,mimeType,disk,conversionsDisk,size,const DeepCollectionEquality().hash(manipulations),const DeepCollectionEquality().hash(customProperties),generatedConversions,const DeepCollectionEquality().hash(responsiveImages),orderColumn,createdAt,updatedAt,url,thumbnail,preview,originalUrl,previewUrl]);

@override
String toString() {
  return 'Photo(id: $id, modelType: $modelType, modelId: $modelId, uuid: $uuid, collectionName: $collectionName, name: $name, fileName: $fileName, mimeType: $mimeType, disk: $disk, conversionsDisk: $conversionsDisk, size: $size, manipulations: $manipulations, customProperties: $customProperties, generatedConversions: $generatedConversions, responsiveImages: $responsiveImages, orderColumn: $orderColumn, createdAt: $createdAt, updatedAt: $updatedAt, url: $url, thumbnail: $thumbnail, preview: $preview, originalUrl: $originalUrl, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class $PhotoCopyWith<$Res>  {
  factory $PhotoCopyWith(Photo value, $Res Function(Photo) _then) = _$PhotoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "model_type") String modelType,@JsonKey(name: "model_id") int modelId,@JsonKey(name: "uuid") String uuid,@JsonKey(name: "collection_name") String collectionName,@JsonKey(name: "name") String name,@JsonKey(name: "file_name") String fileName,@JsonKey(name: "mime_type") String mimeType,@JsonKey(name: "disk") String disk,@JsonKey(name: "conversions_disk") String conversionsDisk,@JsonKey(name: "size") int size,@JsonKey(name: "manipulations") List<dynamic> manipulations,@JsonKey(name: "custom_properties") List<dynamic> customProperties,@JsonKey(name: "generated_conversions") GeneratedConversions generatedConversions,@JsonKey(name: "responsive_images") List<dynamic> responsiveImages,@JsonKey(name: "order_column") int orderColumn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "url") String? url,@JsonKey(name: "thumbnail") String? thumbnail,@JsonKey(name: "preview") String? preview,@JsonKey(name: "original_url") String originalUrl,@JsonKey(name: "preview_url") String previewUrl
});


$GeneratedConversionsCopyWith<$Res> get generatedConversions;

}
/// @nodoc
class _$PhotoCopyWithImpl<$Res>
    implements $PhotoCopyWith<$Res> {
  _$PhotoCopyWithImpl(this._self, this._then);

  final Photo _self;
  final $Res Function(Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? modelType = null,Object? modelId = null,Object? uuid = null,Object? collectionName = null,Object? name = null,Object? fileName = null,Object? mimeType = null,Object? disk = null,Object? conversionsDisk = null,Object? size = null,Object? manipulations = null,Object? customProperties = null,Object? generatedConversions = null,Object? responsiveImages = null,Object? orderColumn = null,Object? createdAt = null,Object? updatedAt = null,Object? url = freezed,Object? thumbnail = freezed,Object? preview = freezed,Object? originalUrl = null,Object? previewUrl = null,}) {
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
as DateTime,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,previewUrl: null == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GeneratedConversionsCopyWith<$Res> get generatedConversions {
  
  return $GeneratedConversionsCopyWith<$Res>(_self.generatedConversions, (value) {
    return _then(_self.copyWith(generatedConversions: value));
  });
}
}


/// Adds pattern-matching-related methods to [Photo].
extension PhotoPatterns on Photo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Photo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Photo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Photo value)  $default,){
final _that = this;
switch (_that) {
case _Photo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Photo value)?  $default,){
final _that = this;
switch (_that) {
case _Photo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  GeneratedConversions generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Photo() when $default != null:
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.url,_that.thumbnail,_that.preview,_that.originalUrl,_that.previewUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  GeneratedConversions generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)  $default,) {final _that = this;
switch (_that) {
case _Photo():
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.url,_that.thumbnail,_that.preview,_that.originalUrl,_that.previewUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  int id, @JsonKey(name: "model_type")  String modelType, @JsonKey(name: "model_id")  int modelId, @JsonKey(name: "uuid")  String uuid, @JsonKey(name: "collection_name")  String collectionName, @JsonKey(name: "name")  String name, @JsonKey(name: "file_name")  String fileName, @JsonKey(name: "mime_type")  String mimeType, @JsonKey(name: "disk")  String disk, @JsonKey(name: "conversions_disk")  String conversionsDisk, @JsonKey(name: "size")  int size, @JsonKey(name: "manipulations")  List<dynamic> manipulations, @JsonKey(name: "custom_properties")  List<dynamic> customProperties, @JsonKey(name: "generated_conversions")  GeneratedConversions generatedConversions, @JsonKey(name: "responsive_images")  List<dynamic> responsiveImages, @JsonKey(name: "order_column")  int orderColumn, @JsonKey(name: "created_at")  DateTime createdAt, @JsonKey(name: "updated_at")  DateTime updatedAt, @JsonKey(name: "url")  String? url, @JsonKey(name: "thumbnail")  String? thumbnail, @JsonKey(name: "preview")  String? preview, @JsonKey(name: "original_url")  String originalUrl, @JsonKey(name: "preview_url")  String previewUrl)?  $default,) {final _that = this;
switch (_that) {
case _Photo() when $default != null:
return $default(_that.id,_that.modelType,_that.modelId,_that.uuid,_that.collectionName,_that.name,_that.fileName,_that.mimeType,_that.disk,_that.conversionsDisk,_that.size,_that.manipulations,_that.customProperties,_that.generatedConversions,_that.responsiveImages,_that.orderColumn,_that.createdAt,_that.updatedAt,_that.url,_that.thumbnail,_that.preview,_that.originalUrl,_that.previewUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Photo implements Photo {
  const _Photo({@JsonKey(name: "id") required this.id, @JsonKey(name: "model_type") required this.modelType, @JsonKey(name: "model_id") required this.modelId, @JsonKey(name: "uuid") required this.uuid, @JsonKey(name: "collection_name") required this.collectionName, @JsonKey(name: "name") required this.name, @JsonKey(name: "file_name") required this.fileName, @JsonKey(name: "mime_type") required this.mimeType, @JsonKey(name: "disk") required this.disk, @JsonKey(name: "conversions_disk") required this.conversionsDisk, @JsonKey(name: "size") required this.size, @JsonKey(name: "manipulations") required final  List<dynamic> manipulations, @JsonKey(name: "custom_properties") required final  List<dynamic> customProperties, @JsonKey(name: "generated_conversions") required this.generatedConversions, @JsonKey(name: "responsive_images") required final  List<dynamic> responsiveImages, @JsonKey(name: "order_column") required this.orderColumn, @JsonKey(name: "created_at") required this.createdAt, @JsonKey(name: "updated_at") required this.updatedAt, @JsonKey(name: "url") this.url, @JsonKey(name: "thumbnail") this.thumbnail, @JsonKey(name: "preview") this.preview, @JsonKey(name: "original_url") required this.originalUrl, @JsonKey(name: "preview_url") required this.previewUrl}): _manipulations = manipulations,_customProperties = customProperties,_responsiveImages = responsiveImages;
  factory _Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

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
@override@JsonKey(name: "url") final  String? url;
@override@JsonKey(name: "thumbnail") final  String? thumbnail;
@override@JsonKey(name: "preview") final  String? preview;
@override@JsonKey(name: "original_url") final  String originalUrl;
@override@JsonKey(name: "preview_url") final  String previewUrl;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PhotoCopyWith<_Photo> get copyWith => __$PhotoCopyWithImpl<_Photo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PhotoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Photo&&(identical(other.id, id) || other.id == id)&&(identical(other.modelType, modelType) || other.modelType == modelType)&&(identical(other.modelId, modelId) || other.modelId == modelId)&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.collectionName, collectionName) || other.collectionName == collectionName)&&(identical(other.name, name) || other.name == name)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.disk, disk) || other.disk == disk)&&(identical(other.conversionsDisk, conversionsDisk) || other.conversionsDisk == conversionsDisk)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other._manipulations, _manipulations)&&const DeepCollectionEquality().equals(other._customProperties, _customProperties)&&(identical(other.generatedConversions, generatedConversions) || other.generatedConversions == generatedConversions)&&const DeepCollectionEquality().equals(other._responsiveImages, _responsiveImages)&&(identical(other.orderColumn, orderColumn) || other.orderColumn == orderColumn)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.preview, preview) || other.preview == preview)&&(identical(other.originalUrl, originalUrl) || other.originalUrl == originalUrl)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,modelType,modelId,uuid,collectionName,name,fileName,mimeType,disk,conversionsDisk,size,const DeepCollectionEquality().hash(_manipulations),const DeepCollectionEquality().hash(_customProperties),generatedConversions,const DeepCollectionEquality().hash(_responsiveImages),orderColumn,createdAt,updatedAt,url,thumbnail,preview,originalUrl,previewUrl]);

@override
String toString() {
  return 'Photo(id: $id, modelType: $modelType, modelId: $modelId, uuid: $uuid, collectionName: $collectionName, name: $name, fileName: $fileName, mimeType: $mimeType, disk: $disk, conversionsDisk: $conversionsDisk, size: $size, manipulations: $manipulations, customProperties: $customProperties, generatedConversions: $generatedConversions, responsiveImages: $responsiveImages, orderColumn: $orderColumn, createdAt: $createdAt, updatedAt: $updatedAt, url: $url, thumbnail: $thumbnail, preview: $preview, originalUrl: $originalUrl, previewUrl: $previewUrl)';
}


}

/// @nodoc
abstract mixin class _$PhotoCopyWith<$Res> implements $PhotoCopyWith<$Res> {
  factory _$PhotoCopyWith(_Photo value, $Res Function(_Photo) _then) = __$PhotoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") int id,@JsonKey(name: "model_type") String modelType,@JsonKey(name: "model_id") int modelId,@JsonKey(name: "uuid") String uuid,@JsonKey(name: "collection_name") String collectionName,@JsonKey(name: "name") String name,@JsonKey(name: "file_name") String fileName,@JsonKey(name: "mime_type") String mimeType,@JsonKey(name: "disk") String disk,@JsonKey(name: "conversions_disk") String conversionsDisk,@JsonKey(name: "size") int size,@JsonKey(name: "manipulations") List<dynamic> manipulations,@JsonKey(name: "custom_properties") List<dynamic> customProperties,@JsonKey(name: "generated_conversions") GeneratedConversions generatedConversions,@JsonKey(name: "responsive_images") List<dynamic> responsiveImages,@JsonKey(name: "order_column") int orderColumn,@JsonKey(name: "created_at") DateTime createdAt,@JsonKey(name: "updated_at") DateTime updatedAt,@JsonKey(name: "url") String? url,@JsonKey(name: "thumbnail") String? thumbnail,@JsonKey(name: "preview") String? preview,@JsonKey(name: "original_url") String originalUrl,@JsonKey(name: "preview_url") String previewUrl
});


@override $GeneratedConversionsCopyWith<$Res> get generatedConversions;

}
/// @nodoc
class __$PhotoCopyWithImpl<$Res>
    implements _$PhotoCopyWith<$Res> {
  __$PhotoCopyWithImpl(this._self, this._then);

  final _Photo _self;
  final $Res Function(_Photo) _then;

/// Create a copy of Photo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? modelType = null,Object? modelId = null,Object? uuid = null,Object? collectionName = null,Object? name = null,Object? fileName = null,Object? mimeType = null,Object? disk = null,Object? conversionsDisk = null,Object? size = null,Object? manipulations = null,Object? customProperties = null,Object? generatedConversions = null,Object? responsiveImages = null,Object? orderColumn = null,Object? createdAt = null,Object? updatedAt = null,Object? url = freezed,Object? thumbnail = freezed,Object? preview = freezed,Object? originalUrl = null,Object? previewUrl = null,}) {
  return _then(_Photo(
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
as DateTime,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,preview: freezed == preview ? _self.preview : preview // ignore: cast_nullable_to_non_nullable
as String?,originalUrl: null == originalUrl ? _self.originalUrl : originalUrl // ignore: cast_nullable_to_non_nullable
as String,previewUrl: null == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Photo
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
