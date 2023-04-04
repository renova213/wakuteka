import 'package:flutter/material.dart';
import '../../../configs/config.dart';
import 'body.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static String routeName = "/";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startTime() async {
    await Future.delayed(
      kSplashDuration,
      () => Navigator.of(context).pushReplacementNamed("/onboarding"),
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
