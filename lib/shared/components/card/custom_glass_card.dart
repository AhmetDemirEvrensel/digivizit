import 'dart:ui';

import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/constants/icon_paths.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:digivizit/shared/components/hexagon/hexagon_widget.dart';

enum GlassType { text, icon, dateTime, plate }

class CustomGlassCard extends StatelessWidget {
  final dynamic model;
  final String title;
  final Widget child;
  final bool? isCenter;
  final bool moreGlass;
  final GlassType glassType;
  final String? icon;
  final String? subtitle;
  final String? time;
  final String? plate;
  final String? productName;
  final String? total;
  final String? liter;
  final String? price;
  final Widget? headerRight;
  final bool? selectedPeriod;
  final List<Color>? gradient;
  const CustomGlassCard._({
    super.key,
    this.model,
    required this.title,
    required this.child,
    this.isCenter,
    this.moreGlass = false,
    required this.glassType,
    this.icon,
    this.subtitle,
    this.time,
    this.plate,
    this.productName,
    this.total,
    this.liter,
    this.price,
    this.selectedPeriod,
    this.gradient,
    this.headerRight,
  });

  factory CustomGlassCard.text({
    Key? key,
    dynamic model,
    required String title,
    required Widget child,
    String? subtitle,
    Widget? headerRight,
    bool? isCenter,
    bool moreGlass = false,
    List<Color>? gradient,
    GlassType glassType = GlassType.text,
  }) {
    return CustomGlassCard._(
      key: key,
      model: model,
      title: title,
      subtitle: subtitle,
      headerRight: headerRight,
      isCenter: isCenter,
      moreGlass: moreGlass,
      glassType: glassType,
      gradient: gradient,
      child: child,
    );
  }

  factory CustomGlassCard.icon({
    Key? key,
    dynamic model,
    required String title,
    required Widget child,
    bool? isCenter,
    bool moreGlass = false,
    GlassType glassType = GlassType.icon,
    String? icon,
    String? subtitle,
  }) {
    return CustomGlassCard._(
      key: key,
      model: model,
      title: title,
      isCenter: isCenter,
      moreGlass: moreGlass,
      glassType: glassType,
      icon: icon,
      subtitle: subtitle,
      child: child,
    );
  }

  factory CustomGlassCard.dateTime({
    Key? key,
    dynamic model,
    required String title,
    required Widget child,
    bool? isCenter,
    bool moreGlass = false,
    GlassType glassType = GlassType.dateTime,
    String? icon,
    String? subtitle,
    String? time,
    String? productName,
    String? total,
    String? liter,
    String? price,
    bool? selectedPeriod,
  }) {
    return CustomGlassCard._(
      key: key,
      model: model,
      title: title,
      isCenter: isCenter,
      moreGlass: moreGlass,
      glassType: glassType,
      icon: icon,
      subtitle: subtitle,
      time: time,
      productName: productName,
      total: total,
      liter: liter,
      price: price,
      selectedPeriod: selectedPeriod,
      child: child,
    );
  }

  factory CustomGlassCard.plate({
    Key? key,
    dynamic model,
    required String title,
    required Widget child,
    bool? isCenter,
    bool moreGlass = false,
    GlassType glassType = GlassType.plate,
    String? plate,
  }) {
    return CustomGlassCard._(
      key: key,
      model: model,
      title: title,
      isCenter: isCenter,
      moreGlass: moreGlass,
      glassType: glassType,
      plate: plate,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (glassType) {
      GlassType.text => _buildTextCard(),
      GlassType.icon => _buildIconCard(),
      GlassType.dateTime => _buildDateTimeCard(),
      GlassType.plate => _buildPlateCard(),
    };
  }

  Widget _buildTextCard() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: FigmaContainer(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: moreGlass ? 0.50 : 0.15),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.15,
                color: Colors.white.withValues(alpha: 0.30),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: [
              FigmaContainer(
                width: double.infinity,
                padding: appSizer.paddingAll(14),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    colors:
                        gradient ??
                        [AppColors.primary500, AppColors.tertiary500],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: isCenter ?? false
                            ? CrossAxisAlignment.center
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: isCenter ?? false
                                ? AppFonts.baseBold
                                : AppFonts.base2Bold,
                          ),
                          if (subtitle != null)
                            Text(subtitle!, style: AppFonts.base2Regular),
                        ],
                      ),
                    ),
                    if (headerRight != null) headerRight!,
                  ],
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconCard() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: FigmaContainer(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: moreGlass ? 0.30 : 0.15),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.15,
                color: Colors.white.withValues(alpha: 0.30),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: [
              FigmaContainer(
                width: double.infinity,
                padding: appSizer.paddingAll(14),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary500, AppColors.tertiary500],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                ),
                child: isCenter ?? false
                    ? Center(child: Text(title, style: AppFonts.baseBold))
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            spacing: 5.pxv,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title, style: AppFonts.lgBold),
                              Text(
                                subtitle ?? '',
                                style: AppFonts.base2Regular,
                              ),
                            ],
                          ),
                          HexagonWidget.assetIcon(
                            iconPath: IconPaths.increase,
                            size: 55.pxv,
                            iconColor: AppColors.baseWhite,
                            fillColor: AppColors.baseWhite.withValues(
                              alpha: 0.30,
                            ),
                            borderColor: AppColors.baseWhite.withValues(
                              alpha: 0.15,
                            ),
                          ),
                        ],
                      ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateTimeCard() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: FigmaContainer(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: moreGlass ? 0.50 : 0.15),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.15,
                color: Colors.white.withValues(alpha: 0.30),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: [
              FigmaContainer(
                width: double.infinity,
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary500, AppColors.tertiary500],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: appSizer.paddingAll(14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            spacing: 5.pxv,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(title, style: AppFonts.lgBold),
                              Text(
                                subtitle ?? '',
                                style: AppFonts.base2Regular,
                              ),
                            ],
                          ),
                          selectedPeriod ?? false
                              ? FigmaContainer(
                                  padding: appSizer.paddingSymmetric(
                                    horizontal: 12.pxh,
                                    vertical: 8.pxv,
                                  ),
                                  decoration: ShapeDecoration(
                                    color: AppColors.baseWhite.withValues(
                                      alpha: 0.30,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 1.15,
                                        color: AppColors.baseWhite.withValues(
                                          alpha: 0.30,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    shadows: const [
                                      BoxShadow(
                                        color: Color(0x4C146DA0),
                                        blurRadius: 8,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    time ?? '00:00',
                                    style: AppFonts.baseBold,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      ),
                    ),
                    5.spacerV,
                    FigmaContainer(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: AppColors.baseWhite.withValues(alpha: 0.30),
                            width: 2.15,
                          ),
                        ),
                      ),
                    ),
                    10.spacerV,
                    Padding(
                      padding: appSizer.paddingSymmetric(horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              productName ?? '',
                              style: AppFonts.baseBold,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                total ?? '',
                                style: AppFonts.baseBold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(
                              child: Text(
                                liter ?? '',
                                style: AppFonts.baseBold,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                price ?? '',
                                style: AppFonts.baseBold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    10.spacerV,
                  ],
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlateCard() {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: FigmaContainer(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Colors.white.withValues(alpha: moreGlass ? 0.50 : 0.15),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 1.15,
                color: Colors.white.withValues(alpha: 0.30),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            children: [
              FigmaContainer(
                width: double.infinity,
                padding: appSizer.paddingAll(14),
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.tertiary500, AppColors.primary500],
                  ),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppFonts.base2Bold.withColor(
                          AppColors.baseWhite,
                        ),
                      ),
                    ),
                    if (plate != null)
                      FigmaContainer(
                        padding: appSizer.paddingSymmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: ShapeDecoration(
                          color: AppColors.baseWhite.withValues(alpha: 0.30),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1,
                              color: AppColors.baseWhite.withValues(
                                alpha: 0.30,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          plate!,
                          style: AppFonts.baseBold.withColor(
                            AppColors.baseWhite,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
