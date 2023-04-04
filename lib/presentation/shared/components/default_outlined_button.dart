import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../configs/config.dart';

class DefaultOutlinedButton extends StatelessWidget {
  final String text;
  final Function press;
  final double height;
  final double width;
  final double borderRadius;
  const DefaultOutlinedButton(
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
      child: OutlinedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.white;
              }
              return ThemeConfig.kPrimaryColor;
            },
          ),
          textStyle: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ThemeConfig.body2Bold.copyWith(color: Colors.white);
              }
              return ThemeConfig.body2Bold
                  .copyWith(color: ThemeConfig.kPrimaryColor);
            },
          ),
          side: MaterialStateProperty.all<BorderSide>(
              const BorderSide(width: 1, color: ThemeConfig.kPrimaryColor)),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ThemeConfig.kPrimaryColor;
              }
              return null;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return ThemeConfig.kPrimaryColor;
              }
              return Colors.white;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: () => press(),
        child: Text(text),
      ),
    );
  }
}
