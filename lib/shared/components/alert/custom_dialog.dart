import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

enum CustomDialogStatus { info, success, warning, error, destructive }

class CustomDialog extends StatelessWidget {
  final String text;
  final String description;
  final String confirmText;
  final String cancelText;
  final IconData? icon;
  final CustomDialogStatus status;
  final bool showCancelButton;
  final VoidCallback? onPressedConfirm;
  final VoidCallback? onPressedCancel;

  const CustomDialog({
    super.key,
    required this.text,
    required this.description,
    this.confirmText = 'Onayla',
    this.cancelText = 'İptal',
    this.icon,
    this.status = CustomDialogStatus.destructive,
    this.showCancelButton = true,
    this.onPressedConfirm,
    this.onPressedCancel,
  });

  Color get _accentColor => switch (status) {
    CustomDialogStatus.info => AppColors.primary600,
    CustomDialogStatus.success => AppColors.positive600,
    CustomDialogStatus.warning => AppColors.warning600,
    CustomDialogStatus.error ||
    CustomDialogStatus.destructive => AppColors.negative500,
  };

  IconData get _statusIcon =>
      icon ??
      switch (status) {
        CustomDialogStatus.info => Icons.info_outline_rounded,
        CustomDialogStatus.success => Icons.check_circle_outline_rounded,
        CustomDialogStatus.warning => Icons.warning_amber_rounded,
        CustomDialogStatus.error => Icons.error_outline_rounded,
        CustomDialogStatus.destructive => Icons.delete_outline_rounded,
      };

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      backgroundColor: Colors.transparent,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 440),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.baseWhite,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppColors.hairline),
            boxShadow: [
              BoxShadow(
                color: AppColors.ink.withValues(alpha: 0.12),
                blurRadius: 36,
                offset: const Offset(0, 18),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: _accentColor.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Icon(_statusIcon, size: 26, color: _accentColor),
              ),
              const SizedBox(height: 18),
              Text(text, style: AppFonts.lg2Bold.withColor(AppColors.ink)),
              const SizedBox(height: 8),
              Text(
                description,
                style: AppFonts.baseRegular
                    .withColor(AppColors.inkSoft)
                    .withHeight(1.5),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  if (showCancelButton) ...[
                    Expanded(
                      child: _DialogButton(
                        text: cancelText,
                        foregroundColor: AppColors.ink,
                        backgroundColor: AppColors.surfaceAlt,
                        onTap:
                            onPressedCancel ??
                            () => Navigator.of(context).pop(false),
                      ),
                    ),
                    const SizedBox(width: 12),
                  ],
                  Expanded(
                    child: _DialogButton(
                      text: confirmText,
                      foregroundColor: AppColors.baseWhite,
                      backgroundColor: _accentColor,
                      onTap:
                          onPressedConfirm ??
                          () => Navigator.of(context).pop(true),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierColor: AppColors.ink.withValues(alpha: 0.35),
      builder: (_) => this,
    );
  }
}

class _DialogButton extends StatelessWidget {
  final String text;
  final Color foregroundColor;
  final Color backgroundColor;
  final VoidCallback onTap;

  const _DialogButton({
    required this.text,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: FilledButton(
        onPressed: onTap,
        style: FilledButton.styleFrom(
          elevation: 0,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(text, style: AppFonts.baseBold.withColor(foregroundColor)),
      ),
    );
  }
}

Future<bool?> showCustomDialog({
  required BuildContext context,
  required String title,
  required String message,
  CustomDialogStatus status = CustomDialogStatus.info,
  IconData? icon,
  String confirmText = 'Tamam',
  String? cancelText,
}) {
  return CustomDialog(
    text: title,
    description: message,
    status: status,
    icon: icon,
    confirmText: confirmText,
    cancelText: cancelText ?? 'Vazgeç',
    showCancelButton: cancelText != null,
  ).show(context);
}
