import 'package:horizon_mobile/features/home/data/data_source/home_remote_data_source.dart';
import 'package:horizon_mobile/features/home/domain/models/product_model.dart';
import 'package:horizon_mobile/features/home/domain/repositories/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<ProductModel>> getProducts() async {
    return _remoteDataSource.getProducts();
  }
}
