import 'package:elecar/app_colors.dart';
import 'package:flutter/material.dart';

class PopularScreen extends StatelessWidget {
  const PopularScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24.0, 56.0, 24.0, 56.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const _Title(),
            const SizedBox(height: 56.0),
          ],
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
      'Choose Your Electric Car\nOf The Porsche Brand',
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
