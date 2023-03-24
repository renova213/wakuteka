import 'package:flutter/material.dart';
import 'package:wakuteka/presentation/pages/splash/components/body.dart';
import '../../presentation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return const Scaffold(
      body: Body(),
    );
  }
}
