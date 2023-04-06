import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../configs/config.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({super.key, required this.image, required this.uniqueKey});

  final List<String> image;
  final UniqueKey uniqueKey;

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  int currentIndex = 0;
  bool spawnContainerCurrentImage = false;
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: widget.uniqueKey,
      child: SizedBox(
        height: 325.h,
        child: Stack(
          children: [
            Positioned(
              left: 16.w,
              top: 260.h,
              child: AnimatedOpacity(
                duration: kDefaultDuration,
                opacity: spawnContainerCurrentImage ? 1.0 : 0.0,
                child: Container(
                  alignment: Alignment.center,
                  height: 35.h,
                  width: 50.w,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text("${currentIndex + 1}/${widget.image.length}",
                      style: ThemeConfig.smallText.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600)),
                ),
              ),
            ),
            PageView.builder(
                onPageChanged: (index) async {
                  setState(() {
                    currentIndex = index;
                    spawnContainerCurrentImage = true;
                  });

                  await Future.delayed(const Duration(seconds: 2));

                  setState(() {
                    spawnContainerCurrentImage = false;
                  });
                },
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final data = widget.image[index];
                  return Image.network(data, height: 325.h);
                },
                itemCount: widget.image.length),
          ],
        ),
      ),
    );
  }
}
