import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/domain/entities/product_entity.dart';
import 'package:wakuteka/presentation/presentation.dart';
import 'components/exports.dart';

class Body extends StatefulWidget {
  final ProductEntity product;

  const Body({super.key, required this.product});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();

    final context = this.context;
    Future.microtask(
      () async {
        if (widget.product.variants.isNotEmpty) {
          await Provider.of<ProductProvider>(context, listen: false)
              .extractVariant(widget.product.variants)
              .then((_) async =>
                  await Provider.of<ProductProvider>(context, listen: false)
                      .extractTitlevariant(widget.product.variants))
              .then((_) async =>
                  await Provider.of<ProductProvider>(context, listen: false)
                      .extractVariantItem(widget.product.variants))
              .then((_) async =>
                  await Provider.of<ProductProvider>(context, listen: false)
                      .changeIndexVariantCard(0))
              .then((_) => Provider.of<ProductProvider>(context, listen: false)
                  .changeIndexVariantCard2(0));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImage(
            image: widget.product.images,
            uniqueKey: widget.product.uniqueKey,
          ),
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoProduct(
                      price: widget.product.price.toString(),
                      title: widget.product.productName,
                      description: widget.product.description),
                  SizedBox(height: 12.h),
                  Divider(color: Colors.grey.shade300),
                  SizedBox(height: 12.h),
                  widget.product.variants.isNotEmpty
                      ? ProductVariant(product: widget.product)
                      : const SizedBox(),
                  SizedBox(height: 12.h),
                  Divider(color: Colors.grey.shade300),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: DefaultOutlinedButton(
                            text: "Beli",
                            press: () {},
                            borderRadius: 10,
                            height: 50,
                            width: double.maxFinite),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: DefaultButton(
                            text: "+ Keranjang",
                            press: () {},
                            borderRadius: 10,
                            height: 50,
                            width: double.maxFinite),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
