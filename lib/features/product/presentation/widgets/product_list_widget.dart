import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/features/product/model/product.dart';
import 'package:test/features/product/presentation/widgets/product_thumbnail.dart';

import '../../../../theme/app_theme.dart';
import '../product_list_controller.dart';

class ProductListWidget extends HookConsumerWidget {
  final List<Product> products;
  const ProductListWidget(this.products, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(0);

    return SizedBox(
      height: 228 + Paddings.md,
      child: ListView.separated(
        padding: const EdgeInsets.all(Paddings.sm),
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, i) => GestureDetector(
          onTap: () {
            selectedIndex.value = i;
            ref.read(selectProductProvider.notifier).onChanged(products[i]);
          },
          child: ProductThumbnail(
            product: products[i],
            selected: selectedIndex.value == i,
          ),
        ),
        separatorBuilder: (_, __) => const SizedBox(width: Paddings.xs),
      ),
    );
  }
}
