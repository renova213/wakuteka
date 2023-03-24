import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presentation.dart';

Function multiProvider = (Widget widget) {
  return MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => SplashProvider(),
    ),
  ], child: widget);
};
