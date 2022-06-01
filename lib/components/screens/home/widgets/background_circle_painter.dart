import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundCirclesPainter extends CustomPainter {
  final Paint _bigCirclePaint = Paint()
    ..color = const Color(0xFF374A6D).withOpacity(0.5)
    ..imageFilter = ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0);
  final Paint _smallCirclePaint = Paint()
    ..color = const Color(0xFF374A6D).withOpacity(0.5)
    ..imageFilter = ImageFilter.blur(sigmaX: 75.0, sigmaY: 75.0);
  final double _bigCircleRadius = 200.0;
  final double _smallCircleRadius = 150.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      const Offset(64.0, 128.0),
      _bigCircleRadius,
      _bigCirclePaint,
    );

    canvas.drawCircle(
      Offset(size.width - 64.0, (size.height / 2.0) + 64.0),
      _smallCircleRadius,
      _smallCirclePaint,
    );
  }

  @override
  bool shouldRepaint(covariant BackgroundCirclesPainter oldDelegate) {
    return false;
  }
}
