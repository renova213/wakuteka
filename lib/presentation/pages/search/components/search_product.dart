import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/presentation/presentation.dart';

import '../../../../domain/domain.dart';

class SearchProduct extends StatelessWidget {
  final List<ProductEntity> products;
  const SearchProduct({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, product, _) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Wrap(
            children: List.generate(
              products.length,
              (index) {
                final data = products[index];
                return Padding(
                  padding: EdgeInsets.only(right: 16.w, bottom: 16.h),
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
