import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<void> preloadSvg(String path) async {
  final completer = await precachePicture(
    ExactAssetPicture(SvgPicture.svgStringDecoderBuilder, path),
    null,
  );
  debugPrint('SVG $path preloaded');
  return completer;
}
