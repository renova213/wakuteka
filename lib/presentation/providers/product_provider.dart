import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

class ProductProvider extends ChangeNotifier {
  final GetProductUsecase getProductUsecase;

  ProductProvider({required this.getProductUsecase});

  final List<Map<String, dynamic>> _cardProductCategoryItems = [
    {"assetIcon": "assets/icons/dress.svg", "labelText": "Dress"},
    {"assetIcon": "assets/icons/shirt.svg", "labelText": "Shirt"},
    {"assetIcon": "assets/icons/pants.svg", "labelText": "Pants"},
    {"assetIcon": "assets/icons/Tshirt.svg", "labelText": "Tshirt"},
  ];
  AppState _appState = AppState.loading;
  List<ProductEntity> _products = [];
  List<ProductEntity> _productsByCategory = [];

  List<Map<String, dynamic>> get cardProductCategoryItems =>
      _cardProductCategoryItems;
  List<ProductEntity> get products => _products;
  List<ProductEntity> get productsByCategory => _productsByCategory;
  AppState get appState => _appState;

  //remote product
  Future<void> fetchProduct() async {
    changeAppState(AppState.loading);

    final exceptionOrProduct = await getProductUsecase.getProduct();

    exceptionOrProduct.fold(
      (exception) {
        changeAppState(AppState.failed);
      },
      (product) {
        _products = product;
        changeAppState(AppState.loaded);
      },
    );
  }

  Future<void> fetchProductByCategoryName(String categoryName) async {
    changeAppState(AppState.loading);

    final exceptionOrProduct =
        await getProductUsecase.getProductByCategoryName(categoryName);

    exceptionOrProduct.fold(
      (exception) {
        changeAppState(AppState.failed);
      },
      (product) {
        _productsByCategory = product;

        changeAppState(AppState.loaded);
      },
    );
  }

  Future<List<ProductEntity>> fetchAndReturnProductByCategoryName(
      String categoryName) async {
    List<ProductEntity> products = [];
    changeAppState(AppState.loading);

    final exceptionOrProduct =
        await getProductUsecase.getProductByCategoryName(categoryName);

    exceptionOrProduct.fold(
      (exception) {
        changeAppState(AppState.failed);
      },
      (product) {
        products = product;

        changeAppState(AppState.loaded);
      },
    );
    return products;
  }

  void changeAppState(AppState state) {
    _appState = state;
    notifyListeners();
  }
}
