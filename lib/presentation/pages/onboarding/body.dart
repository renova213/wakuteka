import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../configs/config.dart';
import 'components/onboarding_content.dart';
import '../../presentation.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.maxFinite,
        child: Consumer<SplashProvider>(
          builder: (context, splash, _) => Column(
            children: [
              const Spacer(),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  onPageChanged: (index) {
                    splash.changeCurrentPage(index);
                  },
                  itemCount: splash.splashData.length,
                  itemBuilder: (context, index) {
                    final data = splash.splashData[index];
                    return OnboardingContent(
                        text: data['text']!, image: data['image']!);
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splash.splashData.length,
                          (index) => buildDot(splash.currentPage, index),
                        ),
                      ),
                      const Spacer(flex: 3),
                      AnimatedOpacity(
                        opacity: splash.currentPage == 2 ? 1.0 : 0.0,
                        duration: kWidgetAnimationDuration,
                        child: DefaultButton(
                          height: 56,
                          width: double.maxFinite,
                          borderRadius: 15,
                          text: "Continue",
                          press: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/entrypoint", (route) => false);
                          },
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot(currentPage, index) {
    return AnimatedContainer(
      duration: kDotAnimationDuration,
      height: 6,
      width: currentPage == index ? 20 : 6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: currentPage == index
              ? ThemeConfig.kPrimaryColor
              : const Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}
