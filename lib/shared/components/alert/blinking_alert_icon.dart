import 'package:flutter/material.dart';
import 'package:digivizit/core/extensions/integer.dart';

class BlinkingAlertIcon extends StatefulWidget {
  final String iconPath;
  final double? size;
  final Color? color;

  const BlinkingAlertIcon({
    super.key,
    required this.iconPath,
    this.size,
    this.color,
  });

  @override
  State<BlinkingAlertIcon> createState() => _BlinkingAlertIconState();
}

class _BlinkingAlertIconState extends State<BlinkingAlertIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 1.0,
      end: 0.2,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.asset(
        widget.iconPath,
        width: widget.size ?? 24.pxh,
        height: widget.size ?? 24.pxv,
        color: widget.color,
      ),
    );
  }
}
