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
      children: [
        SectionTitle(title: "Popular", pressSeeAll: () {}),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Consumer<ProductProvider>(
            builder: (context, product, _) => Row(
              children: List.generate(
                product.demoProduct.length,
                (index) {
                  final data = product.demoProduct[index];

                  return Padding(
                    padding: EdgeInsets.only(right: 16.w),
                    child: ProductCard(
                        image: data['image'],
                        price: data['price'],
                        press: () {},
                        title: data['title']),
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
