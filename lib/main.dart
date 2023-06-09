import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'configs/config.dart';
import 'injection_container.dart';
import 'presentation/presentation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return multiProvider(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, _) => MaterialApp(
          onGenerateRoute: (RouteSettings settings) {
            switch (settings.name) {
              case "/":
                return TransitionPage.fadeTransition(
                    settings, const SplashPage());
              case "/onboarding":
                return TransitionPage.fadeTransition(
                    settings, const OnboardingPage());
              case "/home":
                return TransitionPage.fadeTransition(
                    settings, const HomePage());
              case "/detail-product":
                return TransitionPage.fadeTransition(
                    settings, const DetailProductPage());
              case "/entrypoint":
                return TransitionPage.fadeTransition(
                    settings, const EntryPoint());
              case "/category":
                return TransitionPage.fadeTransition(
                    settings, const CategoryPage());
              case "/search":
                return TransitionPage.fadeTransition(
                    settings, const SearchPage());
              default:
                return null;
            }
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeConfig.theme(),
          initialRoute: SplashPage.routeName,
        ),
      ),
    );
  }
}
