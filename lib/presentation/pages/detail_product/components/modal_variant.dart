import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/presentation/presentation.dart';

import '../../../../configs/config.dart';
import '../../../../domain/domain.dart';

class ModalVariant extends StatelessWidget {
  final ProductEntity product;
  const ModalVariant({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Material(
        color: Colors.transparent,
        child: Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(minHeight: 0, maxHeight: 750.h),
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                _sectionTitle(context),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Consumer<FilterVariantProductProvider>(
                      builder: (context, product, _) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _productInfo(),
                          SizedBox(height: 12.h),
                          Divider(color: Colors.grey.shade400),
                          SizedBox(height: 24.h),
                          _productVariantItems(
                              press: (index) {
                                product.changeIndexVariantCard(index);
                              },
                              variant: "${product.variant}:",
                              indexVariantCard: product.indexVariantCard),
                          SizedBox(height: 12.h),
                          product.subVariant.isNotEmpty
                              ? _productVariantItems2(
                                  press: (index) {
                                    product.changeIndexVariantCard2(index);
                                  },
                                  variant: "${product.subVariant}:",
                                  indexVariantCard: product.indexVariantCard2)
                              : const SizedBox(),
                          Divider(color: Colors.grey.shade400),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _sectionTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Varian Produk", style: ThemeConfig.body1SemiBold),
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.close, color: Colors.grey.shade600, size: 30.w)),
      ],
    );
  }

  Consumer _productInfo() {
    return Consumer<FilterVariantProductProvider>(
      builder: (context, product, _) => Row(
        children: [
          Image.network(
            product.selectedProduct['image'],
            width: 100.w,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _productVariantCard(
                        product.selectedProduct['titleVariant']),
                    SizedBox(width: 8.w),
                    product.selectedProduct['titleVariant2'].isNotEmpty
                        ? _productVariantCard(
                            product.selectedProduct['titleVariant2'])
                        : const SizedBox(),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                    formatCurrency(product.selectedProduct['price'].toString()),
                    style: ThemeConfig.body2SemiBold),
                SizedBox(height: 4.h),
                Text("Stok: ${product.selectedProduct['stock']}",
                    style: ThemeConfig.smallText),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _productVariantCard(String text) {
    return Container(
      padding: EdgeInsets.only(top: 4.h, bottom: 4.h, left: 8.w, right: 8.w),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(5)),
      child: Text(text,
          style: ThemeConfig.caption.copyWith(
              fontWeight: FontWeight.w500, color: Colors.grey.shade800)),
    );
  }

  Column _productVariantItems(
      {required String variant,
      required int indexVariantCard,
      required void Function(int index) press}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(variant, style: ThemeConfig.body2SemiBold),
        SizedBox(height: 8.h),
        Consumer<FilterVariantProductProvider>(
          builder: (context, product, _) {
            final variantLength = product.filterVariantProduct.length;

            return Wrap(
              children: List.generate(
                variantLength,
                (index) {
                  final data = product.filterVariantProduct[index];
                  return GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                      child: GestureDetector(
                        onTap: () => press(index),
                        child: _variantCard(
                            borderColor: data['stock'] == 0
                                ? Colors.grey.withOpacity(0.5)
                                : ThemeConfig.kPrimaryColor,
                            text: product.filterVariantProduct[index]
                                ["titleVariant"],
                            image: data["items"][0]["image"],
                            backgroundColor: indexVariantCard == index
                                ? ThemeConfig.kPrimaryColor.withOpacity(0.3)
                                : Colors.transparent),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }

  Column _productVariantItems2(
      {required String variant,
      required int indexVariantCard,
      required void Function(int index) press}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(variant, style: ThemeConfig.body2SemiBold),
        SizedBox(height: 8.h),
        Consumer<FilterVariantProductProvider>(
          builder: (context, product, _) {
            final variantLength = product
                .filterVariantProduct[product.indexVariantCard]["items"].length;

            return Wrap(
              children: List.generate(
                variantLength,
                (index) {
                  final data =
                      product.filterVariantProduct[product.indexVariantCard]
                          ["items"][index];
                  return Padding(
                    padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                    child: GestureDetector(
                      onTap: data['stock'] > 0 ? () => press(index) : () {},
                      child: _variantCard(
                          text: data["titleVariantItem"],
                          image: "",
                          borderColor: data['stock'] == 0
                              ? Colors.grey.withOpacity(0.5)
                              : ThemeConfig.kPrimaryColor,
                          backgroundColor: data['stock'] == 0
                              ? Colors.grey.withOpacity(0.5)
                              : indexVariantCard == index
                                  ? ThemeConfig.kPrimaryColor.withOpacity(0.3)
                                  : Colors.transparent),
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }

  Container _variantCard(
      {required String text,
      required String image,
      required Color backgroundColor,
      required Color borderColor}) {
    return Container(
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          image.isNotEmpty
              ? Image.network(image, width: 20.w)
              : const SizedBox(),
          image.isNotEmpty ? SizedBox(width: 4.w) : const SizedBox(),
          Text(text, style: ThemeConfig.body2Light),
        ],
      ),
    );
  }
}
