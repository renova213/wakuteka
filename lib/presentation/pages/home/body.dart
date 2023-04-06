import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../presentation.dart';
import 'components/exports.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<ProductProvider>(context, listen: false).fetchProduct();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<VisibilityProvider>(
        builder: (context, visibility, _) =>
            NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            final pixels = notification.metrics.pixels;

            // Change the visibility state based on the scroll position.
            if (pixels > 100 && !visibility.isVisible) {
              visibility.isVisible = true;
            } else if (pixels <= 100 && visibility.isVisible) {
              visibility.isVisible = false;
            }
            return true;
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeAppBar(),
                SizedBox(height: 12.h),
                const Categories(),
                SizedBox(height: 20.h),
                const ProductHighlighter(title: "New Arrival"),
                SizedBox(height: 24.h),
                BannerProduct(
                    bennerName: "Wear your personality",
                    urlImage: "https://i.ibb.co/mJh5VX2/photo-image.png",
                    color: const Color(0xFF00d1ff),
                    onTap: () {}),
                SizedBox(height: 24.h),
                const ProductHighlighter(title: "Recommended"),
                SizedBox(height: 24.h),
                BannerProduct(
                    bennerName: "Find your perfect fit",
                    urlImage: "https://i.ibb.co/Q98JXzS/8228028406-6-20-1.png",
                    color: const Color(0xFF3d6cb9),
                    onTap: () {}),
                SizedBox(height: 20.h),
                const ProductHighlighter(title: "Best Seller"),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
