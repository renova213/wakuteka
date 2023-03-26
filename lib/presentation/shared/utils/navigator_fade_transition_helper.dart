import 'package:flutter/material.dart';

import '../../presentation.dart';

class NavigatorFadeTransitionHelper {
  static Route<dynamic> fadeIn(String routeName, Widget widget) {
    // print(routeName);
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      transitionDuration: kRouteAnimationDuration,
      settings: RouteSettings(name: routeName),
    );
  }
}
