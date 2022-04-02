import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'components/screens/home/home_screen.dart';
import 'resources_preloader.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await preloadResources();
  runApp(const ElecarApp());
}

class ElecarApp extends StatefulWidget {
  const ElecarApp({Key? key}) : super(key: key);

  @override
  State<ElecarApp> createState() => _ElecarAppState();
}

class _ElecarAppState extends State<ElecarApp> {
  @override
  void initState() {
    super.initState();

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Elecar',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
