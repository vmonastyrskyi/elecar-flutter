import 'package:elecar/app_colors.dart';
import 'package:elecar/app_resources.dart';
import 'package:elecar/extensions/widget.dart';
import 'package:flutter/material.dart';

import 'widgets/popular_car_card.dart';
import 'widgets/popular_cars_view.dart';

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
            PopularCarsView(
              options: PopularCarsViewOptions(
                height: 320.0,
                viewportFraction: 240.0 / 320.0,
                spaceBetween: 24.0,
                borderRadius: 16.0,
              ),
              items: const [
                PopularCarCard(
                  title: 'Porsche',
                  imagePath: AppResources.popular1,
                  subtitle: 'Turbo S',
                  speed100m: 3.7,
                  speed: 356,
                  fuelType: 'Electric',
                  price: '175,900',
                ),
                PopularCarCard(
                  title: 'Porsche',
                  imagePath: AppResources.popular2,
                  subtitle: 'Taycan',
                  speed100m: 3.7,
                  speed: 356,
                  fuelType: 'Electric',
                  price: '114,900',
                ),
                PopularCarCard(
                  title: 'Porsche',
                  imagePath: AppResources.popular3,
                  subtitle: 'Turbo S Cross',
                  speed100m: 3.7,
                  speed: 356,
                  fuelType: 'Electric',
                  price: '150,900',
                ),
                PopularCarCard(
                  title: 'Porsche',
                  imagePath: AppResources.popular4,
                  subtitle: 'Boxster 718',
                  speed100m: 3.7,
                  speed: 356,
                  fuelType: 'Electric',
                  price: '125,900',
                ),
                PopularCarCard(
                  title: 'Porsche',
                  imagePath: AppResources.popular5,
                  subtitle: 'Cayman',
                  speed100m: 3.7,
                  speed: 356,
                  fuelType: 'Electric',
                  price: '128,900',
                ),
              ],
            ),
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
