import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/presentation/pages/product/components/exports.dart';

import '../../../../domain/domain.dart';
import '../../../presentation.dart';

class ProductVariant extends StatelessWidget {
  final ProductEntity product;
  const ProductVariant({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, product, _) {
        final variantLength = product.filterVariantProduct.length;
        final variant2Length = product.variantName2.isNotEmpty
            ? product
                .filterVariantProduct[product.indexVariantCard]["items"].length
            : 0;

        final variantName = product.variantName;
        final variantName2 = product.variantName2;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(
                variantLength: variantLength,
                variantName: variantName,
                variant2Length: variant2Length,
                variantName2: variantName2,
                context: context),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  product.filterVariantProduct.length,
                  (index) {
                    final data = product.filterVariantProduct[index];
                    return Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: _variantCard(
                          backgroundColor: product.indexVariantCard == index
                              ? kPrimaryColor.withOpacity(0.2)
                              : Colors.transparent,
                          text: data["titleVariant"],
                          image: data["items"][0]["image"]),
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Row _sectionTitle(
      {required int variantLength,
      required int variant2Length,
      required String variantName,
      required String variantName2,
      required BuildContext context}) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              const Text("Pilih Varian: ", style: AppTextStyles.body2SemiBold),
              Expanded(
                child: Text(
                    "${variantLength > 0 ? variantLength : ""} $variantName ${variant2Length > 0 ? variant2Length : ""} $variantName2",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.smallText
                        .copyWith(color: Colors.grey.shade800)),
              ),
            ],
          ),
        ),
        TextButton(
          onPressed: () {
            GeneralDialog.generalDialog(
                context: context, screen: ModalVariant(product: product));
          },
          child: Text("Lihat Semua",
              style: AppTextStyles.body2Bold.copyWith(color: kPrimaryColor)),
        ),
      ],
    );
  }

  Container _variantCard(
      {required String text,
      required String image,
      required Color backgroundColor}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          image.isNotEmpty ? Image.asset(image, width: 20.w) : const SizedBox(),
          image.isNotEmpty ? SizedBox(width: 4.w) : const SizedBox(),
          Text(text, style: AppTextStyles.body2Light),
        ],
      ),
    );
  }
}
