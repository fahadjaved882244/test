import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/features/product/data/i_product_repository.dart';
import 'package:test/features/product/model/product.dart';
import 'package:test/storage/i_storage.dart';

import '../../../storage/fake_storage.dart';

final productRepoProvider = Provider.autoDispose<IProductRepository>((ref) {
  final storage = ref.watch(fakeStorageProvider);
  return ProductRepository(storage);
});

class ProductRepository implements IProductRepository {
  ProductRepository(this._storage);
  final IStorage _storage;

  @override
  Future<List<Product>> fetchProductList() async {
    final json = await _storage.queryProductList();
    final products = json["products"];
    if (products != null && products is List<Map<String, dynamic>>) {
      return products.map((p) => Product.fromMap(p)).toList();
    }
    return [];
  }
}
