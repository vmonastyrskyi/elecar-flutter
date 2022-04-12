import 'dart:ui';

import 'package:elecar/app_colors.dart';
import 'package:elecar/app_resources.dart';
import 'package:elecar/components/screens/bloc/navigation_menu_bloc.dart';
import 'package:elecar/components/shared_widgets/separated_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SizedBox.expand(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 48.0, sigmaY: 48.0),
          child: Container(
            color: Colors.white.withOpacity(0.1),
            child: Stack(
              children: [
                Positioned(
                  top: 18.0,
                  right: 24.0,
                  width: 32.0,
                  height: 32.0,
                  child: _buildCloseButton(context),
                ),
                Align(
                  alignment: const Alignment(0.0, -0.5),
                  child: SeparatedColumn(
                    mainAxisSize: MainAxisSize.min,
                    separator: const SizedBox(height: 32.0),
                    children: [
                      _NavigationMenuButton(
                        onPressed: () {
                          context.navigationMenuBloc
                              .jumpToPage(NavigationMenuPage.home);
                        },
                        text: 'Home',
                      ),
                      _NavigationMenuButton(
                        onPressed: () {
                          context.navigationMenuBloc
                              .jumpToPage(NavigationMenuPage.about);
                        },
                        text: 'About',
                      ),
                      _NavigationMenuButton(
                        onPressed: () {
                          context.navigationMenuBloc
                              .jumpToPage(NavigationMenuPage.popular);
                        },
                        text: 'Popular',
                      ),
                      _NavigationMenuButton(
                        onPressed: () {
                          context.navigationMenuBloc
                              .jumpToPage(NavigationMenuPage.featured);
                        },
                        text: 'Featured',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return GestureDetector(
      onTap: Feedback.wrapForTap(
        context.navigationMenuBloc.closeNavigationMenu,
        context,
      ),
      child: SvgPicture.asset(AppResources.close),
    );
  }
}

class _NavigationMenuButton extends StatelessWidget {
  const _NavigationMenuButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Feedback.wrapForTap(onPressed, context),
      child: Text(
        text.toUpperCase(),
        style: const TextStyle(
          height: 1.4,
          fontSize: 20.0,
          fontFamily: 'Exo',
          fontWeight: FontWeight.w600,
          color: AppColors.white,
        ),
      ),
    );
  }
}
