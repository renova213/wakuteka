import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/presentation/pages/detail_product/components/exports.dart';

import '../../../../configs/config.dart';
import '../../../../domain/domain.dart';
import '../../../presentation.dart';

class ProductVariant extends StatelessWidget {
  final ProductEntity product;
  const ProductVariant({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterVariantProductProvider>(
      builder: (context, product, _) {
        final variantLength = product.filterVariantProduct.length;
        final variant2Length = product.subVariant.isNotEmpty
            ? product
                .filterVariantProduct[product.indexVariantCard]["items"].length
            : 0;

        final variant = product.variant;
        final subVariant = product.subVariant;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionTitle(
                variantLength: variantLength,
                variant: variant,
                variant2Length: variant2Length,
                subVariant: subVariant,
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
                              ? ThemeConfig.kPrimaryColor.withOpacity(0.2)
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
      required String variant,
      required String subVariant,
      required BuildContext context}) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Text("Pilih Varian: ", style: ThemeConfig.body2SemiBold),
              Expanded(
                child: Text(
                    "${variantLength > 0 ? variantLength : ""} $variant ${variant2Length > 0 ? variant2Length : ""} $subVariant",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeConfig.smallText
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
              style: ThemeConfig.body2Bold
                  .copyWith(color: ThemeConfig.kPrimaryColor)),
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
          border: Border.all(color: ThemeConfig.kPrimaryColor),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
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
