import 'package:digivizit/core/constants/app_colors.dart';
import 'package:digivizit/core/constants/app_fonts.dart';
import 'package:digivizit/core/providers/app_settings.dart';
import 'package:flutter/material.dart';

enum SnackbarStatusEnum { info, success, error, warning }

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
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;
  late final Animation<Offset> _slideAnimation;
  bool _isDismissing = false;

  Color get _accentColor => switch (widget.status) {
    SnackbarStatusEnum.info => AppColors.primary600,
    SnackbarStatusEnum.success => AppColors.positive600,
    SnackbarStatusEnum.error => AppColors.negative500,
    SnackbarStatusEnum.warning => AppColors.warning600,
  };

  IconData get _icon => switch (widget.status) {
    SnackbarStatusEnum.info => Icons.info_outline_rounded,
    SnackbarStatusEnum.success => Icons.check_circle_outline_rounded,
    SnackbarStatusEnum.error => Icons.error_outline_rounded,
    SnackbarStatusEnum.warning => Icons.warning_amber_rounded,
  };

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
      reverseDuration: const Duration(milliseconds: 200),
    );
    _opacityAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: widget.isTopPosition
          ? const Offset(0, -0.25)
          : const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
    Future<void>.delayed(widget.duration, _dismiss);
  }

  Future<void> _dismiss() async {
    if (!mounted || _isDismissing) return;
    _isDismissing = true;
    await _controller.reverse();
    if (mounted) widget.onDismissed();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Dismissible(
          key: const ValueKey('app-snackbar'),
          direction: DismissDirection.horizontal,
          onDismissed: (_) {
            if (_isDismissing) return;
            _isDismissing = true;
            widget.onDismissed();
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.fromLTRB(14, 12, 10, 12),
              decoration: BoxDecoration(
                color: AppColors.baseWhite,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.hairline),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.ink.withValues(alpha: 0.12),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _accentColor.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Icon(_icon, color: _accentColor, size: 22),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.message,
                      style: AppFonts.baseSemibold.withColor(AppColors.ink),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Kapat',
                    onPressed: _dismiss,
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: AppColors.inkFaint,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

OverlayEntry? _currentSnackbar;

void showCustomSnackbarOverlay({
  required String message,
  SnackbarStatusEnum status = SnackbarStatusEnum.info,
  Duration duration = const Duration(seconds: 3),
  bool topPosition = true,
}) {
  _currentSnackbar?.remove();
  _currentSnackbar = null;

  final overlayState = Navigator.of(
    AppSettings.instance.context!,
    rootNavigator: true,
  ).overlay;
  if (overlayState == null) return;

  late final OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (_) => Positioned(
      top: topPosition ? 16 : null,
      bottom: topPosition ? null : 16,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: CustomSnackbar(
              message: message,
              status: status,
              duration: duration,
              isTopPosition: topPosition,
              onDismissed: () {
                if (overlayEntry.mounted) overlayEntry.remove();
                if (identical(_currentSnackbar, overlayEntry)) {
                  _currentSnackbar = null;
                }
              },
            ),
          ),
        ),
      ),
    ),
  );
  overlayState.insert(overlayEntry);
  _currentSnackbar = overlayEntry;
}
