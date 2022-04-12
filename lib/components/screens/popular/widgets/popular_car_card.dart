import 'dart:ui';

import 'package:elecar/app_colors.dart';
import 'package:elecar/app_resources.dart';
import 'package:elecar/extensions/sizer.dart';
import 'package:elecar/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularCarCard extends StatelessWidget {
  const PopularCarCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.speed100m,
    required this.speed,
    required this.fuelType,
    required this.price,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String imagePath;
  final double speed100m;
  final int speed;
  final String fuelType;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(color: AppColors.containerColor),
        CustomPaint(painter: _BackgroundCirclePainter()),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTitle(),
            _buildSubtitle(),
            const SizedBox(height: 24.0),
            Image.asset(imagePath).withPadding(12.0, 0.0, 12.0, 0.0),
            const SizedBox(height: 24.0),
            Wrap(
              runSpacing: 10.0,
              children: [
                _buildFeature(
                  iconPath: AppResources.mileage,
                  text: '$speed100m Sec',
                ),
                const SizedBox(width: 18.0),
                _buildFeature(
                  iconPath: AppResources.speed,
                  text: '$speed Km/h',
                ),
                const SizedBox(width: 18.0),
                _buildFeature(
                  iconPath: AppResources.fuel,
                  text: fuelType,
                ),
              ],
            ),
          ],
        ).withPadding(24.0, 32.0, 24.0, 24.0),
        Positioned(
          bottom: 34.0,
          left: 24.0,
          child: _buildPrice(),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: _buildBuyButton(),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      title,
      style: const TextStyle(
        height: 1.4,
        fontSize: 20.0,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      subtitle,
      style: const TextStyle(
        height: 1.4,
        fontSize: 15.0,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
    );
  }

  Widget _buildFeature({
    required String iconPath,
    required String text,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          height: 15.0,
        ),
        const SizedBox(width: 6.0),
        Text(
          text,
          style: const TextStyle(
            height: 1.4,
            fontSize: 14.0,
            fontFamily: 'Exo',
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Text(
      '\$$price',
      style: const TextStyle(
        height: 1.4,
        fontSize: 18.0,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }

  Widget _buildBuyButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16.0)),
        color: AppColors.primaryColor,
      ),
      child: SvgPicture.asset(
        AppResources.purchase,
        width: 18.0,
      ),
    );
  }
}

class _BackgroundCirclePainter extends CustomPainter {
  final Paint _circlePaint = Paint()
    ..color = const Color(0xFF374A6D).withOpacity(0.5)
    ..imageFilter = ImageFilter.blur(sigmaX: 60.0, sigmaY: 60.0);
  final double _circleRadius = 90.0;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      const Offset(32.0, 64.0),
      _circleRadius,
      _circlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant _BackgroundCirclePainter oldDelegate) {
    return false;
  }
}
