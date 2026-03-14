// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on LoginViewModelBase, Store {
  late final _$formAtom = Atom(
    name: 'LoginViewModelBase.form',
    context: context,
  );

  @override
  FormGroup get form {
    _$formAtom.reportRead();
    return super.form;
  }

  @override
  set form(FormGroup value) {
    _$formAtom.reportWrite(value, super.form, () {
      super.form = value;
    });
  }

  late final _$rememberMeAtom = Atom(
    name: 'LoginViewModelBase.rememberMe',
    context: context,
  );

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  late final _$loadSavedCredentialsAsyncAction = AsyncAction(
    'LoginViewModelBase.loadSavedCredentials',
    context: context,
  );

  @override
  Future<void> loadSavedCredentials() {
    return _$loadSavedCredentialsAsyncAction.run(
      () => super.loadSavedCredentials(),
    );
  }

  late final _$LoginViewModelBaseActionController = ActionController(
    name: 'LoginViewModelBase',
    context: context,
  );

  @override
  void toggleRememberMe() {
    final _$actionInfo = _$LoginViewModelBaseActionController.startAction(
      name: 'LoginViewModelBase.toggleRememberMe',
    );
    try {
      return super.toggleRememberMe();
    } finally {
      _$LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
form: ${form},
rememberMe: ${rememberMe}
    ''';
  }
}
