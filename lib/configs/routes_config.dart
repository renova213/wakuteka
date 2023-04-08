import 'package:flutter/material.dart';

import '../presentation/presentation.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    return {
      SplashPage.routeName: (context) => const SplashPage(),
      OnboardingPage.routeName: (context) => const OnboardingPage(),
      HomePage.routeName: (context) => const HomePage(),
      DetailProductPage.routeName: (context) => const DetailProductPage(),
      EntryPoint.routeName: (context) => const EntryPoint(),
      CategoryPage.routeName: (context) => const CategoryPage(),
      SearchPage.routeName: (context) => const SearchPage(),
    };
  }
}
