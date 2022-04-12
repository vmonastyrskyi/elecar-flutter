import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'components/screens/main_screen.dart';
import 'resources_preloader.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await preloadResources();

  runApp(const ElecarApp());
}

class ElecarApp extends StatelessWidget {
  const ElecarApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Elecar',
      home: MainScreen(),
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
    );
  }
}
