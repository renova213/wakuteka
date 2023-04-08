import 'package:get_it/get_it.dart';

import 'configs/api_config.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';

final sl = GetIt.instance;

void setUp() {
  //datasource
  sl.registerLazySingleton<RemoteProductDataSource>(
      () => RemoteProductDataSourceImpl(apiConfig: ApiConfig()));

  //repository
  sl.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(remoteProductDataSource: sl()));

  //usecase
  sl.registerLazySingleton<GetProductUsecase>(
      () => GetProductUsecase(productRepository: sl()));

  //provider
  sl.registerFactory<ProductProvider>(
      () => ProductProvider(getProductUsecase: sl()));
  sl.registerFactory<SearchProvider>(
      () => SearchProvider(getProductUsecase: sl()));
}
