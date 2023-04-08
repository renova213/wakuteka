import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../domain/domain.dart';
import '../../../presentation.dart';
import 'exports.dart';

class ProductHighlighter extends StatefulWidget {
  final String title;
  const ProductHighlighter({super.key, required this.title});

  @override
  State<ProductHighlighter> createState() => _ProductHighlighterState();
}

class _ProductHighlighterState extends State<ProductHighlighter> {
  List<ProductEntity> products = [];

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      products = await Provider.of<ProductProvider>(context, listen: false)
          .fetchAndReturnProductByCategoryName(widget.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(
              title: widget.title,
              press: () {
                Navigator.pushNamed(context, CategoryPage.routeName,
                    arguments: widget.title);
              }),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Consumer<ProductProvider>(
              builder: (context, product, _) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  products.length,
                  (index) {
                    final data = products[index];

                    return Padding(
                      padding: EdgeInsets.only(right: 16.w),
                      child: ProductCard(
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
