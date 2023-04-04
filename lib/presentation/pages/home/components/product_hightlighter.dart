import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/presentation/shared/components/product.dart';

import '../../../presentation.dart';
import 'exports.dart';

class ProductHighlighter extends StatelessWidget {
  final String title;
  const ProductHighlighter({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title: title, press: () {}),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Consumer<ProductProvider>(
              builder: (context, product, _) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  product.productHightlighter.length,
                  (index) {
                    final data = product.productHightlighter[index];

                    return Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: ProductWidget(
                        uniqueKey: data.uniqueKey,
                        product: data,
                        width: 150.w,
                        press: () {
                          Navigator.of(context).pushNamed(
                              DetailProductPage.routeName,
                              arguments: data);
                        },
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
