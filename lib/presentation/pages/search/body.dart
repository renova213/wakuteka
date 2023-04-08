import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wakuteka/domain/domain.dart';

import '../../presentation.dart';
import 'components/exports.dart';

class Body extends StatefulWidget {
  final String input;
  const Body({super.key, required this.input});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<ProductEntity> products = [];
  @override
  void initState() {
    super.initState();

    Future.microtask(
      () async {
        products = await Provider.of<SearchProvider>(context, listen: false)
            .fetchProductByName(widget.input);
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchAppBar(productName: widget.input),
              SizedBox(height: 24.h),
              SearchProduct(products: products),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
    );
  }
}
