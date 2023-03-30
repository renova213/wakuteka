import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakuteka/presentation/presentation.dart';

class ModalVariant extends StatelessWidget {
  const ModalVariant({super.key});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Material(
        color: Colors.transparent,
        child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle(context),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        _productInfo(image: "assets/images/product_0.png"),
                        SizedBox(height: 12.h),
                        Divider(color: Colors.grey.shade400),
                        productVariant(variantName: "Warna"),
                        SizedBox(height: 24.h),
                        productVariant(variantName: "Ukuran"),
                        SizedBox(height: 24.h),
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
        const Text("Varian Produk", style: AppTextStyles.body1SemiBold),
        GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.close, color: Colors.grey.shade600, size: 30.w)),
      ],
    );
  }

  Row _productInfo({required String image}) {
    return Row(
      children: [
        Image.asset(
          image,
          width: 100.w,
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _productVariantCard("Merah"),
                  SizedBox(width: 8.w),
                  _productVariantCard("XL"),
                ],
              ),
              SizedBox(height: 4.h),
              Text(formatCurrency("125000"),
                  style: AppTextStyles.body2SemiBold),
              SizedBox(height: 4.h),
              const Text("Stok: 20", style: AppTextStyles.smallText),
            ],
          ),
        ),
      ],
    );
  }

  Container _productVariantCard(String text) {
    return Container(
      padding: EdgeInsets.only(top: 4.h, bottom: 4.h, left: 8.w, right: 8.w),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(5)),
      child: Text(text,
          style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w500, color: Colors.grey.shade800)),
    );
  }

  Column productVariant({required String variantName}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(variantName, style: AppTextStyles.body2SemiBold),
        SizedBox(height: 8.h),
        Wrap(
          children: List.generate(
            4,
            (index) {
              return Padding(
                padding: EdgeInsets.only(right: 8.w, bottom: 8.h),
                child: _variantCard(
                    text: "Merah", image: "assets/images/product_2.png"),
              );
            },
          ),
        )
      ],
    );
  }

  Container _variantCard({required String text, required String image}) {
    return Container(
      constraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          image.isNotEmpty ? Image.asset(image, width: 20.w) : const SizedBox(),
          image.isNotEmpty ? SizedBox(width: 4.w) : const SizedBox(),
          Text(text, style: AppTextStyles.body2Light),
        ],
      ),
    );
  }
}
