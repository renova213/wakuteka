import 'package:flutter/material.dart';
import 'package:wakuteka/domain/entities/product_entity.dart';

class ProductProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _cardProductCategoryItems = [
    {"assetIcon": "assets/icons/dress.svg", "labelText": "Dress"},
    {"assetIcon": "assets/icons/shirt.svg", "labelText": "Shirt"},
    {"assetIcon": "assets/icons/pants.svg", "labelText": "Pants"},
    {"assetIcon": "assets/icons/Tshirt.svg", "labelText": "Tshirt"},
  ];

  final List<ProductEntity> _newArrivalProduct = [
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
      price: 125000,
      title: "Long Sleeve Shirts",
      variantProduct: const [
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Merah",
            titleVariant2: "S",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Merah",
            titleVariant2: "L",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Putih",
            titleVariant2: "S",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Putih",
            titleVariant2: "L",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
      ],
    ),
  ];

  final List<ProductEntity> _popularProduct = [
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
      price: 125000,
      title: "Long Sleeve Shirts",
      variantProduct: const [
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Merah",
            titleVariant2: "S",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Merah",
            titleVariant2: "L",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Putih",
            titleVariant2: "S",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Putih",
            titleVariant2: "L",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "Ukuran",
            titleVariant: "Putih",
            titleVariant2: "XL",
            stock: 10,
            image: "assets/images/product_0.png",
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
        "assets/images/product_3.png",
        "assets/images/product_1.png"
      ],
      price: 125000,
      title: "Long Sleeve Shirts",
      variantProduct: const [
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "",
            titleVariant: "Merah",
            titleVariant2: "",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "",
            titleVariant: "Hijau",
            titleVariant2: "",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
        VariantProductEntity(
            variantName: "Warna",
            variantName2: "",
            titleVariant: "Hijau",
            titleVariant2: "",
            stock: 10,
            image: "assets/images/product_0.png",
            price: 125000),
      ],
    ),
  ];
  List<Map<String, dynamic>> _filterVariantProduct = [];
  String _variantName = "";
  String _variantName2 = "";

  List<Map<String, dynamic>> get cardProductCategoryItems =>
      _cardProductCategoryItems;
  List<ProductEntity> get newArrivalProduct => _newArrivalProduct;
  List<ProductEntity> get popularProduct => _popularProduct;
  List<Map<String, dynamic>> get filterVariantProduct => _filterVariantProduct;
  String get variantName => _variantName;
  String get variantName2 => _variantName2;

  Future<void> extractVariantName(
      List<VariantProductEntity> variantProducts) async {
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
      List<VariantProductEntity> variantProducts) async {
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
      List<VariantProductEntity> variantProducts) async {
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
}
