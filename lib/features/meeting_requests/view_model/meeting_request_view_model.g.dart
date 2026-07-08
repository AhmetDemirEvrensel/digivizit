// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_request_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MeetingRequestViewModel on MeetingRequestViewModelBase, Store {
  late final _$appointmentsAtom = Atom(
    name: 'MeetingRequestViewModelBase.appointments',
    context: context,
  );

  @override
  AppointmentListResponse? get appointments {
    _$appointmentsAtom.reportRead();
    return super.appointments;
  }

  @override
  set appointments(AppointmentListResponse? value) {
    _$appointmentsAtom.reportWrite(value, super.appointments, () {
      super.appointments = value;
    });
  }

  late final _$getAppointmentRequestsAsyncAction = AsyncAction(
    'MeetingRequestViewModelBase.getAppointmentRequests',
    context: context,
  );

  @override
  Future<void> getAppointmentRequests() {
    return _$getAppointmentRequestsAsyncAction.run(
      () => super.getAppointmentRequests(),
    );
  }

  late final _$loadMoreAppointmentsAsyncAction = AsyncAction(
    'MeetingRequestViewModelBase.loadMoreAppointments',
    context: context,
  );

  @override
  Future<void> loadMoreAppointments() {
    return _$loadMoreAppointmentsAsyncAction.run(
      () => super.loadMoreAppointments(),
    );
  }

  @override
  String toString() {
    return '''
appointments: ${appointments}
    ''';
  }
}
