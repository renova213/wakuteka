import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../presentation.dart';

class BannerProduct extends StatelessWidget {
  final String bennerName;
  final String urlImage;
  final VoidCallback onTap;
  final Color color;

  const BannerProduct(
      {super.key,
      required this.bennerName,
      required this.urlImage,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Container(
          height: 180.h,
          width: 310.w,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Text(
                            bennerName,
                            style: AppTextStyles.body1Bold
                                .copyWith(color: kSecondTextColor),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Text(
                                "Shop now",
                                style: AppTextStyles.body2Medium.copyWith(
                                    color: kSecondTextColor.withOpacity(0.5)),
                              ),
                              SizedBox(width: 16.w),
                              Icon(Icons.arrow_forward,
                                  color: Colors.white, size: 20.sp),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Image.network(urlImage,
                      fit: BoxFit.fill, width: double.maxFinite),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
