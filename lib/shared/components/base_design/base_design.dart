import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/shared/components/buttons/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_button_properties.dart';
import 'header_config.dart';

class BaseDesign extends StatelessWidget {
  final Function()? onBackPressed;
  final List<Widget> children;
  final EdgeInsetsGeometry? headerPadding;
  final EdgeInsetsGeometry? bodyPadding;
  final Widget? fab;
  final PreferredSizeWidget? bottom;
  final List<CustomButtonProperties>? buttonProperties;
  final CustomButtonProperties? secondaryButtonProperties;
  final double headerHeight;
  final double headerLeftPadding;
  final double topPadding;
  final double topHeight;
  final ScrollController? controller;
  final Widget? bottomWidget;
  final bool? isScrollable;
  final String? backgroundImagePath;
  final Widget? backgroundWidget;
  final BoxFit backgroundFit;
  final bool showAppVersion;
  final bool pinnedHeader;
  final HeaderConfig? headerConfig;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? drawer;
  final Widget? stickyWidget;
  final bool centerContent;
  final Color? topColor;
  final Color? bottomColor;

  const BaseDesign({
    super.key,
    required this.children,
    this.controller,
    this.headerPadding,
    this.buttonProperties,
    this.secondaryButtonProperties,
    this.bodyPadding,
    this.bottomWidget,
    this.headerLeftPadding = 0,
    this.topPadding = 54,
    this.fab,
    this.bottom,
    this.headerHeight = 117,
    this.topHeight = 61,
    this.onBackPressed,
    this.isScrollable = true,
    this.pinnedHeader = true,
    this.backgroundImagePath,
    this.backgroundWidget,
    this.backgroundFit = BoxFit.cover,
    this.showAppVersion = false,
    this.headerConfig,
    this.scaffoldKey,
    this.drawer,
    this.stickyWidget,
    this.centerContent = false,
    this.topColor,
    this.bottomColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          key: scaffoldKey,
          drawer: drawer,
          backgroundColor: Colors.transparent,
          floatingActionButton: fab,
          body: Stack(
            children: [
              Positioned.fill(child: _buildBackground()),
              Column(
                children: [
                  if (pinnedHeader && headerConfig != null)
                    _buildHeader(context),
                  if (pinnedHeader && bottom != null) bottom!,
                  if (stickyWidget != null)
                    Padding(
                      padding:
                          bodyPadding ??
                          appSizer.paddingSymmetric(horizontal: 16),
                      child: stickyWidget!,
                    ),
                  Expanded(child: _buildScrollView()),
                  if (bottomWidget != null)
                    Padding(
                      padding:
                          bodyPadding ??
                          appSizer.paddingSymmetric(horizontal: 16),
                      child: bottomWidget!,
                    ),
                  if (_hasBottomActions) _buildBottomActions(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    if (backgroundWidget != null) return backgroundWidget!;

    return Container(
      decoration: BoxDecoration(
        image: backgroundImagePath == null
            ? null
            : DecorationImage(
                image: AssetImage(backgroundImagePath!),
                fit: backgroundFit,
              ),
        gradient: backgroundImagePath == null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  topColor ?? AppColors.surface,
                  bottomColor ?? AppColors.baseWhite,
                ],
              )
            : null,
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: headerPadding ?? appSizer.paddingSymmetric(horizontal: 16),
      child: headerConfig!.build(context),
    );
  }

  Widget _buildScrollView() {
    return Builder(
      builder: (context) {
        final padding =
            bodyPadding ?? appSizer.paddingSymmetric(horizontal: 16);

        return CustomScrollView(
          controller: controller,
          physics: (isScrollable ?? true)
              ? const BouncingScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          slivers: [
            if (!pinnedHeader && headerConfig != null)
              SliverToBoxAdapter(child: _buildHeader(context)),
            if (!pinnedHeader && bottom != null)
              SliverToBoxAdapter(child: bottom!),
            if (centerContent)
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: padding,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: children,
                    ),
                  ),
                ),
              )
            else
              SliverList(
                delegate: SliverChildListDelegate(
                  children
                      .map((child) => Padding(padding: padding, child: child))
                      .toList(),
                ),
              ),
          ],
        );
      },
    );
  }

  bool get _hasBottomActions =>
      buttonProperties?.isNotEmpty == true || secondaryButtonProperties != null;

  Widget _buildBottomActions(BuildContext context) {
    final primaryButtons = buttonProperties ?? const <CustomButtonProperties>[];

    return Container(
      padding: EdgeInsets.fromLTRB(
        16,
        14,
        16,
        MediaQuery.paddingOf(context).bottom + 14,
      ),
      decoration: BoxDecoration(
        color: AppColors.baseWhite,
        border: const Border(top: BorderSide(color: AppColors.hairline)),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (primaryButtons.isNotEmpty)
            Row(
              children: [
                for (var index = 0; index < primaryButtons.length; index++) ...[
                  if (index > 0) const SizedBox(width: 10),
                  Expanded(child: _buildActionButton(primaryButtons[index])),
                ],
              ],
            ),
          if (primaryButtons.isNotEmpty && secondaryButtonProperties != null)
            const SizedBox(height: 10),
          if (secondaryButtonProperties != null)
            _buildActionButton(secondaryButtonProperties!, secondary: true),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    CustomButtonProperties properties, {
    bool secondary = false,
  }) {
    return CustomAppButton(
      onTap: properties.activity ? properties.onPressed : null,
      text: properties.text ?? '',
      iconPath: properties.iconPath,
      outsidePadding: properties.outsidePadding ?? EdgeInsets.zero,
      isActive: properties.activity,
      isUnderLine: properties.isUnderLine,
      backgroundColor: secondary
          ? AppColors.surfaceAlt
          : properties.color ?? AppColors.primary500,
      borderColor: secondary ? AppColors.hairline : properties.color,
      textColor: secondary ? AppColors.ink : AppColors.baseWhite,
      iconColor: secondary ? AppColors.ink : AppColors.baseWhite,
      showShadow: !secondary,
      child: properties.btnWidget,
    );
  }
}
