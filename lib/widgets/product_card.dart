import 'package:flutter/material.dart';
import '../models/cart.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final String? imageUrl;
  final Color? imageColor;
  final Color badgeColor;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.imageUrl,
    this.imageColor,
    this.badgeColor = Colors.red,
    this.onTap,
  });

  double _parsePrice(String priceLabel) {
    final numeric = priceLabel.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(numeric) ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final cart = CartScope.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: imageColor ?? Colors.blueGrey[100],
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  image: imageUrl != null
                      ? DecorationImage(
                          image: NetworkImage(imageUrl!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: Stack(
                  children: [
                    if (imageUrl == null)
                      Center(
                        child: Icon(Icons.sports_basketball, size: 48, color: Colors.blueGrey[400]),
                      ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: badgeColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'NEW',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: cs.primary),
                      ),
                      IconButton(
                        tooltip: 'Add to cart',
                        icon: const Icon(Icons.add_shopping_cart),
                        color: cs.primary,
                        onPressed: () {
                          cart.addItem(
                            id: title, // in real app use product id
                            title: title,
                            priceLabel: price,
                            price: _parsePrice(price),
                            quantity: 1,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Added to cart')),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
