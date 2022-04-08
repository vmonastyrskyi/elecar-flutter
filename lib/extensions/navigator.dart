import 'package:flutter/material.dart';

extension NavigatorExtension on GlobalKey<NavigatorState> {
  void pop<T extends Object?>([T? result]) {
    return currentState!.pop<T>(result);
  }

  Future<bool> maybePop<T extends Object?>([T? result]) {
    return currentState!.maybePop<T>(result);
  }

  Future<T?> push<T extends Object?>(Route<T> route) {
    return currentState!.push<T>(route);
  }

  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) {
    return currentState!.pushNamed<T>(
      routeName,
      arguments: arguments,
    );
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) {
    return currentState!.pushReplacementNamed<T, TO>(
      routeName,
      result: result,
      arguments: arguments,
    );
  }
}
