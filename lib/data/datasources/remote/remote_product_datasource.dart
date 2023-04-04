import 'dart:convert';

import '../../../configs/config.dart';
import '../../data.dart';

abstract class RemoteProductDataSource {
  Future<List<ProductModel>> getProduct();
}

class RemoteProductDataSourceImpl implements RemoteProductDataSource {
  @override
  Future<List<ProductModel>> getProduct() async {
    final response = await ApiConfig().get(path: "product", apiKey: '');

    if (response.statusCode == 200) {
      final List<ProductModel> products =
          (json.decode(response.body)['products'] as List)
              .map((e) => ProductModel.fromJson(e))
              .toList();
      return products;
    } else {
      throw Exception("Server Error");
    }
  }
}
