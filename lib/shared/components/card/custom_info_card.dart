import 'dart:ui';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/constants/icon_paths.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/hexagon/animated_hexagon_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:digivizit/shared/components/hexagon/hexagon_widget.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:digivizit/shared/components/hexagon/water_wave_hexagon.dart';
import 'package:flutter/material.dart';

enum CustomInfoCardType {
  small,
  wide,
  full,
  product,
  mechanic,
  tank,
  tankDetail,
  unitPrice,
  info,
  statusInfo,
  checkboxInfo,
}

class CustomInfoCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? iconPath;
  final CustomInfoCardType type;
  final String? heading;
  final String? secondTitle;
  final String? secondSubtitle;
  final String? thirdTitle;
  final String? thirdSubtitle;
  final bool? isGlass;
  final String? tankNo;
  final String? status;
  final double? level;
  final Color? waterColor;
  final Function()? onTap;
  // Styling
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? hexagonFillColor;
  final Color? hexagonBorderColor;
  final Color? hexagonIconColor;
  final double? hexagonSize;
  final double? hexagonWidth;
  final double? hexagonHeight;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool? isActive;

  const CustomInfoCard._({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconPath,
    required this.type,
    this.heading,
    this.secondTitle,
    this.secondSubtitle,
    this.thirdTitle,
    this.thirdSubtitle,
    this.isGlass,
    this.tankNo,
    this.status,
    this.level,
    this.waterColor,
    this.onTap,
    this.backgroundColor,
    this.borderColor,
    this.hexagonFillColor,
    this.hexagonBorderColor,
    this.hexagonIconColor,
    this.hexagonSize,
    this.hexagonWidth,
    this.hexagonHeight,
    this.titleStyle,
    this.subtitleStyle,
    this.isActive = false,
  });

  factory CustomInfoCard.small({
    Key? key,
    required String title,
    required String subtitle,
    required String iconPath,
  }) {
    return CustomInfoCard._(
      key: key,
      title: title,
      subtitle: subtitle,
      iconPath: iconPath,
      type: CustomInfoCardType.small,
    );
  }

  factory CustomInfoCard.wide({
    Key? key,
    required String title,
    required String subtitle,
    required String secondTitle,
    required String secondSubtitle,
    required String iconPath,
  }) {
    return CustomInfoCard._(
      key: key,
      title: title,
      subtitle: subtitle,
      iconPath: iconPath,
      type: CustomInfoCardType.wide,
      secondTitle: secondTitle,
      secondSubtitle: secondSubtitle,
    );
  }

  factory CustomInfoCard.full({
    Key? key,
    required String title,
    required String subtitle,
    required String iconPath,
  }) {
    return CustomInfoCard._(
      key: key,
      title: title,
      subtitle: subtitle,
      iconPath: iconPath,
      type: CustomInfoCardType.full,
    );
  }

  factory CustomInfoCard.product({
    Key? key,
    required String title,
    required String subtitle,
    required String iconPath,
    required String secondTitle,
    required String secondSubtitle,
    required String thirdTitle,
    required String thirdSubtitle,
    required String heading,
    bool? isGlass,
    Color? hexagonIconColor,
  }) {
    return CustomInfoCard._(
      heading: heading,
      key: key,
      title: title,
      subtitle: subtitle,
      iconPath: iconPath,
      type: CustomInfoCardType.product,
      secondTitle: secondTitle,
      secondSubtitle: secondSubtitle,
      thirdTitle: thirdTitle,
      thirdSubtitle: thirdSubtitle,
      isGlass: isGlass,
      hexagonIconColor: hexagonIconColor,
    );
  }
  factory CustomInfoCard.tank({
    Key? key,
    required String title,
    required String subtitle,
    required String secondTitle,
    required String secondSubtitle,
    required String thirdTitle,
    required String thirdSubtitle,
    required String heading,
    required String tankNo,
    required String status,
    required double level,
    required Color waterColor,
    Function()? onTap,
  }) {
    return CustomInfoCard._(
      heading: heading,
      key: key,
      title: title,
      subtitle: subtitle,
      type: CustomInfoCardType.tank,
      secondTitle: secondTitle,
      secondSubtitle: secondSubtitle,
      thirdTitle: thirdTitle,
      thirdSubtitle: thirdSubtitle,
      tankNo: tankNo,
      status: status,
      level: level,
      waterColor: waterColor,
      onTap: onTap,
    );
  }

  factory CustomInfoCard.mechanic({
    Key? key,
    required String title,
    required String subtitle,
    required String iconPath,
    required String heading,
  }) {
    return CustomInfoCard._(
      heading: heading,
      key: key,
      title: title,
      subtitle: subtitle,
      iconPath: iconPath,
      type: CustomInfoCardType.mechanic,
    );
  }

  factory CustomInfoCard.tankDetail({
    Key? key,
    required String title,
    required String subtitle,
    required String iconPath,
    required String secondTitle,
    required String secondSubtitle,
    required String thirdTitle,
    required String thirdSubtitle,
    bool? isGlass,
  }) {
    return CustomInfoCard._(
      key: key,
      title: title,
      subtitle: subtitle,
      iconPath: iconPath,
      type: CustomInfoCardType.tankDetail,
      secondTitle: secondTitle,
      secondSubtitle: secondSubtitle,
      thirdTitle: thirdTitle,
      thirdSubtitle: thirdSubtitle,
      isGlass: isGlass,
    );
  }

  factory CustomInfoCard.unitPrice({
    Key? key,
    required String title,
    required String subtitle,
    required String iconPath,
    bool? isGlass,
    required String heading,
  }) {
    return CustomInfoCard._(
      key: key,
      title: title,
      subtitle: subtitle,
      iconPath: iconPath,
      type: CustomInfoCardType.unitPrice,
      isGlass: isGlass,
      heading: heading,
    );
  }
  factory CustomInfoCard.info({
    Key? key,
    required String title,
    required String subtitle,
    required String iconPath,
    Color? backgroundColor,
    Color? borderColor,
    Color? hexagonFillColor,
    Color? hexagonBorderColor,
    Color? hexagonIconColor,
    double? hexagonSize,
    double? hexagonWidth,
    double? hexagonHeight,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
  }) {
    return CustomInfoCard._(
      key: key,
      title: title,
      subtitle: subtitle,
      iconPath: iconPath,
      type: CustomInfoCardType.info,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      hexagonFillColor: hexagonFillColor,
      hexagonBorderColor: hexagonBorderColor,
      hexagonIconColor: hexagonIconColor,
      hexagonSize: hexagonSize,
      hexagonWidth: hexagonWidth,
      hexagonHeight: hexagonHeight,
      titleStyle: titleStyle,
      subtitleStyle: subtitleStyle,
    );
  }

  factory CustomInfoCard.statusInfo({
    Key? key,
    required String title,
    String? iconPath,
    String? status,
    bool? isActive,
  }) {
    return CustomInfoCard._(
      key: key,
      title: title,
      subtitle: '',
      iconPath: iconPath,
      status: status,
      isActive: isActive,
      type: CustomInfoCardType.statusInfo,
    );
  }

  /// Checkbox'lı yetki kartı - hexagon checkbox ile
  factory CustomInfoCard.checkboxInfo({
    Key? key,
    required String title,
    required bool isChecked,
    required VoidCallback onChanged,
  }) {
    return CustomInfoCard._(
      key: key,
      title: title,
      subtitle: '',
      isActive: isChecked,
      onTap: onChanged,
      type: CustomInfoCardType.checkboxInfo,
    );
  }

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      CustomInfoCardType.small => _buildSmallCard(),
      CustomInfoCardType.wide => _buildWideCard(),
      CustomInfoCardType.full => _buildFullCard(),
      CustomInfoCardType.product => _buildProductCard(isGlass),
      CustomInfoCardType.mechanic => _buildMechanicCard(),
      CustomInfoCardType.tank => _buildTankCard(),
      CustomInfoCardType.tankDetail => _buildTankDetailCard(),
      CustomInfoCardType.unitPrice => _buildUnitPriceCard(),
      CustomInfoCardType.info => _buildInfoCard(),
      CustomInfoCardType.statusInfo => _buildStatusInfoCard(),
      CustomInfoCardType.checkboxInfo => _buildCheckboxInfoCard(),
    };
  }

  // ------------------ Small Card ------------------ //

  Widget _buildSmallCard() {
    return Expanded(
      child: _buildCardContainer(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHexagonIcon(),
            FigmaBox(width: 5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_buildTitle(title), _buildSubtitle(subtitle)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ Wide Card ------------------ //

  Widget _buildWideCard() {
    return _buildCardContainer(
      child: Row(
        children: [
          _buildHexagonIcon(),
          FigmaBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_buildTitle(title), _buildSubtitle(subtitle)],
                ),
                FigmaBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildTitle(secondTitle ?? ''),
                    _buildSubtitle(secondSubtitle ?? ''),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ Full Card ------------------ //

  Widget _buildFullCard() {
    return _buildCardContainer(
      child: Row(
        children: [
          _buildHexagonIcon(),
          FigmaBox(width: 12),
          _buildTitle(title),
          const Spacer(),
          _buildSubtitle(subtitle, isLarge: true),
        ],
      ),
    );
  }

  // ------------------ Product Card ------------------ //

  Widget _buildProductCard(bool? isGlass) {
    return _buildCardContainer(
      isGlass: isGlass,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Hexagon Icon
          _buildHexagonIcon(size: 50, hexagonIconColor: hexagonIconColor),
          const FigmaBox(width: 14),
          // Content Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Heading
                Text(
                  heading ?? '',
                  style: AppFonts.lg2Bold.copyWith(
                    color: Colors.white,
                    letterSpacing: -0.3,
                  ),
                ),
                // Row 1: title - subtitle
                _buildProductRow(title, subtitle),
                _buildDivider(),
                // Row 2: secondTitle - secondSubtitle
                _buildProductRow(secondTitle ?? '', secondSubtitle ?? ''),
                _buildDivider(),
                // Row 3: thirdTitle - thirdSubtitle
                _buildProductRow(thirdTitle ?? '', thirdSubtitle ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppFonts.smSemibold.copyWith(
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          Text(
            value,
            style: AppFonts.lg2Semibold.copyWith(
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color(0x4CBABABA), width: 1),
        ),
      ),
    );
  }

  // ------------------ Mechanic Card ------------------ //

  Widget _buildMechanicCard() {
    return _buildCardContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon
          _buildHexagonIcon(),
          const FigmaBox(width: 14),
          // Content Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Heading
                Text(
                  heading ?? '',
                  style: AppFonts.lg2Bold.copyWith(
                    color: Colors.white,
                    letterSpacing: -0.3,
                  ),
                ),
                // Row 1: title - subtitle
                _buildProductRow(title, subtitle),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ Tank Card ------------------ //

  Widget _buildTankCard() {
    return _buildCardContainer(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Hexagon Icon
          Column(
            spacing: 5,
            children: [
              Text('Tank No: $tankNo', style: AppFonts.baseSemibold),
              _buildAnimatedHexagonIcon(
                size: 65,
                level: level!,
                waterColor: waterColor ?? Colors.blue,
              ),
              Text(status ?? '', style: AppFonts.baseBold),
            ],
          ),
          const FigmaBox(width: 14),
          // Content Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Heading
                Text(
                  heading ?? '',
                  style: AppFonts.lg2Bold.copyWith(
                    color: Colors.white,
                    letterSpacing: -0.3,
                  ),
                ),
                // Row 1: title - subtitle
                _buildProductRow(title, subtitle),
                _buildDivider(),
                // Row 2: secondTitle - secondSubtitle
                _buildProductRow(secondTitle ?? '', secondSubtitle ?? ''),
                _buildDivider(),
                // Row 3: thirdTitle - thirdSubtitle
                _buildProductRow(thirdTitle ?? '', thirdSubtitle ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ Tank Detail Card ------------------ //

  Widget _buildTankDetailCard() {
    return _buildCardContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Hexagon Icon
          _buildHexagonIcon(size: 50),
          const FigmaBox(width: 14),
          // Content Column
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Row 1: title - subtitle
                _buildProductRow(title, subtitle),
                _buildDivider(),
                // Row 2: secondTitle - secondSubtitle
                _buildProductRow(secondTitle ?? '', secondSubtitle ?? ''),
                _buildDivider(),
                // Row 3: thirdTitle - thirdSubtitle
                _buildProductRow(thirdTitle ?? '', thirdSubtitle ?? ''),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUnitPriceCard() {
    return _buildCardContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Hexagon Icon
          _buildHexagonIcon(size: 50, width: 35, height: 35),
          const FigmaBox(width: 14),
          // Content Column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    heading ?? '',
                    style: AppFonts.lg2Bold.copyWith(letterSpacing: -0.3),
                  ),
                  _buildProductRow(title, subtitle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ Info Card ------------------ //

  Widget _buildInfoCard() {
    return _buildCardContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Hexagon Icon
          _buildHexagonIcon(),
          const FigmaBox(width: 10),
          // Content Column
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildTitle(title, style: titleStyle),
                  _buildSubtitle(subtitle, style: subtitleStyle),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ------------------ Status Info Card ------------------ //

  Widget _buildStatusInfoCard() {
    return _buildCardContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (iconPath != null) _buildHexagonIcon(),
              const FigmaBox(width: 10),
              Text(
                title,
                style: AppFonts.baseBold.copyWith(color: Colors.white),
              ),
            ],
          ),
          if (isActive != null) ...[
            FigmaContainer(
              padding: appSizer.paddingSymmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: isActive!
                    ? AppColors.positive700
                    : AppColors.negative700,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  color: AppColors.baseWhite.withValues(alpha: 0.30),
                ),
              ),
              child: Text(
                status ?? (isActive! ? 'Aktif' : 'Pasif'),
                style: AppFonts.smSemibold.copyWith(color: AppColors.baseWhite),
              ),
            ),
          ],
        ],
      ),
    );
  }

  // ------------------ Checkbox Info Card ------------------ //

  Widget _buildCheckboxInfoCard() {
    final isChecked = isActive ?? false;

    return GestureDetector(
      onTap: onTap,
      child: FigmaContainer(
        padding: appSizer.paddingSymmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
        ),
        child: Row(
          children: [
            // Yetki ismi
            Expanded(
              child: Text(
                title,
                style: AppFonts.baseBold.copyWith(color: AppColors.primary500),
              ),
            ),
            // Hexagon Checkbox
            AnimatedHexagonCheckbox(
              size: 28,
              isChecked: isChecked,
              onChanged: onTap,
              checkedColor: AppColors.primary500,
              uncheckedColor: Colors.white.withValues(alpha: 0.1),
              borderColor: isChecked
                  ? AppColors.primary500
                  : Colors.white.withValues(alpha: 0.3),
              checkColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  // ------------------ Common Widgets ------------------ //

  Widget _buildCardContainer({
    required Widget child,
    bool? isGlass,
    Function()? onTap,
  }) {
    return isGlass ?? false
        ? ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: FigmaContainer(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: borderColor ?? Colors.white.withValues(alpha: 0.30),
                    width: 1.15,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  color:
                      backgroundColor ??
                      AppColors.positive600.withValues(alpha: 0.75),
                ),
                child: Center(
                  child: Padding(
                    padding: appSizer.paddingSymmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: child,
                  ),
                ),
              ),
            ),
          )
        : GestureDetector(
            onTap: onTap,
            child: FigmaContainer(
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor ?? Colors.white.withValues(alpha: 0.30),
                  width: 1.15,
                ),
                borderRadius: BorderRadius.circular(16),
                color: backgroundColor,
                gradient: backgroundColor == null
                    ? LinearGradient(
                        colors: [AppColors.tertiary500, AppColors.primary500],
                      )
                    : null,
              ),
              child: Center(
                child: Padding(
                  padding: appSizer.paddingSymmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: child,
                ),
              ),
            ),
          );
  }

  Widget _buildHexagonIcon({
    double? size,
    double? width,
    double? height,
    String? iconPath,
    Color? hexagonIconColor,
  }) {
    return HexagonWidget.custom(
      size: size ?? hexagonSize ?? 45,
      fillColor: hexagonFillColor ?? Colors.white.withValues(alpha: 0.15),
      borderColor: hexagonBorderColor ?? Colors.white.withValues(alpha: 0.30),
      borderWidth: 1.15,
      child: Image.asset(
        iconPath ?? this.iconPath ?? IconPaths.capasite,
        width: width ?? hexagonWidth ?? 25,
        height: height ?? hexagonHeight ?? 25,
        color: hexagonIconColor ?? AppColors.baseWhite,
      ),
    );
  }

  Widget _buildAnimatedHexagonIcon({
    double? size,
    required double level,
    required Color waterColor,
  }) {
    return WaterWaveHexagon(
      size: size ?? 65,
      level: level,
      text: '%${(level * 100).toStringAsFixed(1)}',
      waterColor: waterColor,
    );
  }

  Widget _buildTitle(String text, {TextStyle? style}) {
    return Text(text, style: style ?? AppFonts.baseSemibold);
  }

  Widget _buildSubtitle(String text, {bool isLarge = false, TextStyle? style}) {
    return Text(
      text,
      style:
          style ??
          (isLarge
              ? AppFonts.lg2Bold.copyWith(color: Colors.white)
              : AppFonts.base2Bold.copyWith(color: Colors.white)),
      textAlign: TextAlign.left,
    );
  }
}
