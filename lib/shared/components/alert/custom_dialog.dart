import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/extensions/integer.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';

class CustomDialog extends StatelessWidget {
  final String text;
  final String description;
  final String confirmText;
  final String cancelText;
  final IconData icon;
  final VoidCallback? onPressedConfirm;
  final VoidCallback? onPressedCancel;
  const CustomDialog({
    super.key,
    required this.text,
    required this.description,
    this.confirmText = 'Onayla',
    this.cancelText = 'İptal',
    this.icon = Icons.lock_outline,
    this.onPressedConfirm,
    this.onPressedCancel,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: FigmaContainer(
        padding: appSizer.paddingAll(24),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF1E2736) : Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [BoxShadow(color: isDarkMode ? const Color(0x66000000) : const Color(0x4C000000), blurRadius: 60, offset: const Offset(0, 20))],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon with gradient background
            FigmaContainer(
              width: 64.pxh,
              height: 64.pxv,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDarkMode ? [const Color(0xFF3D2020), const Color(0xFF4D2525)] : [const Color(0xFFFEE2E2), const Color(0xFFFECACA)],
                ),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 32, color: const Color(0xFFEF4444)),
            ),
            FigmaBox(height: 16),
            // Title
            Text(
              text,
              textAlign: TextAlign.center,
              style: appSizer.style(
                color: isDarkMode ? Colors.white : const Color(0xFF1F2937),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.44,
              ),
            ),
            FigmaBox(height: 8),
            // Description
            Text(
              description,
              textAlign: TextAlign.center,
              style: appSizer.style(
                color: isDarkMode ? const Color(0xFFB0B8C4) : const Color(0xFF6B7280),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.15,
              ),
            ),
            FigmaBox(height: 24),
            // Confirm Button
            FigmaContainer(
              width: double.infinity,
              height: 52,
              decoration: BoxDecoration(
                gradient: const LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: [Color(0xFFEF4444), Color(0xFFDC2626)]),
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: const Color(0x3FEF4444), blurRadius: 12, offset: const Offset(0, 4))],
              ),
              child: ElevatedButton(
                onPressed: onPressedConfirm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  confirmText,
                  style: appSizer.style(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: -0.15),
                ),
              ),
            ),
            FigmaBox(height: 10),
            FigmaContainer(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: onPressedCancel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isDarkMode ? const Color(0xFF2D3748) : const Color(0xFFF3F4F6),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                child: Text(
                  cancelText,
                  style: appSizer.style(
                    color: isDarkMode ? Colors.white : const Color(0xFF354152),
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> show(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) => CustomDialog(
        text: text,
        description: description,
        confirmText: confirmText,
        cancelText: cancelText,
        icon: icon,
        onPressedConfirm: onPressedConfirm,
        onPressedCancel: onPressedCancel,
      ),
    );
  }
}
