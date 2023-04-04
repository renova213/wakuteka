import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/presentation/pages/home/components/section_title.dart';

import '../../../../configs/config.dart';
import '../../../presentation.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: SectionTitle(title: "Categories", press: () {}),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Consumer<ProductProvider>(
              builder: (context, product, _) => Row(
                children: List.generate(
                  product.cardProductCategoryItems.length,
                  (index) {
                    final data = product.cardProductCategoryItems[index];
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: CategoryCard(
                        iconAsset: data['assetIcon'],
                        label: data['labelText'],
                        press: () {},
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String iconAsset;
  final String label;
  final Function press;
  const CategoryCard(
      {super.key,
      required this.iconAsset,
      required this.label,
      required this.press});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        side: MaterialStatePropertyAll(
          BorderSide(color: Colors.grey.shade300),
        ),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: () {
        press();
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 4, right: 4, top: 8, bottom: 8).r,
        child: Column(
          children: [
            SvgPicture.asset(iconAsset),
            SizedBox(height: 8.h),
            Text(
              label,
              style: ThemeConfig.body2Medium,
            ),
          ],
        ),
      ),
    );
  }
}
