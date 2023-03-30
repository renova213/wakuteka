import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../presentation.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function press;
  final double height;
  final double width;
  final double borderRadius;
  const DefaultButton(
      {super.key,
      required this.text,
      required this.press,
      required this.borderRadius,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.h,
      height: height.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius)),
          ),
        ),
        onPressed: () => press(),
        child: Text(
          text,
          style: AppTextStyles.body2Bold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
