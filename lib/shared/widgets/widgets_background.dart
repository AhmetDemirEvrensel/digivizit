import 'dart:io';

import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';
import 'package:digivizit/shared/components/hexagon/hexagon_widget.dart';
import 'package:flutter/material.dart';

class WidgetsBackground extends StatelessWidget {
  const WidgetsBackground({
    super.key,
    this.height,
    this.icon,
    this.title,
    this.subtitle,
    required this.children,
    this.iconSize,
    this.isShortcut,
    this.model,
    this.onTap,
    this.bottomPadding,
    this.hasButtons = false,
    this.moreGlass,
  });

  final double? height;
  final String? icon;
  final String? title;
  final String? subtitle;
  final Widget children;
  final double? iconSize;
  final dynamic model;
  final bool? isShortcut;
  final VoidCallback? onTap;
  final double? bottomPadding;
  final bool hasButtons;
  final bool? moreGlass;

  @override
  Widget build(BuildContext context) {
    return FigmaContainer(
      padding: appSizer.paddingOnly(bottom: 5),
      height: height,
      constraints: height == null
          ? BoxConstraints(
              maxHeight: hasButtons
                  ? MediaQuery.of(context).size.height -
                        (bottomPadding ?? (Platform.isIOS ? 280 : 400))
                            .toInt()
                            .pxv
                  : MediaQuery.of(context).size.height / 1.2,
            )
          : BoxConstraints.tightFor(height: height),
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white.withValues(alpha: moreGlass ?? false ? 0.30 : 0.15),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.15,
            color: Colors.white.withValues(
              alpha: moreGlass ?? false ? 0.30 : 0.15,
            ),
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F253D84),
            blurRadius: 60,
            offset: Offset(0, 20),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: appSizer.paddingAll(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (icon != null) ...[
                      HexagonWidget.assetIcon(
                        iconSize: iconSize,
                        iconPath: icon!,
                        size: 54,
                        fillColor: AppColors.secondary500,
                        borderColor: AppColors.baseWhite.withValues(
                          alpha: 0.15,
                        ),
                        iconColor: Colors.white,
                        cornerRadius: 4,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.baseBlack.withValues(alpha: 0.15),
                            blurRadius: 16,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      FigmaBox(width: 12),
                    ],
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (title != null) ...[
                            Text(title!, style: AppFonts.xlBold),
                            FigmaBox(height: 2),
                          ],
                          if (subtitle != null) ...[
                            Text(subtitle!, style: AppFonts.base2Regular),
                            FigmaBox(height: 2),
                          ],
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
                isShortcut ?? false ? FigmaBox(height: 10) : SizedBox.shrink(),
                isShortcut ?? false
                    ? Text(
                        'Kisayol bilgisini goster : ${model!.animasyonCheck ? 'Açık' : 'Kapalı'}',
                        style: AppFonts.base2Semibold,
                      )
                    : SizedBox.shrink(),
                isShortcut ?? false ? FigmaBox(height: 10) : SizedBox.shrink(),
                isShortcut ?? false
                    ? Divider(color: AppColors.primary500)
                    : SizedBox.shrink(),
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              padding: appSizer.paddingSymmetric(horizontal: 12.0),
              child: _buildChildren(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChildren() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [children],
    );
  }
}
