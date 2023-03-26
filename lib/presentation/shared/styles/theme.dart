import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme() {
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
