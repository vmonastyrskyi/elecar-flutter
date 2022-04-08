import 'package:elecar/app_resources.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24.0, 64.0, 24.0, 64.0),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            _buildAboutImage(),
            const SizedBox(height: 42.0),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        AppResources.about,
        fit: BoxFit.cover,
      ),
    );
  }
}
