import 'dart:ui';

import 'package:elecar/app_colors.dart';
import 'package:elecar/app_resources.dart';
import 'package:elecar/components/shared_widgets/elecar_app_bar.dart';
import 'package:elecar/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/start_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bodyColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.bodyColor,
            appBar: const ElecarAppBar(),
            body: Stack(
              children: [
                CustomPaint(
                  painter: _BackgroundCirclesPainter(),
                  size: Size.infinite,
                ),
                SafeArea(
                  child: Center(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(0.0, 64.0, 0.0, 64.0),
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const StartButton(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            extendBodyBehindAppBar: true,
          ),
        ),
      ),
    );
  }
}

class _BackgroundCirclesPainter extends CustomPainter {
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
  bool shouldRepaint(covariant _BackgroundCirclesPainter oldDelegate) {
    return false;
  }
}