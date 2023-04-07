import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/injection_container.dart';

import '../presentation/presentation.dart';

Function multiProvider = (Widget widget) {
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SplashProvider()),
    ChangeNotifierProvider(create: (_) => FilterVariantProductProvider()),
    ChangeNotifierProvider(create: (_) => VisibilityProvider()),
    ChangeNotifierProvider(create: (_) => BotNavBarProvider()),
    ChangeNotifierProvider(create: (_) => SideMenuProvider()),

    //injector
    ChangeNotifierProvider(create: (_) => sl<ProductProvider>()),
  ], child: widget);
};
