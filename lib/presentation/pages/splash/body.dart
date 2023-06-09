import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/config.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "WAKUTEKA",
            style:
                ThemeConfig.heading1.copyWith(color: ThemeConfig.kPrimaryColor),
          ),
          SizedBox(height: 24.h),
          Image.asset(
            "assets/images/splash_1.png",
            height: 265.h,
            width: 235.w,
          ),
        ],
      ),
    );
  }
}
