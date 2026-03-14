import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/navigation/navigation_extension.dart';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'splash_view_model.g.dart';

class SplashViewModel = SplashViewModelBase with _$SplashViewModel;

abstract class SplashViewModelBase with Store {
  // Animasyon konfigürasyonları
  static const Duration animationDuration = Duration(milliseconds: 2000);
  static const Duration navigationDelay = Duration(milliseconds: 300);
  static const Duration initDelay = Duration(milliseconds: 1500);

  // Blur animasyon değerleri
  static const double blurStart = 0.0;
  static const double blurEnd = 4.0;

  // Icon scale animasyon değerleri
  static const double scaleStart = 0.0;
  static const double scaleEnd = 1.0;

  // Interval değerleri
  static const Interval iconScaleInterval = Interval(
    0.0,
    1.0,
    curve: Curves.easeOutBack,
  );
  static const Interval blurInterval = Interval(
    0.3,
    1.0,
    curve: Curves.easeInOut,
  );

  @observable
  bool showContent = false;
  bool isAutoLogged = false;

  @action
  Future<void> init() async {
    await Future.delayed(initDelay);
    showContent = true;
  }

  /// Animasyon tamamlandığında çağrılır
  /// Onboarding gösterilmediyse onboarding'e, gösterildiyse login'e yönlendirir
  void onAnimationCompleted(bool isMounted) {
    if (!isMounted) return;

    Future.delayed(navigationDelay, () async {
      NavigationEnums.login.navigateToPageReplacement();
    });
  }

  /// IconScale Animation oluştur
  Animation<double> createIconScaleAnimation(AnimationController controller) {
    return Tween<double>(
      begin: scaleStart,
      end: scaleEnd,
    ).animate(CurvedAnimation(parent: controller, curve: iconScaleInterval));
  }

  /// Blur Animation oluştur
  Animation<double> createBlurAnimation(AnimationController controller) {
    return Tween<double>(
      begin: blurStart,
      end: blurEnd,
    ).animate(CurvedAnimation(parent: controller, curve: blurInterval));
  }

  /*   @action
  Future<void> autoLogin({required LoginViewModel loginModel, required FleetsViewModel fleetModel, required HomeViewModel homeModel}) async {
    isAutoLogged = await loginModel.autoLogin(loginModel: loginModel, fleetModel: fleetModel, homeModel: homeModel);
  } */
}
