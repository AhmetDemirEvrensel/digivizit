// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$getPersonelInfoResponseAtom = Atom(
    name: 'HomeViewModelBase.getPersonelInfoResponse',
    context: context,
  );

  @override
  GetPersonelInfoResponse? get getPersonelInfoResponse {
    _$getPersonelInfoResponseAtom.reportRead();
    return super.getPersonelInfoResponse;
  }

  @override
  set getPersonelInfoResponse(GetPersonelInfoResponse? value) {
    _$getPersonelInfoResponseAtom.reportWrite(
      value,
      super.getPersonelInfoResponse,
      () {
        super.getPersonelInfoResponse = value;
      },
    );
  }

  late final _$getContactsResponseAtom = Atom(
    name: 'HomeViewModelBase.getContactsResponse',
    context: context,
  );

  @override
  ContactsResponse? get getContactsResponse {
    _$getContactsResponseAtom.reportRead();
    return super.getContactsResponse;
  }

  @override
  set getContactsResponse(ContactsResponse? value) {
    _$getContactsResponseAtom.reportWrite(value, super.getContactsResponse, () {
      super.getContactsResponse = value;
    });
  }

  late final _$getPersonelInfoAsyncAction = AsyncAction(
    'HomeViewModelBase.getPersonelInfo',
    context: context,
  );

  @override
  Future<void> getPersonelInfo() {
    return _$getPersonelInfoAsyncAction.run(() => super.getPersonelInfo());
  }

  late final _$getContactsInfoAsyncAction = AsyncAction(
    'HomeViewModelBase.getContactsInfo',
    context: context,
  );

  @override
  Future<void> getContactsInfo(String email, String password) {
    return _$getContactsInfoAsyncAction.run(
      () => super.getContactsInfo(email, password),
    );
  }

  @override
  String toString() {
    return '''
getPersonelInfoResponse: ${getPersonelInfoResponse},
getContactsResponse: ${getContactsResponse}
    ''';
  }
}
