import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisallowGlow extends StatelessWidget {
  const DisallowGlow({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: child,
    );
  }
}
