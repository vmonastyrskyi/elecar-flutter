import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'components/screens/main_screen.dart';
import 'resources_preloader.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await preloadResources();

  runApp(
    DevicePreview(
      enabled: false,
      builder: (_) => const ElecarApp(),
    ),
  );
}

class ElecarApp extends StatelessWidget {
  const ElecarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return DevicePreview.appBuilder(
          context,
          ResponsiveWrapper.builder(
            child,
            minWidth: 414.0,
            defaultScale: true,
            breakpoints: [
              const ResponsiveBreakpoint.resize(
                480.0,
                name: MOBILE,
                scaleFactor: 1.25,
              ),
            ],
          ),
        );
      },
      title: 'Elecar',
      home: const MainScreen(),
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
    );
  }
}
