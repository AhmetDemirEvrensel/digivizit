import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/shared/components/buttons/button_properties.dart';
import 'package:digivizit/shared/components/buttons/custom_app_button.dart';
import 'package:flutter/material.dart';

enum TitlePosition { top, center }

class CustomBottomSheetView extends StatefulWidget {
  final bool neverClose;
  final bool isDismissible;
  final bool viewTopBar;
  final bool showCloseButton;
  final Widget? child;
  final double titleTopPadding;
  final double? height;
  final List<ButtonProperties>? buttons;
  final List<ButtonProperties>? secondaryButtons;
  final String? title;
  final String? titleIconPath;
  final String? text;
  final String? iconPath;
  final String? iconSvgPath;
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
    this.showCloseButton = false,
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
    this.useGlassmorphism = false,
  });

  @override
  State<CustomBottomSheetView> createState() => _CustomBottomSheetViewState();
}

class _CustomBottomSheetViewState extends State<CustomBottomSheetView> {
  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: widget.padding ?? const EdgeInsets.fromLTRB(24, 12, 24, 12),
      child: Column(
        mainAxisSize: widget.height == null
            ? MainAxisSize.min
            : MainAxisSize.max,
        children: [
          _buildTopRow(),
          const SizedBox(height: 20),
          if (widget.height == null)
            _buildContent()
          else
            Expanded(child: SingleChildScrollView(child: _buildContent())),
          _buildButtonsSection(),
        ],
      ),
    );

    return PopScope(
      canPop: widget.isDismissible && !widget.neverClose,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        height: widget.height == null
            ? null
            : appSizer.px(widget.height!, Axis.vertical),
        child: content,
      ),
    );
  }

  Widget _buildTopRow() {
    final canShowCloseButton =
        widget.showCloseButton && widget.isDismissible && !widget.neverClose;

    return SizedBox(
      height: canShowCloseButton ? 36 : (widget.viewTopBar ? 12 : 0),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (widget.viewTopBar)
            Container(
              width: 42,
              height: 5,
              decoration: BoxDecoration(
                color: widget.viewTopBarColor ?? AppColors.hairline,
                borderRadius: BorderRadius.circular(99),
              ),
            ),
          if (canShowCloseButton)
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                tooltip: 'Kapat',
                onPressed: () => Navigator.of(context).pop(),
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.surfaceAlt,
                  foregroundColor: AppColors.inkSoft,
                ),
                icon: const Icon(Icons.close_rounded, size: 20),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    final alignment = widget.centerAlign
        ? CrossAxisAlignment.center
        : CrossAxisAlignment.start;
    final textAlign = widget.centerAlign ? TextAlign.center : TextAlign.start;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: alignment,
      children: [
        if (widget.hexagonIcon != null) ...[
          _buildStatusIcon(),
          const SizedBox(height: 18),
        ],
        if (widget.iconPath != null) ...[
          _buildAssetIcon(widget.iconPath!),
          const SizedBox(height: 18),
        ],
        if (widget.iconSvgPath != null) ...[
          _buildAssetIcon(widget.iconSvgPath!),
          const SizedBox(height: 18),
        ],
        if (widget.title != null) ...[
          Text(
            widget.title!,
            textAlign: textAlign,
            style: AppFonts.xl2Bold.copyWith(
              color: widget.titleColor ?? AppColors.ink,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 10),
        ],
        if (widget.text != null) ...[
          Text(
            widget.text!,
            textAlign: textAlign,
            style: AppFonts.base2Regular.copyWith(
              color: widget.textColor ?? AppColors.inkSoft,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),
        ],
        if (widget.child != null) widget.child!,
      ],
    );
  }

  Widget _buildStatusIcon() {
    final accent = widget.hexagonColor ?? AppColors.primary600;
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: accent.withValues(alpha: 0.10),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Icon(
        widget.hexagonIcon,
        size: 29,
        color: widget.hexagonIconColor ?? accent,
      ),
    );
  }

  Widget _buildAssetIcon(String path) {
    return Container(
      width: 64,
      height: 64,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(path, fit: BoxFit.contain),
    );
  }

  Widget _buildButtonsSection() {
    final hasButtons = widget.buttons?.isNotEmpty == true;
    final hasSecondaryButtons = widget.secondaryButtons?.isNotEmpty == true;
    if (!hasButtons && !hasSecondaryButtons) {
      return SizedBox(height: MediaQuery.paddingOf(context).bottom + 12);
    }

    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ...?widget.buttons?.map(
            (button) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _buildButton(button, isPrimary: true),
            ),
          ),
          ...?widget.secondaryButtons?.map(
            (button) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: _buildButton(button, isPrimary: false),
            ),
          ),
          SizedBox(height: MediaQuery.paddingOf(context).bottom > 0 ? 2 : 10),
        ],
      ),
    );
  }

  Widget _buildButton(ButtonProperties button, {required bool isPrimary}) {
    final fallbackBackground = isPrimary
        ? AppColors.primary500
        : AppColors.surfaceAlt;
    final background =
        button.backgroundColor ?? button.color ?? fallbackBackground;

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
      backgroundColor: background,
      gradient: button.gradient,
      borderColor:
          button.borderColor ?? (isPrimary ? background : AppColors.hairline),
      textColor:
          button.textColor ?? (isPrimary ? AppColors.baseWhite : AppColors.ink),
      iconColor:
          button.iconColor ?? (isPrimary ? AppColors.baseWhite : AppColors.ink),
      buttonHeight: button.buttonHeight,
      borderRadius: button.borderRadius,
      textSize: button.textSize,
      iconSpacing: button.iconSpacing,
      outsidePadding: button.outsidePadding,
      contentPadding: button.contentPadding,
      isActive: button.isActive,
      isUnderLine: button.isUnderLine,
      showShadow: isPrimary && button.showShadow,
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
  static Future<void> customView({
    double? height,
    bool isDismissible = true,
    bool viewTopBar = true,
    bool showCloseButton = false,
    bool neverClose = false,
    bool toTitleCase = true,
    bool centerAlign = true,
    bool useController = false,
    bool btnTitleCase = true,
    bool useGlassmorphism = false,
    double blurSigma = 20,
    double glassOpacity = 0.90,
    double glassBorderOpacity = 0.1,
    List<ButtonProperties>? buttons,
    List<ButtonProperties>? secondaryButtons,
    List<ButtonProperties> Function(void Function(void Function()) setState)?
    buttonsBuilder,
    List<ButtonProperties> Function(void Function(void Function()) setState)?
    secondaryButtonsBuilder,
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
    double borderRadius = 32,
    double titleTopPadding = 16,
    required BuildContext context,
  }) async {
    await showModalBottomSheet<void>(
      enableDrag: !neverClose,
      barrierColor: barrierColor ?? AppColors.ink.withValues(alpha: 0.35),
      backgroundColor: Colors.transparent,
      isDismissible: isDismissible,
      isScrollControlled: true,
      context: context,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            final dynamicButtons = buttonsBuilder?.call(setSheetState);
            final dynamicSecondaryButtons = secondaryButtonsBuilder?.call(
              setSheetState,
            );
            final dynamicChild = childBuilder?.call(setSheetState);

            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.viewInsetsOf(context).bottom,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor ?? AppColors.baseWhite,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(borderRadius),
                  ),
                  border: const Border(
                    top: BorderSide(color: AppColors.hairline),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.ink.withValues(alpha: 0.10),
                      blurRadius: 32,
                      offset: const Offset(0, -10),
                    ),
                  ],
                ),
                child: SafeArea(
                  top: false,
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
    customView(
      title: title ?? 'İşlem Başarılı',
      hexagonIcon: Icons.check_rounded,
      hexagonColor: AppColors.positive600,
      text: text,
      context: AppSettings.instance.context!,
      buttons: [
        ButtonProperties(
          onPressed: () {
            Navigator.pop(AppSettings.instance.context!);
            onButtonPressed?.call();
          },
          text: 'Tamam',
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
    customView(
      title: title ?? 'Bir Sorun Oluştu',
      hexagonIcon: Icons.error_outline_rounded,
      hexagonColor: AppColors.negative500,
      text: text,
      context: AppSettings.instance.context!,
      buttons: [
        ButtonProperties(
          onPressed: () {
            Navigator.pop(AppSettings.instance.context!);
            onButtonPressed?.call();
          },
          text: 'Tamam',
          color: AppColors.negative500,
        ),
      ],
    );
  }

  static void notificationView({
    required String text,
    Function()? onButtonPressed,
  }) {
    customView(
      title: 'Bildirim',
      hexagonIcon: Icons.notifications_none_rounded,
      hexagonColor: AppColors.primary600,
      text: text,
      context: AppSettings.instance.context!,
      buttons: [
        ButtonProperties(
          onPressed: () {
            Navigator.pop(AppSettings.instance.context!);
            onButtonPressed?.call();
          },
          text: 'Tamam',
          color: AppColors.primary500,
        ),
      ],
    );
  }

  static void alertView({
    required String text,
    String? title,
    Function()? onButtonPressed,
  }) {
    customView(
      title: title ?? 'Dikkat',
      hexagonIcon: Icons.warning_amber_rounded,
      hexagonColor: AppColors.warning600,
      text: text,
      context: AppSettings.instance.context!,
      buttons: [
        ButtonProperties(
          onPressed: () {
            Navigator.pop(AppSettings.instance.context!);
            onButtonPressed?.call();
          },
          text: 'Tamam',
          color: AppColors.warning600,
        ),
      ],
    );
  }
}
