import 'package:elecar/app_colors.dart';
import 'package:elecar/extensions/sizer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'router.dart';
import 'widgets/elecar_app_bar.dart';

export 'router.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey();

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: AppColors.bodyColor,
                appBar: const ElecarAppBar(),
                body: Navigator(
                  key: rootNavigator,
                  onGenerateRoute: RootRouter.generateRoute,
                  initialRoute: RootRoutes.popular,
                ),
                extendBodyBehindAppBar: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
