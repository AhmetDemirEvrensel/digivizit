import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:digivizit/core/navigation/navigation_args.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/providers/app_settings.dart';

abstract class INavigationService {
  Future<Object?> navigateToPage<T>({
    required String path,
    Object? data,
    TransitionType? customTransition,
    Duration? transitionDuration,
    Widget? childCurrent,
    PageTransitionType fallback,
    dynamic Function()? poppedBack,
  });

  Future<T?> navigateToPageReplacement<T>({
    required String path,
    Object? data,
    TransitionType? customTransition,
    Duration? transitionDuration,
    Widget? childCurrent,
    PageTransitionType fallback,
  });

  Future<T?> navigateToPageClear<T>({
    required String path,
    Object? data,
    TransitionType? customTransition,
    Duration? transitionDuration,
    Widget? childCurrent,
    PageTransitionType fallback,
  });

  Future<T?> backToPageClear<T>({required String path, Object? data});

  Future<T?> backToPageUntil<T>({required String targetPath, Object? data});
}

class NavigationService implements INavigationService {
  @override
  Future<Object?> navigateToPage<T>({
    required String path,
    Object? data,
    TransitionType? customTransition,
    Duration? transitionDuration,
    Widget? childCurrent,
    PageTransitionType? fallback,
    dynamic Function()? poppedBack,
  }) async {
    // 1) forward için varsayılanları oku
    final settings = AppSettings.instance;
    final effectivePage = fallback ?? settings.forwardPage;
    final effectiveCustom = customTransition ?? settings.forwardCustom;
    final effectiveDuration = transitionDuration ?? settings.forwardDuration;

    // 2) sayfa stack takibini koru
    var exPage = settings.currentPage;
    settings.pageStackCount += 1;
    settings.currentPage = path;

    // 3) argümanı hazırla
    final args = NavigationArgs(
      data: data,
      transitionType: effectiveCustom,
      pageTransitionType: effectivePage,
      transitionDuration: effectiveDuration,
      childCurrent: childCurrent,
    );

    // 4) navigator
    return await settings.navigatorKey.currentState?.pushNamed(path, arguments: args).then((value) {
      settings.currentPage = exPage;
      settings.pageStackCount -= 1;
      if (poppedBack != null) poppedBack();
      return value;
    });
  }

  @override
  Future<T?> navigateToPageReplacement<T>({
    required String path,
    Object? data,
    TransitionType? customTransition,
    Duration? transitionDuration,
    Widget? childCurrent,
    PageTransitionType? fallback,
  }) async {
    final settings = AppSettings.instance;
    final effectivePage = fallback ?? settings.forwardPage;
    final effectiveCustom = customTransition ?? settings.forwardCustom;
    final effectiveDuration = transitionDuration ?? settings.forwardDuration;

    settings.pageStackCount = 1;
    settings.currentPage = path;

    final args = NavigationArgs(
      data: data,
      transitionType: effectiveCustom,
      pageTransitionType: effectivePage,
      transitionDuration: effectiveDuration,
      childCurrent: childCurrent,
    );

    return await settings.navigatorKey.currentState?.pushReplacementNamed(path, arguments: args);
  }

  @override
  Future<T?> navigateToPageClear<T>({
    required String path,
    Object? data,
    TransitionType? customTransition,
    Duration? transitionDuration,
    Widget? childCurrent,
    PageTransitionType? fallback,
  }) async {
    final settings = AppSettings.instance;
    final effectivePage = fallback ?? settings.forwardPage;
    final effectiveCustom = customTransition ?? settings.forwardCustom;
    final effectiveDuration = transitionDuration ?? settings.forwardDuration;

    settings.pageStackCount = 1;
    settings.currentPage = path;

    final args = NavigationArgs(
      data: data,
      transitionType: effectiveCustom,
      pageTransitionType: effectivePage,
      transitionDuration: effectiveDuration,
      childCurrent: childCurrent,
    );

    return await settings.navigatorKey.currentState?.pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false, arguments: args);
  }

  @override
  Future<T?> backToPageClear<T>({required String path, Object? data}) async {
    final settings = AppSettings.instance;

    settings.pageStackCount = 1;
    settings.currentPage = path;

    final args = NavigationArgs(data: data, transitionType: settings.backwardCustom, transitionDuration: settings.backwardDuration);

    return await settings.navigatorKey.currentState?.pushNamedAndRemoveUntil(path, (Route<dynamic> route) => false, arguments: args);
  }

  Future<T?> generateNewRoute<T>({required Widget page, required String path, Object? data}) async {
    AppSettings.instance.currentPage = path;
    return await AppSettings.instance.navigatorKey.currentState?.push(MaterialPageRoute(builder: (context) => page));
  }

  @override
  Future<T?> backToPageUntil<T>({required String targetPath, Object? data}) async {
    final settings = AppSettings.instance;
    settings.currentPage = targetPath;

    // Data'yı hedef sayfaya iletmek için AppSettings üzerinden geçici olarak saklayabiliriz
    // Önce datayı set etmeliyiz ki didPopNext tetiklendiğinde veri hazır olsun
    if (data != null) {
      settings.popUntilData = data;
    }

    // PopUntil ile hedef sayfaya kadar pop yap
    settings.navigatorKey.currentState?.popUntil((route) {
      if (route.settings.name == targetPath) {
        return true;
      }
      return false;
    });

    return null;
  }
}
