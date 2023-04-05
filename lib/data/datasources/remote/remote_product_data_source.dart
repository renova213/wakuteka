import 'dart:convert';
import 'dart:io';

import '../../../configs/config.dart';
import '../../data.dart';

abstract class RemoteProductDataSource {
  Future<List<ProductModel>> getProduct();
  Future<List<ProductModel>> getProductByCategoryName(String categoryName);
}

class RemoteProductDataSourceImpl implements RemoteProductDataSource {
  final ApiConfig apiConfig;

  RemoteProductDataSourceImpl({required this.apiConfig});

  @override
  Future<List<ProductModel>> getProduct() async {
    final response = await apiConfig.get(path: "product", apiKey: '');

    try {
      if (response.statusCode == 200) {
        final List<ProductModel> products =
            (json.decode(response.body)['products'] as List)
                .map((e) => ProductModel.fromJson(e))
                .toList();
        return products;
      } else {
        throw ServerException(
            statusCode: response.statusCode,
            message: 'Failed to fetch data from server');
      }
    } on SocketException catch (e) {
      throw NetworkException('Failed to connect to server: ${e.message}');
    }
  }

  @override
  Future<List<ProductModel>> getProductByCategoryName(categoryName) async {
    final response = await apiConfig.get(
        path: "product/category${categoryName.toLowerCase()}", apiKey: '');
    try {
      if (response.statusCode == 200) {
        final List<ProductModel> products =
            (json.decode(response.body)['product'] as List)
                .map((e) => ProductModel.fromJson(e))
                .toList();
        return products;
      } else if (response.statusCode == 404) {
        return [];
      } else {
        throw ServerException(
            statusCode: response.statusCode,
            message: 'Failed to fetch data from server');
      }
    } on SocketException catch (e) {
      throw NetworkException('Failed to connect to server: ${e.message}');
    }
  }
}
