import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/core/utils/shared_preferences_manager.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store {
  @observable
  FormGroup form = FormGroup({
    'phone': FormControl<String>(
      validators: [
        Validators.required,
        Validators.delegate((control) {
          final value = control.value as String?;
          if (value == null) return null;
          final digitsOnly = value.replaceAll(' ', '');
          if (digitsOnly.length != 10 || !RegExp(r'^\d{10}$').hasMatch(digitsOnly)) {
            return {'pattern': true};
          }
          return null;
        }),
      ],
    ),
    'password': FormControl<String>(validators: [Validators.required]),
  });

  AbstractControl get passwordController => form.control('password');
  AbstractControl get phoneNumberController => form.control('phone');

  @observable
  bool rememberMe = false;

  @action
  Future<void> loadSavedCredentials() async {
    final savedUserName = await AppSettings.instance.sharedPreferencesManager.getLocalDb<String>(SharedKeys.userName);
    final savedPassword = await AppSettings.instance.sharedPreferencesManager.getLocalDb<String>(SharedKeys.password);
/* 
    if (savedUserName?.isNotNullOrNoEmpty && savedPassword.isNotNullOrNoEmpty) {
      phoneNumberController.value = savedUserName;
      passwordController.value = savedPassword;
      rememberMe = true;
    } */
  }

  @action
  void toggleRememberMe() {
    rememberMe = !rememberMe;
  }

  /* @action
  Future<void> login() async {
    if (passwordController.valid && phoneNumberController.valid) {
      final result = await AppSettings.instance.generalService.login(
        userName: phoneNumberController.value.replaceAll(' ', ''),
        password: passwordController.value,
      );
      if (result.isSuccess && result.data?.error != true) {
        AppSettings.instance.setUserFromLogin(result.data!);
        if (rememberMe) {
          await AppSettings.instance.sharedPreferencesManager.saveLocalDb(SharedKeys.userName, phoneNumberController.value);
          await AppSettings.instance.sharedPreferencesManager.saveLocalDb(SharedKeys.password, passwordController.value);
        }
        // İstasyon sayısına göre yönlendirme
        final stations = AppSettings.instance.loginResponse?.model?.client?.stations ?? [];
        final stationViewModel = StationViewModel();
        if (stations.length == 1) {
          // Tek istasyon varsa direkt seç ve Home'a git
          await stationViewModel.selectStation(stationId: stations.first.id);
        } else {
          // Birden fazla istasyon varsa seçim sayfasına yönlendir
          final colors = await StationCard.extractColorsForStations(stations);
          NavigationEnums.station.navigateToPage(data: {"stations": stations, "stationColors": colors});
        }
      } else {
        CustomBottomSheet.errorView(text: result.error!.message);
      }
    } else {
      form.markAllAsTouched();
      CustomBottomSheet.errorView(text: 'Lütfen tüm alanları eksiksiz doldurun', title: 'Sistem Hatası');
    }
  } */
}
