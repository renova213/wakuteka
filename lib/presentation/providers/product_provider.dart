import 'package:flutter/material.dart';
import 'package:wakuteka/domain/entities/product_entity.dart';

class ProductProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cardProductCategoryItems = [
    {"assetIcon": "assets/icons/dress.svg", "labelText": "Dress"},
    {"assetIcon": "assets/icons/shirt.svg", "labelText": "Shirt"},
    {"assetIcon": "assets/icons/pants.svg", "labelText": "Pants"},
    {"assetIcon": "assets/icons/Tshirt.svg", "labelText": "Tshirt"},
  ];

  final List<ProductEntity> _productHightlighter = [
    ProductEntity(
      uniqueKey: UniqueKey(),
      description: '''kemeja lengan pendek hem
bahan kaos
merk boss
.
warna sesuai foto
keterangan size ada di foto
..
stok yg ready bisa dicek saat tbh ke keranjang,
bisa diklik=ready,
tdk bisa=kosong.''',
      image: const [
        "assets/images/product_0.png",
        "assets/images/product_1.png"
      ],
      price: 120000,
      title: "Long Sleeve Shirts",
      variantProduct: const [
        ProductVariantEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Putih",
            titleVariant2: "S",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 120000),
        ProductVariantEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Putih",
            titleVariant2: "M",
            stock: 0,
            image: "assets/images/product_0.png",
            price: 120000),
        ProductVariantEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Putih",
            titleVariant2: "L",
            stock: 0,
            image: "assets/images/product_0.png",
            price: 123000),
        ProductVariantEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Putih",
            titleVariant2: "XL",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
        ProductVariantEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Hitam",
            titleVariant2: "S",
            stock: 10,
            image: "assets/images/product_1.png",
            price: 120000),
        ProductVariantEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Hitam",
            titleVariant2: "M",
            stock: 10,
            image: "assets/images/product_1.png",
            price: 120000),
        ProductVariantEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Hitam",
            titleVariant2: "L",
            stock: 10,
            image: "assets/images/product_1.png",
            price: 123000),
        ProductVariantEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Hitam",
            titleVariant2: "XL",
            stock: 0,
            image: "assets/images/product_1.png",
            price: 125000),
      ],
    ),
    ProductEntity(
      uniqueKey: UniqueKey(),
      description: '''kemeja lengan pendek hem
bahan kaos
merk boss
.
warna sesuai foto
keterangan size ada di foto
..
stok yg ready bisa dicek saat tbh ke keranjang,
bisa diklik=ready,
tdk bisa=kosong.''',
      image: const [
        "assets/images/product_2.png",
        "assets/images/product_3.png"
      ],
      price: 120000,
      title: "Short Sleeve Shirts",
      variantProduct: const [
        ProductVariantEntity(
            variantName: "Warna",
            variantName2: "",
            titleVariant: "Putih",
            titleVariant2: "",
            stock: 10,
            image: "assets/images/product_2.png",
            price: 120000),
        ProductVariantEntity(
            variantName: "Warna",
            variantName2: "",
            titleVariant: "Hitam",
            titleVariant2: "",
            stock: 0,
            image: "assets/images/product_3.png",
            price: 125000),
      ],
    ),
  ];
  List<Map<String, dynamic>> _filterVariantProduct = [];
  int _indexVariantCard = 0;
  int _indexVariantCard2 = 0;
  String _variantName = "";
  String _variantName2 = "";
  Map<String, dynamic> _selectedProduct = {};

  List<Map<String, dynamic>> get cardProductCategoryItems =>
      _cardProductCategoryItems;
  List<ProductEntity> get productHightlighter => _productHightlighter;
  List<Map<String, dynamic>> get filterVariantProduct => _filterVariantProduct;
  Map<String, dynamic> get selectedProduct => _selectedProduct;
  int get indexVariantCard => _indexVariantCard;
  int get indexVariantCard2 => _indexVariantCard2;
  String get variantName => _variantName;
  String get variantName2 => _variantName2;

  //Filter varian produk
  Future<void> extractVariantName(
      List<ProductVariantEntity> variantProducts) async {
    _variantName = "";
    _variantName2 = "";
    List<String> variantName = [];
    List<String> variantName2 = [];

    for (var i in variantProducts) {
      if (!variantName.contains(i.variantName)) {
        variantName.add(i.variantName);
      }
      if (i.variantName2.isNotEmpty) {
        if (!variantName2.contains(i.variantName2)) {
          variantName2.add(i.variantName2);
        }
      }
    }

    _variantName = variantName.first;

    if (variantName2.isNotEmpty) {
      _variantName2 = variantName2.first;
    }
    notifyListeners();
  }

  Future<void> extractTitleVariantName(
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
        "variantName": _variantName,
        "titleVariant": filterTitleVariant[i],
        "items": []
      };
      final contain = _filterVariantProduct
          .where((e) =>
              e["variantName"] == _variantName &&
              e["titleVariant"] == filterTitleVariant[i])
          .toList();

      if (contain.isEmpty) {
        _filterVariantProduct.add(filterData);
      }
    }

    notifyListeners();
  }

  Future<void> extractVariant(
      List<ProductVariantEntity> variantProducts) async {
    for (var i = 0; i < _filterVariantProduct.length; i++) {
      for (var j = 0; j < variantProducts.length; j++) {
        if (_filterVariantProduct[i]["titleVariant"] ==
                variantProducts[j].titleVariant &&
            _filterVariantProduct[i]["variantName"] ==
                variantProducts[j].variantName) {
          if (variantProducts[j].titleVariant2.isNotEmpty) {
            final contain = (_filterVariantProduct[i]["items"] as List)
                .where((e) =>
                    e["titleVariantItem"] == variantProducts[j].titleVariant2)
                .toList();
            if (contain.isEmpty) {
              _filterVariantProduct[i]["items"].add({
                "titleVariantItem": variantProducts[j].titleVariant2,
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
    if (_variantName2.isNotEmpty) {
      selectedVariantMap["titleVariant"] =
          _filterVariantProduct[_indexVariantCard]["titleVariant"];
      selectedVariantMap["titleVariant2"] =
          _filterVariantProduct[_indexVariantCard]["items"][_indexVariantCard2]
              ["titleVariantItem"];
      selectedVariantMap["stock"] = _filterVariantProduct[_indexVariantCard]
          ["items"][_indexVariantCard2]["stock"];
      selectedVariantMap["image"] = _filterVariantProduct[_indexVariantCard]
          ["items"][_indexVariantCard2]["image"];
      selectedVariantMap["price"] = _filterVariantProduct[_indexVariantCard]
          ["items"][_indexVariantCard2]["price"];
    }

    if (_variantName2.isEmpty) {
      selectedVariantMap["titleVariant2"] = "";
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
