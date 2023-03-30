import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/presentation/pages/product/components/exports.dart';

import '../../../presentation.dart';

class ProductVariant extends StatelessWidget {
  const ProductVariant({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, product, _) {
        final variantLength = product.filterVariantProduct.isNotEmpty
            ? product.filterVariantProduct[0]["items"].length
            : 0;
        final variant2Length = product.filterVariantProduct.isNotEmpty
            ? product.filterVariantProduct[1]["items"].length
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
                    "$variantLength $variantName $variant2Length $variantName2",
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
                context: context, screen: const ModalVariant());
          },
          child: Text("Lihat Semua",
              style: AppTextStyles.body2Bold.copyWith(color: kPrimaryColor)),
        ),
      ],
    );
  }

  Container _variantCard({required String text, required String image}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey),
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
