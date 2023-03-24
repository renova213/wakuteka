import 'package:flutter/material.dart';
import 'presentation/presentation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return multiProvider(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            fontFamily: "Muli",
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: kTextColor),
              bodySmall: TextStyle(color: kTextColor),
            ),
            visualDensity: VisualDensity.adaptivePlatformDensity),
        initialRoute: SplashPage.routeName,
        routes: routes,
      ),
    );
  }
}
