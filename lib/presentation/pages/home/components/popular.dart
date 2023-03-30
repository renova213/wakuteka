import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../presentation.dart';
import 'exports.dart';

class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(title: "Popular", pressSeeAll: () {}),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<ProductProvider>(
            builder: (context, product, _) => Row(
              children: List.generate(
                product.popularProduct.length,
                (index) {
                  final data = product.popularProduct[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: ProductCard(
                        uniqueKey: data.uniqueKey,
                        image: data.image.first,
                        price: data.price,
                        press: () {
                          Navigator.of(context).pushNamed(
                              DetailProductPage.routeName,
                              arguments: data);
                        },
                        title: data.title),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
