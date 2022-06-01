import 'dart:async';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

Future<void> preloadImage(ImageProvider provider) {
  final config = ImageConfiguration(
    bundle: rootBundle,
    devicePixelRatio: window.devicePixelRatio,
    platform: defaultTargetPlatform,
  );
  final completer = Completer();
  final stream = provider.resolve(config);

  late final ImageStreamListener listener;
  listener = ImageStreamListener((image, _) {
    debugPrint('Image ${image.debugLabel} preloaded');
    completer.complete();
    stream.removeListener(listener);
  }, onError: (exception, stackTrace) {
    completer.complete();
    stream.removeListener(listener);
    FlutterError.reportError(FlutterErrorDetails(
      context: ErrorDescription('image failed to load'),
      library: 'image resource service',
      exception: exception,
      stack: stackTrace,
      silent: true,
    ));
  });

  stream.addListener(listener);
  return completer.future;
}
