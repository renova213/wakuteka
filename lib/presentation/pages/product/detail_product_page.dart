import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wakuteka/domain/entities/product_entity.dart';
import 'body.dart';

class DetailProductPage extends StatelessWidget {
  const DetailProductPage({super.key});

  static String routeName = "/detail-product";

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductEntity;

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset("assets/icons/Heart.svg")))
        ],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.keyboard_arrow_left)),
      ),
      body: Body(product: product),
    );
  }
}
