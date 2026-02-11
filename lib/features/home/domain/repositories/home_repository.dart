import 'package:horizon_mobile/features/home/domain/models/product_model.dart';

abstract class HomeRepository {
  Future<List<ProductModel>> getProducts();
}
