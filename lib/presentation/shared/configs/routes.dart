import 'package:flutter/material.dart';

import '../../presentation.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (_) => const SplashPage(),
  OnboardingPage.routeName: (_) => const OnboardingPage(),
  HomePage.routeName: (_) => const HomePage(),
};
