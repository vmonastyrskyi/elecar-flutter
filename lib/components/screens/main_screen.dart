import 'package:elecar/app_colors.dart';
import 'package:elecar/extensions/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'about/about_screen.dart';
import 'bloc/navigation_menu_bloc.dart';
import 'home/home_screen.dart';
import 'more_features/more_features_screen.dart';
import 'offer/offer_screen.dart';
import 'popular/popular_screen.dart';
import 'widgets/elecar_app_bar.dart';
import 'widgets/navigation_menu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();

    FlutterNativeSplash.remove();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ResponsiveLayout.setMediaQuery(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bodyColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: BlocProvider(
            create: (_) => NavigationMenuBloc(),
            child: Stack(
              children: [
                BlocListener<NavigationMenuBloc, NavigationMenuState>(
                  listener: (_, state) {
                    _pageController.animateToPage(
                      state.selectedNavigationPage.navigationMenuPage.value,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOutQuint,
                    );
                  },
                  child: Scaffold(
                    backgroundColor: AppColors.bodyColor,
                    appBar: const ElecarAppBar(),
                    body: PageView(
                      controller: _pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      children: const [
                        HomeScreen(),
                        AboutScreen(),
                        PopularScreen(),
                        MoreFeaturesScreen(),
                        OfferScreen(),
                      ],
                    ),
                    extendBodyBehindAppBar: true,
                  ),
                ),
                BlocSelector<NavigationMenuBloc, NavigationMenuState, bool>(
                  selector: (state) => state.showNavigationMenu,
                  builder: (_, showNavigationMenu) {
                    return Visibility(
                      visible: showNavigationMenu,
                      child: const NavigationMenu(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
