import 'package:flutter/material.dart';

import '../../../presentation.dart';

class SplashContent extends StatelessWidget {
  final String text, image;
  const SplashContent({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "WAKUTEKA",
          style: TextStyle(
              fontSize: getProportionateScreenHeight(36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        Text(text, textAlign: TextAlign.center),
        const Spacer(),
        Image.asset(
          image,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
