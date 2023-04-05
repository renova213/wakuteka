import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/config.dart';
import '../../../presentation.dart';

class InfoProduct extends StatelessWidget {
  const InfoProduct(
      {super.key,
      required this.title,
      required this.description,
      required this.price});

  final String title, description, price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(formatCurrency(price), style: ThemeConfig.heading4),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Text(title,
              style: ThemeConfig.body2Regular,
              maxLines: 2,
              overflow: TextOverflow.ellipsis),
        ),
        SizedBox(height: 12.h),
        Divider(color: Colors.grey.shade300),
        SizedBox(height: 12.h),
        Text("Deskripsi Produk", style: ThemeConfig.body2SemiBold),
        SizedBox(height: 8.h),
        Text(description, style: ThemeConfig.body2Regular),
      ],
    );
  }
}
