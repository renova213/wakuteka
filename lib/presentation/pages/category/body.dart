import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../presentation.dart';
import 'components/exports.dart';

class Body extends StatefulWidget {
  final String categoryName;
  const Body({super.key, required this.categoryName});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      Provider.of<ProductProvider>(context, listen: false)
          .fetchProductByCategoryName(widget.categoryName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryAppBar(categoryName: widget.categoryName),
            SizedBox(height: 12.h),
            const CategoryProduct()
          ],
        ),
      ),
    );
  }
}
