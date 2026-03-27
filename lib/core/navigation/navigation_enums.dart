enum NavigationEnums {
  // Splash
  splash,

  // Auth
  login,

  // Cardvizit
  home,
  mainNavigation,
  cardsList,
  contactDetail,
  meetingRequest,
  /* settings, */
}

//! Sadece enum ekliyoruz burada extensiona dokunmuyoruz
extension NavigationConstantsValue on NavigationEnums {
  String get rawValue {
    switch (this) {
      case NavigationEnums.splash:
        return '/splash';
      default:
        return '/$name';
    }
  }

  NavigationEnums normalValue(String? val) {
    switch (val) {
      case '/':
        return NavigationEnums.splash;
      case null:
        throw Exception('$val not found in $this');
      default:
        try {
          return NavigationEnums.values.byName(val.substring(1));
        } catch (e) {
          throw Exception('$val not found in $this');
        }
    }
  }
}

enum TransitionType {
  fade,
  scale,
  rotate,
  size,
  slideLeftToRight,
  slideRightToLeft,
  slideTopToBottom,
  slideBottomToTop,
  leftToRightWithFade,
  rightToLeftWithFade,
  leftToRightJoined,
  rightToLeftJoined,
  topToBottomJoined,
  bottomToTopJoined,
  leftToRightPop,
  rightToLeftPop,
  topToBottomPop,
  bottomToTopPop,
}
