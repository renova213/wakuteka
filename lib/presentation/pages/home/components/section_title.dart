import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../presentation.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback press;
  const SectionTitle({super.key, required this.title, required this.press});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.body1SemiBold,
        ),
        IconButton(
            onPressed: press,
            icon: Icon(Icons.more_horiz, color: kPrimaryColor, size: 30.r)),
      ],
    );
  }
}
