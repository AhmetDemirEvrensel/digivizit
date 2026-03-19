import 'package:digivizit/core/extensions/string.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/navigation/navigation_extension.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/core/utils/shared_preferences_manager.dart';
import 'package:digivizit/shared/components/bottom_sheet/custom_bottom_sheet_view.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store {
  @observable
  FormGroup form = FormGroup({
    'email': FormControl<String>(validators: [Validators.required]),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  AbstractControl get passwordController => form.control('password');
  AbstractControl get emailController => form.control('email');

  @observable
  bool rememberMe = false;

  @action
  Future<void> loadSavedCredentials() async {
    final savedEmail = await AppSettings.instance.sharedPreferencesManager
        .getLocalDb<String>(SharedKeys.email);
    final savedPassword = await AppSettings.instance.sharedPreferencesManager
        .getLocalDb<String>(SharedKeys.password);

    if (savedEmail!.isNotNullOrNoEmpty && savedPassword.isNotNullOrNoEmpty) {
      emailController.value = savedEmail;
      passwordController.value = savedPassword;
      rememberMe = true;
    }
  }

  @action
  void toggleRememberMe() {
    rememberMe = !rememberMe;
  }

  @action
  Future<void> login() async {
    if (passwordController.valid && emailController.valid) {
      final result = await AppSettings.instance.generalService.login(
        email: emailController.value,
        password: passwordController.value,
      );
      if (result.isSuccess) {
        await AppSettings.instance.setUserFromLogin(result.data!);
        NavigationEnums.mainNavigation.navigateToPageReplacement();
        if (rememberMe) {
          await AppSettings.instance.sharedPreferencesManager.saveLocalDb(
            SharedKeys.email,
            emailController.value,
          );
          await AppSettings.instance.sharedPreferencesManager.saveLocalDb(
            SharedKeys.password,
            passwordController.value,
          );
        }
      } else {
        CustomBottomSheet.errorView(text: result.error!.message);
      }
    } else {
      form.markAllAsTouched();
      CustomBottomSheet.errorView(
        text: 'Lütfen tüm alanları eksiksiz doldurun',
        title: 'Sistem Hatası',
      );
    }
  }
}
