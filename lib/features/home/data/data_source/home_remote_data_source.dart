import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:horizon_mobile/features/home/domain/models/product_model.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

@Injectable(as: HomeRemoteDataSource)
class HomeFirestoreRemoteDataSource implements HomeRemoteDataSource {
  final FirebaseFirestore _firestore;

  HomeFirestoreRemoteDataSource(this._firestore);

  @override
  Future<List<ProductModel>> getProducts() async {
    final querySnapshot = await _firestore.collection('products').get();
    return querySnapshot.docs
        .map((doc) => ProductModel.fromFirestore(doc.data(), doc.id))
        .toList();
  }
}
