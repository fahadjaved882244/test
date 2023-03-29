import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/features/product/presentation/product_list_controller.dart';
import 'package:test/theme/app_theme.dart';

class ProductDetailWidegt extends ConsumerWidget {
  const ProductDetailWidegt({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final option = ref.watch(selectProductProvider);
    return Container(
      padding: const EdgeInsets.all(Paddings.sm),
      child: Center(
        child: option.fold(
          () => const Text('No product found'),
          (product) => Text(product.toString()),
        ),
      ),
    );
  }
}
