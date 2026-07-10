import 'package:flutter/material.dart';
import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/global_initializer.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:digivizit/shared/components/containers/figma_box.dart';
import 'package:digivizit/shared/components/containers/figma_container.dart';

enum SnackbarStatusEnum { success, error, warning }

class CustomSnackbar extends StatefulWidget {
  final String message;
  final SnackbarStatusEnum status;
  final Duration duration;
  final bool isTopPosition;
  final VoidCallback onDismissed;

  const CustomSnackbar({
    super.key,
    required this.message,
    required this.status,
    required this.onDismissed,
    this.duration = const Duration(seconds: 3),
    this.isTopPosition = false,
  });

  @override
  State<CustomSnackbar> createState() => _CustomSnackbarState();
}

class _CustomSnackbarState extends State<CustomSnackbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _slideAnimation = Tween<Offset>(
      begin: widget.isTopPosition ? const Offset(0, -1) : const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    // Start the fade-in and slide-in animation
    _controller.forward();

    // Dismiss after duration ends if still mounted
    Future.delayed(widget.duration, () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) widget.onDismissed();
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getAccentColor() {
    switch (widget.status) {
      case SnackbarStatusEnum.success:
        return const Color(0xFF16A34A);
      case SnackbarStatusEnum.error:
        return const Color(0xFFDC2626);
      case SnackbarStatusEnum.warning:
        return const Color(0xFFD97706);
    }
  }

  IconData _getIcon() {
    switch (widget.status) {
      case SnackbarStatusEnum.success:
        return Icons.check_circle_outline;
      case SnackbarStatusEnum.error:
        return Icons.cancel_outlined;
      case SnackbarStatusEnum.warning:
        return Icons.warning_amber_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.horizontal,
          onDismissed: (direction) {
            widget.onDismissed();
          },
          child: Material(
            color: Colors.transparent,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.0),
              child: FigmaContainer(
                margin: appSizer.paddingSymmetric(horizontal: 16.0),
                padding: appSizer.paddingAll(14.0),
                decoration: BoxDecoration(
                  color: AppColors.baseWhite,
                  borderRadius: BorderRadius.circular(18.0),
                  border: Border.all(color: AppColors.hairline),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.ink.withValues(alpha: 0.12),
                      blurRadius: 24.0,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FigmaContainer(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: _getAccentColor().withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        _getIcon(),
                        color: _getAccentColor(),
                        size: 22,
                      ),
                    ),
                    FigmaBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.message,
                        style: appSizer.style(
                          color: AppColors.ink,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildBubbleBackground() {
    return CustomPaint(painter: BubblePainter());
  }
}

class BubblePainter extends CustomPainter {
  //BubblePainter();

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColors.baseWhite.withValues(alpha: 0.5);
    // Drawing fluid bubble shapes
    canvas.drawCircle(Offset(size.width * 0.25, size.height * 0.5), 20, paint);
    canvas.drawCircle(Offset(size.width * 0.75, size.height * 0.3), 30, paint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.7), 40, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// Global variable to manage the current snackbar state
OverlayEntry? _currentSnackbar;

void showCustomSnackbarOverlay({
  required String message,
  SnackbarStatusEnum status = SnackbarStatusEnum.warning,
  Duration duration = const Duration(seconds: 3),
  bool topPosition = true,
  // required BuildContext context, // root context, not from bottom sheet
}) {
  // Remove the current snackbar if it exists
  if (_currentSnackbar != null) {
    _currentSnackbar!.remove();
    _currentSnackbar = null;
  }

  // Use the root overlay context
  OverlayState? overlayState = Navigator.of(
    AppSettings.instance.context!,
    rootNavigator: true,
  ).overlay;

  // Create a new overlay entry for the snackbar
  late OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: topPosition ? 16.0 : null,
      bottom: !topPosition ? 16.0 : null,
      left: 0,
      right: 0,
      child: SafeArea(
        child: CustomSnackbar(
          message: message,
          status: status,
          duration: duration,
          isTopPosition: topPosition,
          onDismissed: () {
            overlayEntry.remove();
            _currentSnackbar = null;
          },
        ),
      ),
    ),
  );

  // Insert the snackbar overlay entry
  overlayState?.insert(overlayEntry);
  _currentSnackbar = overlayEntry;

  // Note: Automatic removal is handled by the CustomSnackbar widget's internal animation
  // through the onDismissed callback after the animation completes
}
