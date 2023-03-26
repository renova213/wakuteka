import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../presentation.dart';

class SearchHome extends StatelessWidget {
  const SearchHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search items ...",
          contentPadding: EdgeInsets.all(6.r),
          filled: true,
          isDense: true,
          fillColor: Colors.white,
          suffixIconConstraints:
              BoxConstraints(minWidth: 24.r, maxHeight: 45.r),
          suffixIcon: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Ink(
                width: 40.w,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Center(
                  child: SvgPicture.asset("assets/icons/Filter.svg"),
                ),
              ),
            ),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(16.r),
            child: SvgPicture.asset('assets/icons/Search.svg'),
          ),
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
