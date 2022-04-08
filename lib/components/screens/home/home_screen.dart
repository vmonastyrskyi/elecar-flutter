import 'package:elecar/app_colors.dart';
import 'package:elecar/app_resources.dart';
import 'package:elecar/extensions/widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'widgets/background_circle_painter.dart';
import 'widgets/start_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: BackgroundCirclesPainter(),
          size: Size.infinite,
        ),
        SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(0.0, 64.0, 0.0, 64.0),
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const _Title(),
                  const SizedBox(height: 16.0),
                  const _CarModel(),
                  const SizedBox(height: 4.0),
                  _buildCarType(),
                  const SizedBox(height: 48.0),
                  _buildCarImage(context),
                  const SizedBox(height: 42.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        widthFactor: 0.0,
                        alignment: Alignment.centerLeft,
                        child: _buildCarStatistics(
                          iconPath: AppResources.temperature,
                          value: '24°',
                          option: 'Temperature',
                        ),
                      ),
                      Align(
                        widthFactor: 0.0,
                        alignment: Alignment.center,
                        child: _buildCarStatistics(
                          iconPath: AppResources.mileage,
                          value: '873',
                          option: 'Mileage',
                        ),
                      ),
                      Align(
                        widthFactor: 0.0,
                        alignment: Alignment.centerRight,
                        child: _buildCarStatistics(
                          iconPath: AppResources.battery,
                          value: '94%',
                          option: 'Battery',
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
    );
  }

  Widget _buildCarType() {
    return Row(
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
    );
  }

  Widget _buildCarImage(BuildContext context) {
    return Image.asset(
      AppResources.home,
      width: MediaQuery.of(context).size.width * 0.75,
    );
  }

  Widget _buildCarStatistics({
    required String iconPath,
    required String value,
    required String option,
  }) {
    return Column(
      children: [
        Container(
          width: 25.0,
          height: 25.0,
          decoration: const BoxDecoration(
            color: AppColors.containerColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(iconPath),
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          value,
          style: const TextStyle(
            height: 1.4,
            fontSize: 20.0,
            fontFamily: 'Exo',
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 6.0),
        Text(
          option.toUpperCase(),
          style: const TextStyle(
            height: 1.4,
            fontSize: 10.0,
            fontFamily: 'Exo',
            fontWeight: FontWeight.w500,
            color: AppColors.textColorLight,
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Choose The Best Car',
      style: TextStyle(
        height: 1.4,
        fontSize: 24.0,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }
}

class _CarModel extends StatelessWidget {
  const _CarModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Porsche Mission E',
      style: TextStyle(
        height: 1.4,
        fontSize: 16.0,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }
}
