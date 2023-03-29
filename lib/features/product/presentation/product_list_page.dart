import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test/extensions/context_x.dart';
import 'package:test/theme/app_theme.dart';
import 'package:test/features/product/presentation/widgets/product_thumbnail.dart';
import 'package:test/features/product/presentation/product_list_controller.dart';

class ProductListPage extends HookConsumerWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productListControllerProvider);
    final selectedIndex = useState(0);
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
        data: (products) => SizedBox(
          height: 228 + Paddings.md,
          child: ListView.separated(
            padding: const EdgeInsets.all(Paddings.sm),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, i) => GestureDetector(
              onTap: () => selectedIndex.value = i,
              child: ProductThumbnail(
                product: products[i],
                selected: selectedIndex.value == i,
              ),
            ),
            separatorBuilder: (_, __) => const SizedBox(width: Paddings.xs),
          ),
        ),
      ),
    );
  }
}
