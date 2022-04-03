import 'package:elecar/utils/preload_image.dart';
import 'package:flutter/cupertino.dart';

import 'app_resources.dart';
import 'utils/preload_svg.dart';

Future<void> preloadResources() async {
  await Future.wait([
    preloadSvg(AppResources.logo),
    preloadSvg(AppResources.menu),
    preloadSvg(AppResources.temperature),
    preloadSvg(AppResources.mileage),
    preloadSvg(AppResources.battery),
  ]);

  await Future.wait([
    preloadImage(const AssetImage(AppResources.carHome)),
  ]);
}
