import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation/presentation.dart';

Function multiProvider = (Widget widget) {
  return MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SplashProvider()),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
  ], child: widget);
};
