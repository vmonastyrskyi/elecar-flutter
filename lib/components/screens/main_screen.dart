import 'package:elecar/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widgets/elecar_app_bar.dart';
import 'widgets/navigation_menu.dart';
import 'router.dart';

export 'router.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey();

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bodyColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: AppColors.bodyColor,
                appBar: const ElecarAppBar(),
                body: Navigator(
                  key: rootNavigator,
                  onGenerateRoute: RootRouter.generateRoute,
                  initialRoute: RootRoutes.home,
                ),
                extendBodyBehindAppBar: true,
              ),
              // const NavigationMenu(),
            ],
          ),
        ),
      ),
    );
  }
}
