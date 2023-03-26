import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cardProductCategoryItems = [
    {"assetIcon": "assets/icons/dress.svg", "labelText": "Dress"},
    {"assetIcon": "assets/icons/shirt.svg", "labelText": "Shirt"},
    {"assetIcon": "assets/icons/pants.svg", "labelText": "Pants"},
    {"assetIcon": "assets/icons/Tshirt.svg", "labelText": "Tshirt"},
  ];

  final List<Map<String, dynamic>> _demoProduct = [
    {
      "image": "assets/images/product_0.png",
      "title": "Long Sleeve Shirts",
      "price": 150000
    },
    {
      "image": "assets/images/product_1.png",
      "title": "Casual Henley Shirts",
      "price": 99000
    },
    {
      "image": "assets/images/product_2.png",
      "title": "Curved Hem Shirts",
      "price": 75000
    },
    {
      "image": "assets/images/product_3.png",
      "title": "Something Shirts",
      "price": 130000
    },
  ];

  List<Map<String, dynamic>> get cardProductCategoryItems =>
      _cardProductCategoryItems;
  List<Map<String, dynamic>> get demoProduct => _demoProduct;
}
