import '../model/product.dart';

abstract class IProductRepository {
  Future<List<Product>> fetchProductList();
}
