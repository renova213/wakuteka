import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'exports.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeAppBar(),
              SizedBox(height: 20.h),
              const SearchHome(),
              SizedBox(height: 20.h),
              const Categories(),
              SizedBox(height: 20.h),
              const NewArrival(),
              SizedBox(height: 20.h),
              const Popular(),
            ],
          ),
        ),
      ),
    );
  }
}
