import 'package:digivizit/core/extensions/string.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/navigation/navigation_extension.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/core/utils/shared_preferences_manager.dart';
import 'package:digivizit/features/home/viewmodel/home_view_model.dart';
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
    rememberMe = AppSettings.instance.rememberMe;
    final savedEmail = await AppSettings.instance.sharedPreferencesManager.getLocalDb<String>(SharedKeys.email);
    final savedPassword = await AppSettings.instance.sharedPreferencesManager.getLocalDb<String>(SharedKeys.password);

    if (savedEmail.isNotNullOrNoEmpty) {
      emailController.value = savedEmail;
    }

    if (savedPassword.isNotNullOrNoEmpty) {
      passwordController.value = savedPassword;
    }
  }

  @action
  void toggleRememberMe() {
    rememberMe = !rememberMe;
  }

  @action
  Future<void> login() async {
    if (passwordController.valid && emailController.valid) {
      final email = (emailController.value as String? ?? '').trim();
      final password = (passwordController.value as String? ?? '');
      final result = await AppSettings.instance.generalService.login(email: email, password: password);
      if (result.isSuccess) {
        await AppSettings.instance.setUserFromLogin(result.data!, email: email, password: password, rememberUser: rememberMe);

        final homeViewModel = HomeViewModel();
        /* await homeViewModel.getPersonelInfo(); */
        await homeViewModel.getContactsInfo(email, password);
        final personelInfo = homeViewModel.getPersonelInfoResponse;
        final contactsInfo = homeViewModel.getContactsResponse;

        if (personelInfo != null && contactsInfo != null) {
          await NavigationEnums.mainNavigation.navigateToPageReplacement(data: personelInfo, data2: contactsInfo);
        } else {
          CustomBottomSheet.errorView(text: 'Kullanıcı bilgileri alınırken bir hata oluştu. Lütfen tekrar deneyin.');
        }
      } else {
        CustomBottomSheet.errorView(text: result.error!.message);
      }
    } else {
      form.markAllAsTouched();
      CustomBottomSheet.errorView(text: 'Lütfen tüm alanları eksiksiz doldurun', title: 'Sistem Hatası');
    }
  }
}
