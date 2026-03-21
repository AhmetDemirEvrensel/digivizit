import 'dart:io';
import 'dart:ui';

import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/constants/image_paths.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/shared/components/buttons/custom_app_button.dart';

import 'custom_button_properties.dart';
import 'header_config.dart';

class BaseDesign extends StatelessWidget {
  final Function()? onBackPressed;
  final List<Widget> children;
  final EdgeInsetsGeometry? headerPadding, bodyPadding;
  final Widget? fab;
  final PreferredSizeWidget? bottom;
  final List<CustomButtonProperties>? buttonProperties;
  final CustomButtonProperties? secondaryButtonProperties;
  final double headerHeight, headerLeftPadding, topPadding, topHeight;
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
      onTap: () => FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          key: scaffoldKey,
          drawer: drawer,
          body: Stack(
            children: [
              // Background - Gradient or Image
              if (backgroundWidget != null || backgroundImagePath != null)
                Positioned.fill(
                  child:
                      backgroundWidget ??
                      Image.asset(
                        backgroundImagePath ?? ImagePaths.appBackground,
                        fit: backgroundFit,
                      ),
                )
              else
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          topColor ??
                              AppColors.primary500.withValues(alpha: 0.8),
                          bottomColor ??
                              AppColors.primary500.withValues(alpha: 0.8),
                        ],
                      ),
                    ),
                  ),
                ),
              Column(
                children: [
                  // pinnedHeader true ise header scrollable alanın dışında
                  if (pinnedHeader)
                    Padding(
                      padding:
                          headerPadding ??
                          appSizer.paddingSymmetric(horizontal: 16),
                      child: header,
                    ),
                  // Sticky widget - header altında sabit kalır
                  if (stickyWidget != null)
                    Padding(
                      padding:
                          bodyPadding ??
                          appSizer.paddingSymmetric(horizontal: 16),
                      child: stickyWidget!,
                    ),
                  Expanded(
                    child: CustomScrollView(
                      physics: isScrollable!
                          ? null
                          : const NeverScrollableScrollPhysics(),
                      controller: controller,
                      slivers: [
                        // pinnedHeader false ise SliverAppBar kullan
                        if (!pinnedHeader)
                          MediaQuery.removePadding(
                            context: context,
                            removeBottom: true,
                            removeTop: true,
                            removeRight: true,
                            removeLeft: true,
                            child: SliverAppBar(
                              leading: null,
                              floating: true,
                              automaticallyImplyLeading: false,
                              bottom: bottom,
                              toolbarHeight: appSizer.px(
                                headerHeight,
                                Axis.vertical,
                              ),
                              flexibleSpace: FlexibleSpaceBar(
                                background: Column(
                                  children: [
                                    Padding(
                                      padding:
                                          headerPadding ??
                                          appSizer.paddingSymmetric(
                                            horizontal: 16,
                                          ),
                                      child: header,
                                    ),
                                  ],
                                ),
                              ),
                              backgroundColor: Colors.transparent,
                              expandedHeight: appSizer.px(
                                headerHeight,
                                Axis.vertical,
                              ),
                            ),
                          ),
                        if (centerContent)
                          SliverFillRemaining(
                            hasScrollBody: false,
                            child: Padding(
                              padding:
                                  bodyPadding ??
                                  appSizer.paddingSymmetric(horizontal: 16),
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
                                  .map(
                                    (e) => Padding(
                                      padding:
                                          bodyPadding ??
                                          appSizer.paddingSymmetric(
                                            horizontal: 16,
                                          ),
                                      child: e,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (bottomWidget != null)
                    Padding(
                      padding:
                          bodyPadding ??
                          appSizer.paddingSymmetric(horizontal: 16),
                      child: bottomWidget!,
                    ),
                  if (buttonProperties != null &&
                          buttonProperties!.isNotEmpty ||
                      secondaryButtonProperties != null)
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(28),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.baseBlack.withValues(alpha: 0.30),
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(28),
                            ),
                            border: Border(
                              top: BorderSide(
                                color: AppColors.baseWhite.withValues(
                                  alpha: 0.30,
                                ),
                                width: 1.15,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (buttonProperties != null &&
                                  buttonProperties!.isNotEmpty)
                                Padding(
                                  padding:
                                      buttonProperties!.first.padding ??
                                      appSizer.paddingOnly(
                                        top: 16,
                                        bottom:
                                            secondaryButtonProperties == null
                                            ? 30
                                            : 16,
                                      ),
                                  child: Builder(
                                    builder: (context) {
                                      if (buttonProperties!.length == 2) {
                                        return Padding(
                                          padding: appSizer.paddingSymmetric(
                                            horizontal: 16,
                                          ),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: CustomAppButton(
                                                  backgroundColor:
                                                      buttonProperties![0]
                                                          .color,
                                                  buttonHeight: 60.pxv,
                                                  onTap: () {
                                                    if (buttonProperties![0]
                                                            .activity ==
                                                        false) {
                                                      return;
                                                    }
                                                    if (buttonProperties![0]
                                                            .onPressed !=
                                                        null) {
                                                      buttonProperties![0]
                                                          .onPressed!();
                                                    }
                                                  },
                                                  iconPath: buttonProperties![0]
                                                      .iconPath,
                                                  outsidePadding:
                                                      EdgeInsets.zero,
                                                  isActive:
                                                      buttonProperties![0]
                                                          .activity !=
                                                      false,
                                                  text:
                                                      buttonProperties![0]
                                                          .text ??
                                                      '',
                                                  isUnderLine:
                                                      buttonProperties![0]
                                                          .isUnderLine,
                                                  child: buttonProperties![0]
                                                      .btnWidget,
                                                ),
                                              ),
                                              10.spacerH,
                                              Expanded(
                                                child: CustomAppButton(
                                                  backgroundColor:
                                                      buttonProperties![1]
                                                          .color,
                                                  buttonHeight: 60.pxv,
                                                  onTap: () {
                                                    if (buttonProperties![1]
                                                            .activity ==
                                                        false) {
                                                      return;
                                                    }
                                                    if (buttonProperties![1]
                                                            .onPressed !=
                                                        null) {
                                                      buttonProperties![1]
                                                          .onPressed!();
                                                    }
                                                  },
                                                  iconPath: buttonProperties![1]
                                                      .iconPath,
                                                  isActive:
                                                      buttonProperties![1]
                                                          .activity !=
                                                      false,
                                                  text:
                                                      buttonProperties![1]
                                                          .text ??
                                                      '',
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      // Default single button behavior
                                      final prop = buttonProperties!.first;
                                      return CustomAppButton(
                                        onTap: () {
                                          if (prop.activity == false) return;
                                          if (prop.onPressed != null) {
                                            prop.onPressed!();
                                          }
                                        },
                                        iconPath: prop.iconPath,
                                        outsidePadding:
                                            prop.outsidePadding ??
                                            appSizer.paddingSymmetric(
                                              horizontal: 16,
                                            ),
                                        isActive: prop.activity != false,
                                        buttonHeight: 55.pxv,
                                        text: prop.text ?? '',
                                        isUnderLine: prop.isUnderLine,
                                        child: prop.btnWidget,
                                      );
                                    },
                                  ),
                                ),
                              if (secondaryButtonProperties != null)
                                Padding(
                                  padding:
                                      secondaryButtonProperties!.padding ??
                                      appSizer.paddingOnly(
                                        bottom: (Platform.isIOS ? 21 : 0) + 21,
                                        top: buttonProperties == null ? 15 : 0,
                                      ),
                                  child: CustomAppButton(
                                    onTap: () {
                                      if (secondaryButtonProperties?.activity ==
                                          false) {
                                        return;
                                      }
                                      if (secondaryButtonProperties
                                              ?.onPressed !=
                                          null) {
                                        secondaryButtonProperties?.onPressed!();
                                      }
                                    },
                                    iconPath:
                                        secondaryButtonProperties?.iconPath,
                                    outsidePadding:
                                        secondaryButtonProperties!
                                            .outsidePadding ??
                                        appSizer.paddingSymmetric(
                                          horizontal: 16,
                                        ),
                                    isActive:
                                        secondaryButtonProperties?.activity !=
                                        false,
                                    text: secondaryButtonProperties?.text ?? '',
                                    isUnderLine:
                                        secondaryButtonProperties!.isUnderLine,
                                    child: secondaryButtonProperties!.btnWidget,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              if (fab != null)
                Positioned(
                  right: appSizer.px(16, Axis.horizontal),
                  bottom: appSizer.px(
                    60 + (Platform.isIOS ? 21 : 0),
                    Axis.vertical,
                  ),
                  child: fab!,
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget get header {
    if (headerConfig != null) {
      return headerConfig!.build(AppSettings.instance.context!);
    }
    return const SizedBox.shrink();
  }
}
