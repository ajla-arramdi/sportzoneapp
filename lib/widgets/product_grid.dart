import 'package:flutter/material.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        int crossAxisCount = 2;
        if (width >= 1200) crossAxisCount = 5;
        else if (width >= 900) crossAxisCount = 4;
        else if (width >= 600) crossAxisCount = 3;

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ProductCard(
              title: 'Sport Item ${index + 1}',
              subtitle: 'High-performance gear',
              price: '\$${(index + 1) * 12}.99',
            );
          },
        );
      },
    );
  }
}
