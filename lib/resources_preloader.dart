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
    preloadSvg(AppResources.close),
    preloadSvg(AppResources.purchase),
    preloadSvg(AppResources.speed),
    preloadSvg(AppResources.fuel),
  ]);

  await Future.wait([
    preloadImage(const AssetImage(AppResources.home)),
    preloadImage(const AssetImage(AppResources.about)),
    preloadImage(const AssetImage(AppResources.popular1)),
    preloadImage(const AssetImage(AppResources.popular2)),
    preloadImage(const AssetImage(AppResources.popular3)),
    preloadImage(const AssetImage(AppResources.popular4)),
    preloadImage(const AssetImage(AppResources.popular5)),
    preloadImage(const AssetImage(AppResources.map)),
    preloadImage(const AssetImage(AppResources.features)),
  ]);
}
