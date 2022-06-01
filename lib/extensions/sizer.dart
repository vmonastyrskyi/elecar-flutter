import 'package:flutter/widgets.dart';

extension SizeUtils on num {
  double get w {
    return (this / 100.0) * ResponsiveLayout.mediaQuery.size.width;
  }

  double get h {
    return (this / 100.0) * ResponsiveLayout.mediaQuery.size.height;
  }
}

class ResponsiveLayout {
  static late MediaQueryData _mediaQueryData;

  static MediaQueryData get mediaQuery => _mediaQueryData;

  static void setMediaQuery(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
  }
}
