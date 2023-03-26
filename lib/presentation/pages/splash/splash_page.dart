import 'package:flutter/material.dart';
import '../../presentation.dart';
import 'components/body.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static String routeName = "/splash";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    await Future.delayed(
      kSplashDuration,
      () => Navigator.of(context).pushReplacement(
        NavigatorFadeTransitionHelper.fadeIn(
            OnboardingPage.routeName, const OnboardingPage()),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
