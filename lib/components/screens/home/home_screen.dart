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
                          const Text(
                            'Choose The Best Car',
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 24.0,
                              fontFamily: 'Exo',
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const Text(
                            'Porsche Mission E',
                            style: TextStyle(
                              height: 1.4,
                              fontSize: 16.0,
                              fontFamily: 'Exo',
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                AppResources.battery,
                                color: AppColors.primaryColor,
                              ),
                              const SizedBox(width: 6.0),
                              const Text(
                                'Electric car',
                                style: TextStyle(
                                  height: 1.4,
                                  fontSize: 13.0,
                                  fontFamily: 'Exo',
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 48.0),
                          Image.asset(
                            AppResources.carHome,
                            width: MediaQuery.of(context).size.width * 0.75,
                          ),
                          const SizedBox(height: 42.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                widthFactor: 0.0,
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 25.0,
                                      height: 25.0,
                                      decoration: const BoxDecoration(
                                        color: AppColors.containerColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            AppResources.temperature),
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    const Text(
                                      '24°',
                                      style: TextStyle(
                                        height: 1.4,
                                        fontSize: 20.0,
                                        fontFamily: 'Exo',
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 6.0),
                                    const Text(
                                      'TEMPERATURE',
                                      style: TextStyle(
                                        height: 1.4,
                                        fontSize: 10.0,
                                        fontFamily: 'Exo',
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColorLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                widthFactor: 0.0,
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 25.0,
                                      height: 25.0,
                                      decoration: const BoxDecoration(
                                        color: AppColors.containerColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            AppResources.mileage),
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    const Text(
                                      '873',
                                      style: TextStyle(
                                        height: 1.4,
                                        fontSize: 20.0,
                                        fontFamily: 'Exo',
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 6.0),
                                    const Text(
                                      'MILEAGE',
                                      style: TextStyle(
                                        height: 1.4,
                                        fontSize: 10.0,
                                        fontFamily: 'Exo',
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColorLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                widthFactor: 0.0,
                                alignment: Alignment.centerRight,
                                child: Column(
                                  children: [
                                    Container(
                                      width: 25.0,
                                      height: 25.0,
                                      decoration: const BoxDecoration(
                                        color: AppColors.containerColor,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset(
                                            AppResources.battery),
                                      ),
                                    ),
                                    const SizedBox(height: 12.0),
                                    const Text(
                                      '94%',
                                      style: TextStyle(
                                        height: 1.4,
                                        fontSize: 20.0,
                                        fontFamily: 'Exo',
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 6.0),
                                    const Text(
                                      'BATTERY',
                                      style: TextStyle(
                                        height: 1.4,
                                        fontSize: 10.0,
                                        fontFamily: 'Exo',
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.textColorLight,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ).withPaddingSymmetric(32.0, 0.0),
                          const SizedBox(height: 56.0),
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