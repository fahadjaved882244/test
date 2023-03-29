import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/features/product/data/product_repository.dart';
import 'package:test/features/product/model/product.dart';

final productListControllerProvider =
    AutoDisposeAsyncNotifierProvider<ProductListController, List<Product>>(() {
  return ProductListController();
});

class ProductListController extends AutoDisposeAsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    return ref.read(productRepoProvider).fetchProductList();
  }
}
