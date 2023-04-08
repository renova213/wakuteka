import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/presentation/presentation.dart';

class CategoryProduct extends StatelessWidget {
  const CategoryProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, product, _) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Wrap(
            children: List.generate(
              product.productsByCategory.length,
              (index) {
                final data = product.productsByCategory[index];
                return Padding(
                  padding: EdgeInsets.only(right: 16.w),
                  child: ProductCard(
                      product: data,
                      press: () {
                        Navigator.pushNamed(
                            context, DetailProductPage.routeName,
                            arguments: data);
                      },
                      uniqueKey: data.uniqueKey,
                      width: 150.w),
                );
              },
            ),
          )),
    );
  }
}
