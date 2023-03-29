import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'i_storage.dart';

final fakeStorageProvider = Provider<IStorage>((ref) {
  return FakeStorage();
});

class FakeStorage implements IStorage {
  @override
  Future<Map<String, dynamic>> queryProductList() async {
    await Future.delayed(const Duration(seconds: 2));
    return {
      "products": [
        {"id": 1, "product": "Amber member", "price": 9.0},
        {"id": 2, "product": "Ruby member", "price": 70, "discount_price": 17}
      ]
    };
  }
}
