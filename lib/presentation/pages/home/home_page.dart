import 'package:flutter/material.dart';
import 'components/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
