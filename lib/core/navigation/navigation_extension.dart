import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/navigation/navigation_manager.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:provider/provider.dart';

extension NavigationEnumsExt on NavigationEnums {
  Future<void> navigateToPageClear({
    Object? data,
    TransitionType? customTransition,
    Duration? transitionDuration,
    Widget? childCurrent,
    PageTransitionType? fallback,
  }) async {
    AppSettings.instance.context!.read<NavigationService>().navigateToPageClear(
      path: rawValue,
      data: data,
      customTransition: customTransition,
      transitionDuration: transitionDuration,
      childCurrent: childCurrent,
      fallback: fallback,
    );
  }

  Future<Object?> navigateToPage({
    Object? data,
    TransitionType? customTransition,
    Duration? transitionDuration,
    Widget? childCurrent,
    PageTransitionType? fallback,
    dynamic Function()? poppedBack,
  }) async {
    return AppSettings.instance.context!.read<NavigationService>().navigateToPage(
      path: rawValue,
      data: data,
      customTransition: customTransition,
      transitionDuration: transitionDuration,
      childCurrent: childCurrent,
      fallback: fallback,
      poppedBack: poppedBack,
    );
  }

  Future<void> navigateToPageReplacement({
    Object? data,
    TransitionType? customTransition,
    Duration? transitionDuration,
    Widget? childCurrent,
    PageTransitionType? fallback,
  }) async {
    AppSettings.instance.context!.read<NavigationService>().navigateToPageReplacement(
      path: rawValue,
      data: data,
      customTransition: customTransition,
      transitionDuration: transitionDuration,
      childCurrent: childCurrent,
      fallback: fallback,
    );
  }

  Future<void> backToPageClear({Object? data}) async {
    AppSettings.instance.context!.read<NavigationService>().backToPageClear(path: rawValue, data: data);
  }

  /// PopUntil ile belirtilen sayfaya kadar pop yapar ve veri aktarır
  Future<void> backToPageUntil({Object? data}) async {
    await AppSettings.instance.context!.read<NavigationService>().backToPageUntil(targetPath: rawValue, data: data);
  }
}
