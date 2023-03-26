import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../presentation.dart';
import 'package:badges/badges.dart' as badges;

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20.w),
      child: Row(
        children: [
          DefaultIconButton(
            press: () {},
            icon: Icon(Icons.sort, size: 30.r, color: kPrimaryColor),
          ),
          SizedBox(width: 20.w),
          Text("Wakuteka",
              style: AppTextStyles.heading4.copyWith(color: kPrimaryColor)),
          const Spacer(),
          badges.Badge(
            badgeContent: const Text(
              '1',
              style: TextStyle(color: Colors.white, fontSize: 8),
            ),
            child: DefaultIconButton(
              press: () {},
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}
