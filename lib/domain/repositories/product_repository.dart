import 'package:dartz/dartz.dart';

import '../../data/data.dart';
import '../domain.dart';

abstract class ProductRepository {
  Future<Either<ServerException, List<ProductEntity>>> getProduct();
  Future<Either<ServerException, List<ProductEntity>>> getProductByCategoryName(
      String categoryName);
  Future<Either<ServerException, List<ProductEntity>>> getProductByProductName(
      String productName);
}
