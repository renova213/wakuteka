import 'package:dartz/dartz.dart';
import 'package:wakuteka/domain/entities/product_entity.dart';

import '../../domain/repositories/product_repository.dart';
import '../data.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteProductDataSource remoteProductDataSource;

  ProductRepositoryImpl({required this.remoteProductDataSource});

  @override
  Future<Either<ServerException, List<ProductEntity>>> getProduct() async {
    try {
      final products = await remoteProductDataSource.getProduct();
      return Right(products);
    } on ServerException catch (e) {
      return Left(
          ServerException(statusCode: e.statusCode, message: e.message));
    }
  }

  @override
  Future<Either<ServerException, List<ProductEntity>>> getProductByCategoryName(
      String categoryName) async {
    try {
      final products =
          await remoteProductDataSource.getProductByCategoryName(categoryName);
      return Right(products);
    } on ServerException catch (e) {
      return Left(
          ServerException(statusCode: e.statusCode, message: e.message));
    }
  }

  @override
  Future<Either<ServerException, List<ProductEntity>>> getProductByProductName(
      String productName) async {
    try {
      final products =
          await remoteProductDataSource.getProductByProductName(productName);
      return Right(products);
    } on ServerException catch (e) {
      return Left(
          ServerException(statusCode: e.statusCode, message: e.message));
    }
  }
}
