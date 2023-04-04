import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wakuteka/domain/domain.dart';

import '../../presentation.dart';

class ProductWidget extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback press;
  final UniqueKey uniqueKey;
  final double width;
  const ProductWidget(
      {super.key,
      required this.product,
      required this.press,
      required this.uniqueKey,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 0,
              blurRadius: 7,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: 14.w, top: 14.h, right: 14.h, bottom: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 150.h,
                width: 120.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(product.image.first), fit: BoxFit.fill),
                  color: Colors.grey[50],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              SizedBox(
                width: 120.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: AppTextStyles.smallText
                          .copyWith(fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: false,
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      height: 20.h,
                      width: 100.w,
                      child: Text(
                        formatCurrency(product.price.toString()),
                        style: AppTextStyles.body2SemiBold
                            .copyWith(color: Colors.red.shade600),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    SizedBox(
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.yellow.shade700, size: 20.r),
                              SizedBox(width: 4.w),
                              const Text("4.9", style: AppTextStyles.smallText),
                            ],
                          ),
                          const Spacer(),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Icon(Icons.more_vert, size: 22.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
