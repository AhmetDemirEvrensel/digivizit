// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on HomeViewModelBase, Store {
  late final _$profileResponseAtom = Atom(
    name: 'HomeViewModelBase.profileResponse',
    context: context,
  );

  @override
  ProfileResponse? get profileResponse {
    _$profileResponseAtom.reportRead();
    return super.profileResponse;
  }

  @override
  set profileResponse(ProfileResponse? value) {
    _$profileResponseAtom.reportWrite(value, super.profileResponse, () {
      super.profileResponse = value;
    });
  }

  late final _$getContactsResponseAtom = Atom(
    name: 'HomeViewModelBase.getContactsResponse',
    context: context,
  );

  @override
  BusinessCardListResponse? get getContactsResponse {
    _$getContactsResponseAtom.reportRead();
    return super.getContactsResponse;
  }

  @override
  set getContactsResponse(BusinessCardListResponse? value) {
    _$getContactsResponseAtom.reportWrite(value, super.getContactsResponse, () {
      super.getContactsResponse = value;
    });
  }

  late final _$qrResponseAtom = Atom(
    name: 'HomeViewModelBase.qrResponse',
    context: context,
  );

  @override
  QrResponse? get qrResponse {
    _$qrResponseAtom.reportRead();
    return super.qrResponse;
  }

  @override
  set qrResponse(QrResponse? value) {
    _$qrResponseAtom.reportWrite(value, super.qrResponse, () {
      super.qrResponse = value;
    });
  }

  late final _$cardResponseAtom = Atom(
    name: 'HomeViewModelBase.cardResponse',
    context: context,
  );

  @override
  CardResponse? get cardResponse {
    _$cardResponseAtom.reportRead();
    return super.cardResponse;
  }

  @override
  set cardResponse(CardResponse? value) {
    _$cardResponseAtom.reportWrite(value, super.cardResponse, () {
      super.cardResponse = value;
    });
  }

  late final _$getProfileAsyncAction = AsyncAction(
    'HomeViewModelBase.getProfile',
    context: context,
  );

  @override
  Future<void> getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  late final _$getContactsInfoAsyncAction = AsyncAction(
    'HomeViewModelBase.getContactsInfo',
    context: context,
  );

  @override
  Future<void> getContactsInfo() {
    return _$getContactsInfoAsyncAction.run(() => super.getContactsInfo());
  }

  late final _$loadMoreContactsAsyncAction = AsyncAction(
    'HomeViewModelBase.loadMoreContacts',
    context: context,
  );

  @override
  Future<void> loadMoreContacts() {
    return _$loadMoreContactsAsyncAction.run(() => super.loadMoreContacts());
  }

  @override
  String toString() {
    return '''
profileResponse: ${profileResponse},
getContactsResponse: ${getContactsResponse},
qrResponse: ${qrResponse},
cardResponse: ${cardResponse}
    ''';
  }
}
