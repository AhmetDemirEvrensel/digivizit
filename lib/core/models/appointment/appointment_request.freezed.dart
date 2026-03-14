// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'appointment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppointmentRequest {

@JsonKey(name: "employee_id") int get employeeId;@JsonKey(name: "full_name") String get fullName;@JsonKey(name: "company") String get company;@JsonKey(name: "subject") String get subject;@JsonKey(name: "note") String get note;@JsonKey(name: "preferred_date") String get preferredDate;@JsonKey(name: "status") String get status;
/// Create a copy of AppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppointmentRequestCopyWith<AppointmentRequest> get copyWith => _$AppointmentRequestCopyWithImpl<AppointmentRequest>(this as AppointmentRequest, _$identity);

  /// Serializes this AppointmentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppointmentRequest&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.company, company) || other.company == company)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.note, note) || other.note == note)&&(identical(other.preferredDate, preferredDate) || other.preferredDate == preferredDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,employeeId,fullName,company,subject,note,preferredDate,status);

@override
String toString() {
  return 'AppointmentRequest(employeeId: $employeeId, fullName: $fullName, company: $company, subject: $subject, note: $note, preferredDate: $preferredDate, status: $status)';
}


}

/// @nodoc
abstract mixin class $AppointmentRequestCopyWith<$Res>  {
  factory $AppointmentRequestCopyWith(AppointmentRequest value, $Res Function(AppointmentRequest) _then) = _$AppointmentRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "employee_id") int employeeId,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "company") String company,@JsonKey(name: "subject") String subject,@JsonKey(name: "note") String note,@JsonKey(name: "preferred_date") String preferredDate,@JsonKey(name: "status") String status
});




}
/// @nodoc
class _$AppointmentRequestCopyWithImpl<$Res>
    implements $AppointmentRequestCopyWith<$Res> {
  _$AppointmentRequestCopyWithImpl(this._self, this._then);

  final AppointmentRequest _self;
  final $Res Function(AppointmentRequest) _then;

/// Create a copy of AppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? employeeId = null,Object? fullName = null,Object? company = null,Object? subject = null,Object? note = null,Object? preferredDate = null,Object? status = null,}) {
  return _then(_self.copyWith(
employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,preferredDate: null == preferredDate ? _self.preferredDate : preferredDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppointmentRequest].
extension AppointmentRequestPatterns on AppointmentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppointmentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppointmentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppointmentRequest value)  $default,){
final _that = this;
switch (_that) {
case _AppointmentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppointmentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AppointmentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "employee_id")  int employeeId, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "company")  String company, @JsonKey(name: "subject")  String subject, @JsonKey(name: "note")  String note, @JsonKey(name: "preferred_date")  String preferredDate, @JsonKey(name: "status")  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppointmentRequest() when $default != null:
return $default(_that.employeeId,_that.fullName,_that.company,_that.subject,_that.note,_that.preferredDate,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "employee_id")  int employeeId, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "company")  String company, @JsonKey(name: "subject")  String subject, @JsonKey(name: "note")  String note, @JsonKey(name: "preferred_date")  String preferredDate, @JsonKey(name: "status")  String status)  $default,) {final _that = this;
switch (_that) {
case _AppointmentRequest():
return $default(_that.employeeId,_that.fullName,_that.company,_that.subject,_that.note,_that.preferredDate,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "employee_id")  int employeeId, @JsonKey(name: "full_name")  String fullName, @JsonKey(name: "company")  String company, @JsonKey(name: "subject")  String subject, @JsonKey(name: "note")  String note, @JsonKey(name: "preferred_date")  String preferredDate, @JsonKey(name: "status")  String status)?  $default,) {final _that = this;
switch (_that) {
case _AppointmentRequest() when $default != null:
return $default(_that.employeeId,_that.fullName,_that.company,_that.subject,_that.note,_that.preferredDate,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppointmentRequest implements AppointmentRequest {
  const _AppointmentRequest({@JsonKey(name: "employee_id") required this.employeeId, @JsonKey(name: "full_name") required this.fullName, @JsonKey(name: "company") required this.company, @JsonKey(name: "subject") required this.subject, @JsonKey(name: "note") required this.note, @JsonKey(name: "preferred_date") required this.preferredDate, @JsonKey(name: "status") required this.status});
  factory _AppointmentRequest.fromJson(Map<String, dynamic> json) => _$AppointmentRequestFromJson(json);

@override@JsonKey(name: "employee_id") final  int employeeId;
@override@JsonKey(name: "full_name") final  String fullName;
@override@JsonKey(name: "company") final  String company;
@override@JsonKey(name: "subject") final  String subject;
@override@JsonKey(name: "note") final  String note;
@override@JsonKey(name: "preferred_date") final  String preferredDate;
@override@JsonKey(name: "status") final  String status;

/// Create a copy of AppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppointmentRequestCopyWith<_AppointmentRequest> get copyWith => __$AppointmentRequestCopyWithImpl<_AppointmentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppointmentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppointmentRequest&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.company, company) || other.company == company)&&(identical(other.subject, subject) || other.subject == subject)&&(identical(other.note, note) || other.note == note)&&(identical(other.preferredDate, preferredDate) || other.preferredDate == preferredDate)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,employeeId,fullName,company,subject,note,preferredDate,status);

@override
String toString() {
  return 'AppointmentRequest(employeeId: $employeeId, fullName: $fullName, company: $company, subject: $subject, note: $note, preferredDate: $preferredDate, status: $status)';
}


}

/// @nodoc
abstract mixin class _$AppointmentRequestCopyWith<$Res> implements $AppointmentRequestCopyWith<$Res> {
  factory _$AppointmentRequestCopyWith(_AppointmentRequest value, $Res Function(_AppointmentRequest) _then) = __$AppointmentRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "employee_id") int employeeId,@JsonKey(name: "full_name") String fullName,@JsonKey(name: "company") String company,@JsonKey(name: "subject") String subject,@JsonKey(name: "note") String note,@JsonKey(name: "preferred_date") String preferredDate,@JsonKey(name: "status") String status
});




}
/// @nodoc
class __$AppointmentRequestCopyWithImpl<$Res>
    implements _$AppointmentRequestCopyWith<$Res> {
  __$AppointmentRequestCopyWithImpl(this._self, this._then);

  final _AppointmentRequest _self;
  final $Res Function(_AppointmentRequest) _then;

/// Create a copy of AppointmentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? employeeId = null,Object? fullName = null,Object? company = null,Object? subject = null,Object? note = null,Object? preferredDate = null,Object? status = null,}) {
  return _then(_AppointmentRequest(
employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as int,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,company: null == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String,subject: null == subject ? _self.subject : subject // ignore: cast_nullable_to_non_nullable
as String,note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,preferredDate: null == preferredDate ? _self.preferredDate : preferredDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
