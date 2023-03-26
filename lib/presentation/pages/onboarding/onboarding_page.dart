import 'package:flutter/material.dart';
import 'package:wakuteka/presentation/pages/onboarding/components/body.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static String routeName = "/onboarding";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
