import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../presentation.dart';

class OnboardingContent extends StatelessWidget {
  final String text, image;
  const OnboardingContent({super.key, required this.text, required this.image});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "WAKUTEKA",
          style: AppTextStyles.heading1.copyWith(color: kPrimaryColor),
        ),
        Text(text, textAlign: TextAlign.center),
        const Spacer(),
        Image.asset(
          image,
          height: 265.h,
          width: 235.w,
        ),
      ],
    );
  }
}
