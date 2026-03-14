import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';

class NavigationArgs {
  final Object? data;
  final TransitionType? transitionType;
  final PageTransitionType? pageTransitionType;
  final Duration? transitionDuration;
  final Widget? childCurrent;

  const NavigationArgs({this.data, this.transitionType, this.pageTransitionType, this.transitionDuration, this.childCurrent});
}
