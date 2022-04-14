import 'dart:ui';

import 'package:elecar/app_colors.dart';
import 'package:elecar/app_resources.dart';
import 'package:elecar/components/screens/bloc/navigation_menu_bloc.dart';
import 'package:elecar/extensions/sizer.dart';
import 'package:elecar/extensions/widget.dart';
import 'package:flutter/material.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          AppResources.offerBackground,
          fit: BoxFit.fitHeight,
        ),
        SafeArea(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _Title(),
                    const SizedBox(height: 32.0),
                    const _Subtitle(),
                    const SizedBox(height: 48.0),
                    _buildSubscribeButton(context),
                  ],
                ).withPadding(24.0, 56.0, 24.0, 0.0),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 64.0),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    AppResources.offer,
                    fit: BoxFit.fitHeight,
                    height: 240.0,
                    alignment: Alignment(-1, 0.0),
                  ).withPadding(0.0, 0.0, 0.0, 56.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubscribeButton(BuildContext context) {
    return UnconstrainedBox(
      child: GestureDetector(
        onTap: Feedback.wrapForTap(
          () => context.navigationMenuBloc.jumpToPage(NavigationMenuPage.home),
          context,
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: AppColors.primaryColor,
          ),
          child: const Text(
            'Subscribe Now',
            style: TextStyle(
              height: 1.4,
              fontSize: 15.0,
              fontFamily: 'Exo',
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
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
      'Do You Want To Receive\nSpecial Offers?',
      style: TextStyle(
        height: 1.4,
        fontSize: 20.0,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w600,
        color: AppColors.titleColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _Subtitle extends StatelessWidget {
  const _Subtitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Be the first to receive all the information about our products and new cars by email by subscribing to our mailing list.',
      style: TextStyle(
        height: 1.4,
        fontSize: 15.0,
        fontFamily: 'Exo',
        fontWeight: FontWeight.w400,
        color: AppColors.textColor,
      ),
      textAlign: TextAlign.center,
    );
  }
}
