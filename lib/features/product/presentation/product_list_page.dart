import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/extensions/context_x.dart';
import 'package:test/features/product/presentation/widgets/product_detail_widget.dart';
import 'package:test/features/product/presentation/widgets/product_list_widget.dart';
import 'package:test/features/product/presentation/product_list_controller.dart';

class ProductListPage extends ConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productListControllerProvider);
    return Scaffold(
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text(
            error.toString(),
            style: context.textTheme.labelLarge!
                .copyWith(color: context.colors.error),
          ),
        ),
        data: (products) {
          return Column(
            children: [
              ProductListWidget(products),
              const ProductDetailWidegt(),
            ],
          );
        },
      ),
    );
  }
}
