import 'package:flutter/material.dart';

import '../presentation.dart';

class NavigatorFadeTransitionHelper extends PageRouteBuilder {
  final Widget child;
  NavigatorFadeTransitionHelper({required this.child})
      : super(
            reverseTransitionDuration: kNavigatorAnimationDuration,
            transitionDuration: kNavigatorAnimationDuration,
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(opacity: animation, child: child);
  }
}
