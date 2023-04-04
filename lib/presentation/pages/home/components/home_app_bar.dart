import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../presentation.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                DefaultIconButton(
                  press: () {},
                  icon: Icon(Icons.sort, size: 30.r, color: kPrimaryLightColor),
                ),
                const Spacer(),
                badges.Badge(
                  badgeContent: const Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 8),
                  ),
                  child: DefaultIconButton(
                    press: () {},
                    icon: const Icon(Icons.shopping_cart_outlined,
                        color: kPrimaryLightColor),
                  ),
                ),
                SizedBox(width: 16.w),
              ],
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Text("Hello, user",
                  style:
                      AppTextStyles.heading4.copyWith(color: kSecondTextColor)),
            ),
            SizedBox(height: 24.h),
            _searchBar(),
          ],
        ),
      ),
    );
  }

  SizedBox _searchBar() {
    return SizedBox(
      height: 55.h,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search items ...",
          contentPadding:
              EdgeInsets.only(left: 24.w, top: 6.h, bottom: 6.h, right: 24.w),
          filled: true,
          isDense: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.search,
              color: kPrimaryColor.withOpacity(0.7), size: 30.r),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
