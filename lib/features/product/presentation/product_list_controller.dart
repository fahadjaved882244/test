import 'dart:async';

import 'package:fpdart/fpdart.dart';
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

final selectProductProvider =
    AutoDisposeNotifierProvider<SelectProductNotifier, Option<Product>>(() {
  return SelectProductNotifier();
});

class SelectProductNotifier extends AutoDisposeNotifier<Option<Product>> {
  @override
  Option<Product> build() {
    final list = ref.watch(productListControllerProvider).asData?.value;
    return Option.fromNullable(list)
        .flatMapNullable((t) => t.isNotEmpty ? t[0] : null);
  }

  void onChanged(Product product) {
    state = Option.of(product);
  }
}
