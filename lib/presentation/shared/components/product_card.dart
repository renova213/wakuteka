import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/config.dart';
import '../../presentation.dart';

class ProductCard extends StatelessWidget {
  final String image, title;
  final UniqueKey uniqueKey;
  final int price;
  final VoidCallback press;
  const ProductCard(
      {super.key,
      required this.image,
      required this.price,
      required this.press,
      required this.uniqueKey,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        width: 120.w,
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(8.r),
              decoration: const BoxDecoration(
                color: Color(0xFFEFEFF2),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Hero(
                  tag: uniqueKey, child: Image.asset(image, height: 135.h)),
            ),
            SizedBox(height: 8.h),
            Text(title,
                style: ThemeConfig.smallText,
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            SizedBox(height: 8.h),
            Text(formatCurrency(price.toString()),
                style: ThemeConfig.body2SemiBold),
          ],
        ),
      ),
    );
  }
}
