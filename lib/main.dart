import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'components/screens/main_screen.dart';
import 'extensions/sizer.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    ResponsiveLayout.setMediaQuery(context);
  }

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
