import 'dart:ui';

import 'package:elecar/app_colors.dart';
import 'package:elecar/app_resources.dart';
import 'package:elecar/extensions/sizer.dart';
import 'package:flutter/material.dart';

class MoreFeaturesScreen extends StatelessWidget {
  const MoreFeaturesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(0.0, 56.0, 0.0, 56.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const _Title(),
            const SizedBox(height: 64.0),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Image.asset(AppResources.map),
                Image.asset(
                  AppResources.features,
                  width: 50.w,
                ),
                Positioned(
                  left: 48.0,
                  top: 96.0,
                  child: _buildFeature(
                    title: '800v',
                    subtitle: 'Turbo\nChargin',
                  ),
                ),
                Positioned(
                  right: 48.0,
                  bottom: 196.0,
                  child: _buildFeature(
                    title: '350',
                    subtitle: 'Km\nRange',
                  ),
                ),
                Positioned(
                  left: 48.0,
                  bottom: 96.0,
                  child: _buildFeature(
                    title: '480',
                    subtitle: 'Km\nTravel',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFeature({
    required String title,
    required String subtitle,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          width: 120.0,
          color: AppColors.white.withOpacity(0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: const TextStyle(
                  height: 1.4,
                  fontSize: 16.0,
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Text(
                subtitle,
                style: const TextStyle(
                  height: 1.4,
                  fontSize: 12.0,
                  fontFamily: 'Exo',
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'More Features',
      style: TextStyle(
        height: 1.4,
        fontSize: 20.0,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
