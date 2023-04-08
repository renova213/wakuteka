import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

class SearchProvider extends ChangeNotifier {
  final GetProductUsecase getProductUsecase;

  SearchProvider({required this.getProductUsecase});

  final TextEditingController _searchController = TextEditingController();
  AppState _appState = AppState.loading;

  TextEditingController get searchController => _searchController;
  AppState get appState => _appState;

  Future<List<ProductEntity>> fetchProductByName(String productName) async {
    changeAppState(AppState.loading);

    List<ProductEntity> products = [];

    final exceptionOrProduct =
        await getProductUsecase.getProductByProductName(productName);

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
