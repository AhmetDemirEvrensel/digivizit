import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/icon_paths.dart';
import 'package:digivizit/core/constants/image_paths.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:digivizit/shared/components/hexagon/hexagon_widget.dart';

class CustomButtonWithIcon extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isPro;
  final Color backgroundColor;
  const CustomButtonWithIcon({
    super.key,
    this.onPressed,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.isPro = true,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentGeometry.topRight,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size.fromHeight(80.pxv),
            backgroundColor: isPro ? backgroundColor : AppColors.greyText.withValues(alpha: 0.70),
            padding: EdgeInsets.only(left: 10, right: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16),
              side: BorderSide(color: AppColors.borderColor, width: 1.15),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            spacing: 10,
            children: [
              HexagonWidget.icon(icon: icon, size: 50, fillColor: AppColors.buttonBgColor, borderColor: AppColors.borderColor, iconColor: AppColors.baseWhite),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppFonts.lg2Bold),
                  Text(subtitle, style: AppFonts.base2Regular),
                ],
              ),
              Spacer(),
              FigmaContainer(
                width: 34.pxh,
                height: 34.pxh,
                padding: EdgeInsets.all(8.pxh),
                decoration: ShapeDecoration(
                  color: Colors.white.withValues(alpha: 0.20),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.15, color: Colors.white.withValues(alpha: 0.30)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Image.asset(IconPaths.arrowIcon),
              ),
            ],
          ),
        ),
        Positioned(top: -6.pxv, right: -6.pxh, child: Image.asset(ImagePaths.pro, width: 70)),
      ],
    );
  }
}
