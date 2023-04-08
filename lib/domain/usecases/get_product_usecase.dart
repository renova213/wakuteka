import 'package:dartz/dartz.dart';
import 'package:wakuteka/data/data.dart';

import '../domain.dart';

class GetProductUsecase {
  final ProductRepository productRepository;

  GetProductUsecase({required this.productRepository});

  Future<Either<ServerException, List<ProductEntity>>> getProduct() async {
    final products = await productRepository.getProduct();
    return products;
  }

  Future<Either<ServerException, List<ProductEntity>>> getProductByCategoryName(
      String categoryName) async {
    final products =
        await productRepository.getProductByCategoryName(categoryName);
    return products;
  }

  Future<Either<ServerException, List<ProductEntity>>> getProductByProductName(
      String productName) async {
    final products =
        await productRepository.getProductByProductName(productName);
    return products;
  }
}
