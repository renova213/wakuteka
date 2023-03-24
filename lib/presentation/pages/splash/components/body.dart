import 'package:flutter/material.dart';

import 'splash_content.dart';
import '../../../presentation.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> splashData = [
      {
        "text": "Welcome to Wakuteka, Let's Shop!",
        "image": "assets/images/splash_1.png"
      },
      {
        "text": "We help people connect to our shop",
        "image": "assets/images/splash_2.png"
      },
      {
        "text": "We show the easy way to shop",
        "image": "assets/images/splash_3.png"
      },
    ];

    return SafeArea(
      child: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            const Spacer(),
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) {
                  final data = splashData[index];
                  return SplashContent(
                      text: data['text']!, image: data['image']!);
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(text: "Continue", press: () {}),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot(index) {
    return AnimatedContainer(
      duration: kDotAnimationDuration,
      height: 6,
      width: currentPage == index ? 20 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
