import 'dart:math' as math;

import 'package:flutter/material.dart';

class HexagonLoaderScreen extends StatefulWidget {
  final double size;
  final Duration swapDuration;

  const HexagonLoaderScreen({super.key, this.size = 220, this.swapDuration = const Duration(milliseconds: 700)});

  @override
  State<HexagonLoaderScreen> createState() => _HexagonLoaderScreenState();
}

class _HexagonLoaderScreenState extends State<HexagonLoaderScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // Hexagon renkleri (resimden alınan)
  final List<Color> _baseColors = const [
    Color(0xFF2B7BF7), // Açık Mavi
    Color(0xFF1A3A6E), // Koyu Mavi
    Color(0xFFE53935), // Kırmızı
    Color(0xFF5C6B7A), // Gri
  ];

  // Mevcut renk sırası (swap işlemlerinde değişecek)
  late List<int> _colorIndices;

  // Hangi çiftin swap edildiği (0: 1-2, 1: 2-3, 2: 3-4)
  int _currentSwapPair = 0;

  @override
  void initState() {
    super.initState();
    _colorIndices = [0, 1, 2, 3];
    _controller = AnimationController(vsync: this, duration: widget.swapDuration)
      ..addStatusListener(_onAnimationStatus)
      ..forward();
  }

  void _onAnimationStatus(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      // Swap işlemini tamamla
      final i = _currentSwapPair;
      final temp = _colorIndices[i];
      _colorIndices[i] = _colorIndices[i + 1];
      _colorIndices[i + 1] = temp;

      // Sonraki çifte geç
      _currentSwapPair = (_currentSwapPair + 1) % 3;

      // Animasyonu sıfırla ve tekrar başlat
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.removeStatusListener(_onAnimationStatus);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hexSize = widget.size / 5;

    return SizedBox(
      width: widget.size,
      height: hexSize * 2.5,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          return CustomPaint(
            painter: _HexagonSwapPainter(
              progress: _easeInOutCubic(_controller.value),
              colors: _baseColors,
              colorIndices: _colorIndices,
              swapPair: _currentSwapPair,
              hexSize: hexSize,
            ),
          );
        },
      ),
    );
  }

  double _easeInOutCubic(double t) {
    return t < 0.5 ? 4 * t * t * t : 1 - math.pow(-2 * t + 2, 3) / 2;
  }
}

class _HexagonSwapPainter extends CustomPainter {
  final double progress;
  final List<Color> colors;
  final List<int> colorIndices;
  final int swapPair;
  final double hexSize;

  _HexagonSwapPainter({required this.progress, required this.colors, required this.colorIndices, required this.swapPair, required this.hexSize});

  @override
  void paint(Canvas canvas, Size size) {
    final centerY = size.height / 2;
    final spacing = hexSize * 1.1;
    final totalWidth = spacing * 3 + hexSize; // 4 hexagon için toplam genişlik
    final startX = (size.width - totalWidth) / 2 + hexSize / 2;

    // Her hexagon'ın temel pozisyonları
    final basePositions = List.generate(4, (i) => Offset(startX + i * spacing, centerY));

    // Hexagonları çiz
    for (int i = 0; i < 4; i++) {
      Offset position;

      // Bu hexagon swap edilen çiftin parçası mı?
      if (i == swapPair || i == swapPair + 1) {
        // Dairesel hareket ile swap
        position = _getCircularSwapPosition(
          basePositions[swapPair],
          basePositions[swapPair + 1],
          i == swapPair, // İlk eleman mı?
          progress,
        );
      } else {
        position = basePositions[i];
      }

      final colorIndex = colorIndices[i];

      // Glow efekti
      _drawGlow(canvas, position, hexSize * 0.45, colors[colorIndex]);

      // Ana hexagon
      _drawHexagon(canvas, position, hexSize * 0.42, colors[colorIndex]);
    }

    // Bağlantı çizgileri
    _drawConnectors(canvas, basePositions);
  }

  Offset _getCircularSwapPosition(Offset pos1, Offset pos2, bool isFirst, double t) {
    // İki pozisyon arasındaki merkez
    final centerX = (pos1.dx + pos2.dx) / 2;
    final centerY = pos1.dy;

    // Yarıçap (iki hexagon arası mesafenin yarısı)
    final radius = (pos2.dx - pos1.dx) / 2;

    // Açı hesaplama - dairesel hareket
    double angle;
    double yOffset;

    if (isFirst) {
      // İlk eleman: π'dan 0'a (soldan sağa, YUKARIDAN geçerek)
      angle = math.pi * (1 - t);
      yOffset = -radius * math.sin(angle); // Yukarı doğru ark
    } else {
      // İkinci eleman: 0'dan -π'a (sağdan sola, AŞAĞIDAN geçerek)
      angle = -math.pi * t;
      yOffset = -radius * math.sin(angle); // Aşağı doğru ark
    }

    // Yeni pozisyon
    final x = centerX + radius * math.cos(angle);
    final y = centerY + yOffset;

    return Offset(x, y);
  }

  void _drawHexagon(Canvas canvas, Offset center, double radius, Color color) {
    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60 - 90) * math.pi / 180;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();

    // Gradient fill
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [color, color.withValues(alpha: 0.7)],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawPath(path, paint);

    // Border
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5
      ..color = Colors.white.withValues(alpha: 0.3);
    canvas.drawPath(path, borderPaint);
  }

  void _drawGlow(Canvas canvas, Offset center, double radius, Color color) {
    final glowPaint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10)
      ..color = color.withValues(alpha: 0.5);

    final path = Path();
    for (int i = 0; i < 6; i++) {
      final angle = (i * 60 - 90) * math.pi / 180;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, glowPaint);
  }

  void _drawConnectors(Canvas canvas, List<Offset> positions) {
    final connectorPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.5)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    final dotPaint = Paint()..color = Colors.white.withValues(alpha: 0.8);

    for (int i = 0; i < 3; i++) {
      final startX = positions[i].dx + hexSize * 0.3;
      final endX = positions[i + 1].dx - hexSize * 0.3;
      final y = positions[i].dy;

      // Çizgi
      canvas.drawLine(Offset(startX, y), Offset(endX, y), connectorPaint);

      // Başlangıç ve bitiş noktaları
      canvas.drawCircle(Offset(startX, y), 3.5, dotPaint);
      canvas.drawCircle(Offset(endX, y), 3.5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _HexagonSwapPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.swapPair != swapPair;
  }
}
