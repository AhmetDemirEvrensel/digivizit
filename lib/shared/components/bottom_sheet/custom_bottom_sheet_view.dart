import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/constants/icon_paths.dart';
import 'package:digivizit/core/navigation/navigation_enums.dart';
import 'package:digivizit/core/navigation/navigation_extension.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/core/utils/number_formatter.dart';
import 'package:digivizit/shared/components/buttons/button_properties.dart';
import 'package:digivizit/shared/components/buttons/custom_app_button.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:digivizit/shared/components/hexagon/hexagon_widget.dart';

import 'dart:io';
import 'dart:ui';

import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/constants/image_paths.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/shared/components/buttons/custom_app_button.dart';

enum TitlePosition { top, center }

class CustomBottomSheetView extends StatefulWidget {
  final bool neverClose;
  final bool isDismissible, viewTopBar;
  final bool showCloseButton;
  final Widget? child;
  final double titleTopPadding;
  final double? height;
  final List<ButtonProperties>? buttons;
  final List<ButtonProperties>? secondaryButtons;
  final String? title, titleIconPath, text, iconPath, iconSvgPath;
  final EdgeInsetsGeometry? padding;
  final bool useController;
  final bool centerAlign;
  final Color? viewTopBarColor;
  final Color? textColor;
  final Color? titleColor;
  final IconData? hexagonIcon;
  final Color? hexagonColor;
  final List<Color>? hexagonGradientColors;
  final Color? hexagonIconColor;
  final bool useGlassmorphism;

  const CustomBottomSheetView({
    super.key,
    this.padding,
    this.iconPath,
    this.iconSvgPath,
    this.centerAlign = true,
    this.titleIconPath,
    this.neverClose = false,
    this.useController = false,
    this.showCloseButton = true,
    this.titleTopPadding = 16,
    required this.viewTopBar,
    required this.isDismissible,
    required this.child,
    required this.buttons,
    required this.secondaryButtons,
    required this.title,
    required this.text,
    this.viewTopBarColor,
    this.height,
    this.textColor,
    this.titleColor,
    this.hexagonIcon,
    this.hexagonColor,
    this.hexagonGradientColors,
    this.hexagonIconColor,
    this.useGlassmorphism = true,
  });

  @override
  State<CustomBottomSheetView> createState() => _CustomBottomSheetViewState();
}

class _CustomBottomSheetViewState extends State<CustomBottomSheetView> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: widget.isDismissible && !widget.neverClose,
      child: _view(height: widget.height),
    );
  }

  Widget _view({double? height}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: height == null ? null : appSizer.px(height, Axis.vertical),
      child: Padding(
        padding:
            widget.padding ??
            appSizer.paddingSymmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: height != null ? MainAxisSize.max : MainAxisSize.min,
          children: [
            // Top bar
            _buildTopRow(),
            FigmaBox(height: 32),

            // Content section - if height is set, this expands to fill space
            if (height != null)
              Expanded(child: SingleChildScrollView(child: _buildContent()))
            else
              _buildContent(),

            // Buttons Section (always at bottom)
            _buildButtonsSection(),
          ],
        ),
      ),
    );
  }

  /// Builds the content section (icons, title, text, child)
  Widget _buildContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Hexagon icon if provided
        if (widget.hexagonIcon != null) ...[
          HexagonWidget.icon(
            size: 80,
            icon: widget.hexagonIcon!,
            fillColor: widget.hexagonColor ?? AppColors.negative700,
            gradientColors: widget.hexagonColor != null
                ? (widget.hexagonGradientColors ??
                      [AppColors.tertiary500, AppColors.primary500])
                : null,
            iconColor: widget.hexagonIconColor ?? AppColors.baseWhite,
            borderColor: AppColors.baseWhite.withValues(alpha: 0.30),
            iconSize: 36,
          ),
          FigmaBox(height: 32),
        ],

        // Image icon if provided
        if (widget.iconPath != null) ...[
          Image.asset(widget.iconPath!, height: 80.pxv),
          FigmaBox(height: 20),
        ],

        // SVG icon if provided
        if (widget.iconSvgPath != null) ...[
          Image.asset(widget.iconSvgPath!, height: 80.pxv),
          FigmaBox(height: 20),
        ],

        // Title
        if (widget.title != null) ...[
          Text(
            widget.title!,
            textAlign: widget.centerAlign ? TextAlign.center : TextAlign.start,
            style: AppFonts.xl2Bold.copyWith(
              color: widget.titleColor ?? AppColors.baseWhite,
            ),
          ),
          FigmaBox(height: 20),
        ],

        // Subtitle/Text
        if (widget.text != null) ...[
          Padding(
            padding: appSizer.paddingSymmetric(horizontal: 16),
            child: Text(
              widget.text!,
              textAlign: widget.centerAlign
                  ? TextAlign.center
                  : TextAlign.start,
              style: AppFonts.lgRegular.copyWith(
                color: widget.textColor ?? AppColors.neutral300,
              ),
            ),
          ),
          FigmaBox(height: 20),
        ],

        // Custom child widget
        if (widget.child != null) widget.child!,
      ],
    );
  }

  /// Builds the buttons section (always at bottom)
  Widget _buildButtonsSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Primary buttons
        if (widget.buttons != null) ...[
          ...widget.buttons!.map(
            (button) => Padding(
              padding: appSizer.paddingOnly(bottom: 12),
              child: _buildButton(button, isPrimary: true),
            ),
          ),
        ],

        // Secondary buttons
        if (widget.secondaryButtons != null) ...[
          ...widget.secondaryButtons!.map(
            (button) => Padding(
              padding: appSizer.paddingOnly(bottom: 12),
              child: _buildButton(button, isPrimary: false),
            ),
          ),
        ],

        // Bottom safe area padding
        FigmaBox(height: MediaQuery.of(context).padding.bottom > 0 ? 8 : 24),
      ],
    );
  }

  Widget _buildTopRow() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Center drag handle
        if (widget.viewTopBar)
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: widget.viewTopBarColor ?? AppColors.neutral500,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        // Close button on the right
        /* if (widget.showCloseButton && widget.isDismissible)
          Positioned(
            right: 0,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(color: AppColors.baseWhite.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(8)),
                child: Icon(Icons.close, color: AppColors.baseWhite.withValues(alpha: 0.7), size: 20),
              ),
            ),
          ), */
      ],
    );
  }

  Widget _buildButton(ButtonProperties button, {required bool isPrimary}) {
    return CustomAppButton(
      onTap: button.onPressed,
      text: button.text ?? '',
      subtitle: button.subtitle,
      layoutType: button.layoutType,
      styleType: button.styleType,
      iconPath: button.iconPath,
      iconSize: button.iconSize,
      leadingIcon: button.leadingIcon,
      leadingIconPath: button.leadingIconPath,
      backgroundColor: button.backgroundColor ?? button.color,
      gradient: button.gradient,
      borderColor: button.borderColor,
      textColor: button.textColor,
      iconColor: button.iconColor,
      buttonHeight: button.buttonHeight,
      borderRadius: button.borderRadius,
      textSize: button.textSize,
      iconSpacing: button.iconSpacing,
      outsidePadding: button.outsidePadding,
      contentPadding: button.contentPadding,
      isActive: button.isActive,
      isUnderLine: button.isUnderLine,
      showShadow: button.showShadow,
      showArrow: button.showArrow,
      showProBadge: button.showProBadge,
      contentAlignment: button.contentAlignment,
      hexagonSize: button.hexagonSize,
      hexagonFillColor: button.hexagonFillColor,
      hexagonBorderColor: button.hexagonBorderColor,
      hexagonIconColor: button.hexagonIconColor,
      child: button.child,
    );
  }
}

class CustomBottomSheet {
  /// Type alias for builder functions that receive setState
  static Future<void> customView({
    double? height = 545,
    bool isDismissible = true,
    bool viewTopBar = true,
    bool showCloseButton = true,
    bool neverClose = false,
    bool toTitleCase = true,
    bool centerAlign = true,
    bool useController = false,
    bool btnTitleCase = true,
    bool useGlassmorphism = true,
    double blurSigma = 20,
    double glassOpacity = 0.30,
    double glassBorderOpacity = 0.1,
    List<ButtonProperties>? buttons,
    List<ButtonProperties>? secondaryButtons,

    /// Builder for dynamic buttons - receives setState function
    List<ButtonProperties> Function(void Function(void Function()) setState)?
    buttonsBuilder,

    /// Builder for dynamic secondary buttons - receives setState function
    List<ButtonProperties> Function(void Function(void Function()) setState)?
    secondaryButtonsBuilder,

    /// Builder for dynamic child - receives setState function
    Widget Function(void Function(void Function()) setState)? childBuilder,
    Color? barrierColor,
    Color? backgroundColor,
    Widget? child,
    String? text,
    String? iconPath,
    String? iconSvgPath,
    String? titleIconPath,
    EdgeInsetsGeometry? padding,
    String? title,
    Color? viewTopBarColor,
    Color? textColor,
    Color? titleColor,
    IconData? hexagonIcon,
    Color? hexagonColor,
    List<Color>? hexagonGradientColors,
    Color? hexagonIconColor,
    double borderRadius = 50,
    double titleTopPadding = 16,
    required BuildContext context,
  }) async {
    await showModalBottomSheet(
      enableDrag: !neverClose,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
      ),
      barrierColor: barrierColor ?? Colors.black.withValues(alpha: 0.6),
      backgroundColor: backgroundColor ?? Colors.transparent,
      isDismissible: isDismissible,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            // Get dynamic content if builder is provided
            final dynamicButtons = buttonsBuilder?.call(setSheetState);
            final dynamicSecondaryButtons = secondaryButtonsBuilder?.call(
              setSheetState,
            );
            final dynamicChild = childBuilder?.call(setSheetState);

            return ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(borderRadius),
              ),
              child: BackdropFilter(
                filter: useGlassmorphism
                    ? ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma)
                    : ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                child: FigmaContainer(
                  decoration: BoxDecoration(
                    color: useGlassmorphism
                        ? (backgroundColor ?? AppColors.primary500).withValues(
                            alpha: glassOpacity,
                          )
                        : (backgroundColor ?? AppColors.baseWhite),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(borderRadius),
                    ),
                    border: useGlassmorphism
                        ? Border.all(
                            color: AppColors.baseWhite.withValues(
                              alpha: glassBorderOpacity,
                            ),
                            width: 2,
                          )
                        : null,
                  ),
                  child: Padding(
                    padding: appSizer.paddingOnly(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: height != null
                        ? CustomBottomSheetView(
                            neverClose: neverClose,
                            isDismissible: isDismissible,
                            useController: useController,
                            centerAlign: centerAlign,
                            showCloseButton: showCloseButton,
                            iconPath: iconPath,
                            iconSvgPath: iconSvgPath,
                            height: height,
                            padding: padding,
                            titleTopPadding: titleTopPadding,
                            buttons: dynamicButtons ?? buttons,
                            secondaryButtons:
                                dynamicSecondaryButtons ?? secondaryButtons,
                            text: text,
                            title: title,
                            titleIconPath: titleIconPath,
                            viewTopBar: viewTopBar,
                            viewTopBarColor: viewTopBarColor,
                            textColor: textColor,
                            titleColor: titleColor,
                            hexagonIcon: hexagonIcon,
                            hexagonColor: hexagonColor,
                            hexagonGradientColors: hexagonGradientColors,
                            hexagonIconColor: hexagonIconColor,
                            useGlassmorphism: useGlassmorphism,
                            child: dynamicChild ?? child,
                          )
                        : SingleChildScrollView(
                            child: CustomBottomSheetView(
                              neverClose: neverClose,
                              isDismissible: isDismissible,
                              useController: useController,
                              centerAlign: centerAlign,
                              showCloseButton: showCloseButton,
                              iconPath: iconPath,
                              iconSvgPath: iconSvgPath,
                              height: height,
                              padding: padding,
                              titleTopPadding: titleTopPadding,
                              buttons: dynamicButtons ?? buttons,
                              secondaryButtons:
                                  dynamicSecondaryButtons ?? secondaryButtons,
                              text: text,
                              title: title,
                              titleIconPath: titleIconPath,
                              viewTopBar: viewTopBar,
                              viewTopBarColor: viewTopBarColor,
                              textColor: textColor,
                              titleColor: titleColor,
                              hexagonIcon: hexagonIcon,
                              hexagonColor: hexagonColor,
                              hexagonGradientColors: hexagonGradientColors,
                              hexagonIconColor: hexagonIconColor,
                              useGlassmorphism: useGlassmorphism,
                              child: dynamicChild ?? child,
                            ),
                          ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  static void successView({
    required String text,
    String? title,
    Function()? onButtonPressed,
    List<ButtonProperties>? secondaryButtons,
  }) {
    CustomBottomSheet.customView(
      viewTopBar: true,
      backgroundColor: AppColors.primary500.withValues(alpha: 0.15),
      title: title ?? 'İşlem Başarılı',
      hexagonIcon: Icons.check_circle_outline,
      hexagonColor: AppColors.positive600,
      text: text,
      height: 545,
      borderRadius: 50,
      context: AppSettings.instance.context!,
      buttons: [
        ButtonProperties(
          onPressed: () {
            Navigator.pop(AppSettings.instance.context!);
            onButtonPressed?.call();
          },
          text: "Tamam",
          color: AppColors.positive600,
        ),
      ],
      secondaryButtons: secondaryButtons,
    );
  }

  static void errorView({
    required String text,
    String? title,
    Function()? onButtonPressed,
  }) {
    CustomBottomSheet.customView(
      viewTopBar: true,
      backgroundColor: AppColors.primary500.withValues(alpha: 0.15),
      title: title ?? 'Servis Hatası',
      hexagonIcon: Icons.error_outline,
      hexagonColor: AppColors.negative700,
      text: text,
      height: 519,
      borderRadius: 50,
      context: AppSettings.instance.context!,
      buttons: [
        ButtonProperties(
          onPressed: () {
            Navigator.pop(AppSettings.instance.context!);
            onButtonPressed?.call();
          },
          text: "Tamam",
          color: AppColors.negative700,
        ),
      ],
    );
  }

  static void notificationView({
    required String text,
    Function()? onButtonPressed,
  }) {
    CustomBottomSheet.customView(
      viewTopBar: true,
      backgroundColor: AppColors.primary500.withValues(alpha: 0.15),
      title: 'Bildriim',
      hexagonIcon: Icons.error_outline,
      hexagonColor: AppColors.negative700,
      text: text,
      height: 519,
      borderRadius: 50,
      context: AppSettings.instance.context!,
      buttons: [
        ButtonProperties(
          onPressed: () {
            Navigator.pop(AppSettings.instance.context!);
            onButtonPressed?.call();
          },
          text: "Tamam",
          color: AppColors.negative700,
        ),
      ],
    );
  }

  static void alertView({
    required String text,
    String? title,
    Function()? onButtonPressed,
  }) {
    CustomBottomSheet.customView(
      viewTopBar: true,
      backgroundColor: AppColors.primary500.withValues(alpha: 0.15),
      title: title ?? 'Uyarı',
      hexagonIcon: Icons.warning_amber_rounded,
      hexagonColor: AppColors.warning500,
      text: text,
      height: 519,
      borderRadius: 50,
      context: AppSettings.instance.context!,
      buttons: [
        ButtonProperties(
          onPressed: () {
            Navigator.pop(AppSettings.instance.context!);
            onButtonPressed?.call();
          },
          text: "Tamam",
          color: AppColors.warning500,
        ),
      ],
    );
  }
}
