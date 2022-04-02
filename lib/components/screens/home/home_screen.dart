import 'package:elecar/app_colors.dart';
import 'package:elecar/components/shared_widgets/elecar_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bodyColor,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.bodyColor,
            appBar: const ElecarAppBar(),
            body: Container(),
          ),
        ),
      ),
    );
  }
}
