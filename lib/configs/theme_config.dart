import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeConfig {
  //app color
  static const kPrimaryColor = Color(0xFF1A4C6E);
  static const kPrimaryLightColor = Color(0xFFFFECDF);
  static const kTextColor = Color(0xFF000000);
  static const kSecondTextColor = Color(0xFFFFFFFF);

  //textstyle
  static TextStyle heading1 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 36.sp,
    color: Colors.black,
  );

  static TextStyle heading2 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 32.sp,
    color: Colors.black,
  );

  static TextStyle heading3 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 24.sp,
    color: Colors.black,
  );

  static TextStyle heading4 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 20.sp,
    color: Colors.black,
  );

  static TextStyle body1Light = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: Colors.black,
  );

  static TextStyle body2Light = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    fontSize: 14.sp,
    color: Colors.black,
  );

  static TextStyle body1Regular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 16.sp,
    color: Colors.black,
  );

  static TextStyle body2Regular = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 14.sp,
    color: Colors.black,
  );

  static TextStyle body1Medium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: Colors.black,
  );

  static TextStyle body2Medium = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: Colors.black,
  );

  static TextStyle body1SemiBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
    color: Colors.black,
  );

  static TextStyle body2SemiBold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
    color: Colors.black,
  );

  static TextStyle body1Bold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 16.sp,
    color: Colors.black,
  );

  static TextStyle body2Bold = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700,
    fontSize: 14.sp,
    color: Colors.black,
  );

  static TextStyle smallText = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 12.sp,
    color: Colors.black,
  );
  static TextStyle caption = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    fontSize: 10.sp,
    color: Colors.black,
  );

  //themedata
  static ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFBFBFD),
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
            color: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            titleTextStyle:
                TextStyle(color: const Color(0xFF888888), fontSize: 18.sp),
            systemOverlayStyle: SystemUiOverlayStyle.light),
        visualDensity: VisualDensity.adaptivePlatformDensity);
  }
}
