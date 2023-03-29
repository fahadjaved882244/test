import 'package:flutter/material.dart';
import 'package:test/features/product/model/product.dart';
import 'package:test/theme/app_theme.dart';

class ProductThumbnail extends StatelessWidget {
  final Product product;
  final bool selected;

  const ProductThumbnail({
    super.key,
    required this.product,
    required this.selected,
  });
  @override
  Widget build(BuildContext context) {
    bool isAmber = product.name == "Amber member";
    final gemBgColor = isAmber ? AppColors.amberBg : AppColors.rubyBg;
    final gemFgColor = isAmber ? AppColors.amberFg : AppColors.rubyFg;
    final bgColor = selected ? gemBgColor : AppColors.lightGray;
    final fgColor = selected ? gemFgColor : AppColors.darkGray;

    return SizedBox(
      width: 230,
      height: 227.71,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: fgColor),
        ),
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: Paddings.md),
            _gemIcon(isAmber: isAmber, bgColor: bgColor, fgColor: fgColor),
            const SizedBox(height: Paddings.sm),
            _nameChip(context),
            const SizedBox(height: Paddings.sm),
            _price(),
          ],
        ),
      ),
    );
  }

  Container _gemIcon(
      {required bool isAmber, required Color bgColor, required Color fgColor}) {
    return Container(
      height: 58,
      width: 58,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        border: Border.all(color: fgColor),
      ),
      child: Icon(
        isAmber ? Icons.diamond : Icons.add_reaction,
        size: IconSizes.lg,
        color: fgColor,
      ),
    );
  }

  Container _nameChip(BuildContext context) {
    return Container(
      width: 182,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F4F7),
        borderRadius: BorderRadius.circular(29),
      ),
      child: Text(
        product.name,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Column _price() {
    final color = product.discountPrice != null
        ? const Color.fromRGBO(33, 37, 41, 0.7)
        : const Color(0xFF212529);

    return Column(
      children: [
        if (product.discountPrice == null) const SizedBox(height: 23),
        Stack(
          alignment: Alignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "${product.price}€",
                style: TextStyle(
                  color: color,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                children: [
                  TextSpan(
                    text: product.discountPrice != null ? '/month' : '/Month',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            if (product.discountPrice != null)
              Container(
                height: 3,
                width: 96.67,
                transform: Matrix4.identity()..rotateZ(-0.1463),
                transformAlignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFD6161),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
          ],
        ),
        const SizedBox(height: 4),
        if (product.discountPrice != null)
          Text(
            "${product.discountPrice}€/Month",
            style: const TextStyle(
              color: Color(0xFF212529),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
      ],
    );
  }
}
