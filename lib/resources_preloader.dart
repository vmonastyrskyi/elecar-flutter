import 'app_resources.dart';
import 'utils/preload_svg.dart';

Future<void> preloadResources() async {
  await Future.wait([
    preloadSvg(AppResources.logo),
    preloadSvg(AppResources.menu),
  ]);
}
