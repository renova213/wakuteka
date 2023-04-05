import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class FilterVariantProductProvider extends ChangeNotifier {
  List<Map<String, dynamic>> get filterVariantProduct => _filterVariantProduct;
  Map<String, dynamic> get selectedProduct => _selectedProduct;
  int get indexVariantCard => _indexVariantCard;
  int get indexVariantCard2 => _indexVariantCard2;
  String get variant => _variant;
  String get subVariant => _subVariant;

  List<Map<String, dynamic>> _filterVariantProduct = [];
  int _indexVariantCard = 0;
  int _indexVariantCard2 = 0;
  String _variant = "";
  String _subVariant = "";
  Map<String, dynamic> _selectedProduct = {};

  //Filter varian produk
  Future<void> extractVariant(
      List<ProductVariantEntity> variantProducts) async {
    _variant = "";
    _subVariant = "";
    List<String> variant = [];
    List<String> subVariant = [];

    for (var i in variantProducts) {
      if (!variant.contains(i.variant)) {
        variant.add(i.variant);
      }
      if (i.subVariant.isNotEmpty) {
        if (!subVariant.contains(i.subVariant)) {
          subVariant.add(i.subVariant);
        }
      }
    }

    _variant = variant.first;

    if (subVariant.isNotEmpty) {
      _subVariant = subVariant.first;
    }
    notifyListeners();
  }

  Future<void> extractTitlevariant(
      List<ProductVariantEntity> variantProducts) async {
    _filterVariantProduct = [];
    List<String> filterTitleVariant = [];

    for (var i in variantProducts) {
      final contain =
          filterTitleVariant.where((e) => e == i.titleVariant).toList();
      if (contain.isEmpty) {
        filterTitleVariant.add(i.titleVariant);
      }
    }

    for (var i = 0; i < filterTitleVariant.length; i++) {
      Map<String, dynamic> filterData = {
        "variant": _variant,
        "titleVariant": filterTitleVariant[i],
        "items": []
      };
      final contain = _filterVariantProduct
          .where((e) =>
              e["variant"] == _variant &&
              e["titleVariant"] == filterTitleVariant[i])
          .toList();

      if (contain.isEmpty) {
        _filterVariantProduct.add(filterData);
      }
    }

    notifyListeners();
  }

  Future<void> extractVariantItem(
      List<ProductVariantEntity> variantProducts) async {
    for (var i = 0; i < _filterVariantProduct.length; i++) {
      for (var j = 0; j < variantProducts.length; j++) {
        if (_filterVariantProduct[i]["titleVariant"] ==
                variantProducts[j].titleVariant &&
            _filterVariantProduct[i]["variant"] == variantProducts[j].variant) {
          if (variantProducts[j].subTitleVariant.isNotEmpty) {
            final contain = (_filterVariantProduct[i]["items"] as List)
                .where((e) =>
                    e["titleVariantItem"] == variantProducts[j].subTitleVariant)
                .toList();
            if (contain.isEmpty) {
              _filterVariantProduct[i]["items"].add({
                "titleVariantItem": variantProducts[j].subTitleVariant,
                "stock": variantProducts[j].stock,
                "image": variantProducts[j].image,
                "price": variantProducts[j].price
              });
            }
          } else {
            final contain = (_filterVariantProduct[i]["items"] as List)
                .where((e) =>
                    e["titleVariantItem"] == variantProducts[j].titleVariant)
                .toList();
            if (contain.isEmpty) {
              _filterVariantProduct[i]["items"].add({
                "titleVariantItem": j,
                "stock": variantProducts[j].stock,
                "image": variantProducts[j].image,
                "price": variantProducts[j].price
              });
            }
          }
        }
      }
    }
    notifyListeners();
  }

  Future<void> changeIndexVariantCard(int index) async {
    _indexVariantCard = index;
    selectedVariantProduct();
    notifyListeners();
  }

  void changeIndexVariantCard2(int index) {
    _indexVariantCard2 = index;
    selectedVariantProduct();
    notifyListeners();
  }

  void selectedVariantProduct() {
    final Map<String, dynamic> selectedVariantMap = {};
    if (_subVariant.isNotEmpty) {
      selectedVariantMap["titleVariant"] =
          _filterVariantProduct[_indexVariantCard]["titleVariant"];
      selectedVariantMap["subTitleVariant"] =
          _filterVariantProduct[_indexVariantCard]["items"][_indexVariantCard2]
              ["titleVariantItem"];
      selectedVariantMap["stock"] = _filterVariantProduct[_indexVariantCard]
          ["items"][_indexVariantCard2]["stock"];
      selectedVariantMap["image"] = _filterVariantProduct[_indexVariantCard]
          ["items"][_indexVariantCard2]["image"];
      selectedVariantMap["price"] = _filterVariantProduct[_indexVariantCard]
          ["items"][_indexVariantCard2]["price"];
    }

    if (_subVariant.isEmpty) {
      selectedVariantMap["subTitleVariant"] = "";
      selectedVariantMap["titleVariant"] =
          _filterVariantProduct[_indexVariantCard]["titleVariant"];
      selectedVariantMap["stock"] =
          _filterVariantProduct[_indexVariantCard]["items"][0]["stock"];
      selectedVariantMap["image"] =
          _filterVariantProduct[_indexVariantCard]["items"][0]["image"];
      selectedVariantMap["price"] =
          _filterVariantProduct[_indexVariantCard]["items"][0]["price"];
    }
    _selectedProduct = selectedVariantMap;
  }
}
