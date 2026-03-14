import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:flutter/material.dart';

import 'package:digivizit/shared/components/containers/figma_container.dart';

enum CustomTabBarType { icon, text }

class CustomTabBar extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final dynamic model;
  final CustomTabBarType type;
  final List<Widget> children;
  const CustomTabBar._({
    super.key,
    required this.model,
    this.padding,
    required this.type,
    required this.children,
  });

  factory CustomTabBar.icon({
    Key? key,
    required dynamic model,
    EdgeInsetsGeometry? padding,
    required List<Widget> children,
  }) {
    return CustomTabBar._(
      key: key,
      model: model,
      padding: padding,
      type: CustomTabBarType.icon,
      children: children,
    );
  }

  factory CustomTabBar.text({
    Key? key,
    required dynamic model,
    EdgeInsetsGeometry? padding,
    required List<Widget> children,
  }) {
    return CustomTabBar._(
      key: key,
      model: model,
      padding: padding,
      type: CustomTabBarType.text,
      children: children,
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      CustomTabBarType.icon => _buildIconTabBar(),
      CustomTabBarType.text => _buildTextTabBar(),
    };
  }

  Widget _buildIconTabBar() {
    return Padding(
      padding: padding ?? appSizer.paddingOnly(top: 10),
      child: FigmaContainer(
        width: double.infinity,
        height: 91,
        padding: appSizer.paddingAll(1.15),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xEA253D84), Color(0xE0146DA0)],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.15,
              color: Colors.white.withValues(alpha: 0.20),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 32,
              offset: Offset(0, 8),
            ),
            BoxShadow(
              color: Color(0x4C253D84),
              blurRadius: 24,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        ),
      ),
    );
  }

  Widget _buildTextTabBar() {
    return Padding(
      padding: padding ?? appSizer.paddingOnly(top: 10),
      child: FigmaContainer(
        width: double.infinity,
        height: 60,
        padding: appSizer.paddingAll(1.15),
        decoration: ShapeDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xEA253D84), Color(0xE0146DA0)],
          ),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1.15,
              color: Colors.white.withValues(alpha: 0.20),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 32,
              offset: Offset(0, 8),
            ),
            BoxShadow(
              color: Color(0x4C253D84),
              blurRadius: 24,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: children,
        ),
      ),
    );
  }
}
