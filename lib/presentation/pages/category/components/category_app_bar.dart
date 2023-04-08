import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../configs/config.dart';
import '../../../presentation.dart';
import 'package:badges/badges.dart' as badges;

class CategoryAppBar extends StatelessWidget {
  final String categoryName;
  const CategoryAppBar({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: ThemeConfig.kPrimaryColor,
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
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.keyboard_arrow_left,
                      size: 30.w, color: ThemeConfig.kPrimaryLightColor),
                ),
                const Spacer(),
                badges.Badge(
                  badgeContent: Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 12.w),
                  ),
                  child: DefaultIconButton(
                    press: () {},
                    icon: Icon(Icons.shopping_cart_outlined,
                        color: ThemeConfig.kPrimaryLightColor, size: 24.w),
                  ),
                ),
                SizedBox(width: 16.w),
              ],
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 32.w),
              child: Text(categoryName,
                  style: ThemeConfig.heading4
                      .copyWith(color: ThemeConfig.kSecondTextColor)),
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
        readOnly: true,
        decoration: InputDecoration(
          hintText: "Search items ...",
          contentPadding:
              EdgeInsets.only(left: 24.w, top: 6.h, bottom: 6.h, right: 24.w),
          filled: true,
          isDense: true,
          fillColor: Colors.white,
          suffixIcon: Icon(Icons.search,
              color: ThemeConfig.kPrimaryColor.withOpacity(0.7), size: 30.r),
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
