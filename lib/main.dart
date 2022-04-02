import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

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
    return MaterialApp(
      title: 'Elecar',
      home: Container(),
    );
  }
}
