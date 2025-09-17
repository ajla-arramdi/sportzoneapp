import 'package:flutter/material.dart';
import '../widgets/modern_app_bar.dart';

class ProductDetailScreen extends StatefulWidget {
  final String title;
  final String price;
  final Color imageColor;

  const ProductDetailScreen({super.key, required this.title, required this.price, required this.imageColor});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;
  String _selectedSize = 'M';

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: const ModernAppBar(title: 'Product Detail', showBackButton: true),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth >= 1100 ? 1000 : constraints.maxWidth;
          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Hero Image
                    Container(
                      height: 280,
                      margin: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: widget.imageColor,
                        boxShadow: [
                          BoxShadow(
                            color: widget.imageColor.withOpacity(0.4),
                            blurRadius: 24,
                            offset: const Offset(0, 12),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Icon(Icons.sports_basketball, size: 100, color: Colors.white),
                      ),
                    ),

                    // Content Card
                    Container(
                      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      decoration: BoxDecoration(
                        color: theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 12,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(widget.title, style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
                                      const SizedBox(height: 6),
                                      Row(
                                        children: [
                                          Icon(Icons.star, color: Colors.amber[600]),
                                          Icon(Icons.star, color: Colors.amber[600]),
                                          Icon(Icons.star, color: Colors.amber[600]),
                                          Icon(Icons.star_half, color: Colors.amber[600]),
                                          Icon(Icons.star_border, color: Colors.amber[600]),
                                          const SizedBox(width: 6),
                                          Text('3.5 (128 reviews)', style: theme.textTheme.bodySmall),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Text(widget.price, style: theme.textTheme.headlineSmall?.copyWith(color: cs.primary, fontWeight: FontWeight.w800)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text('Description', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: 6),
                            Text(
                              'High-performance gear designed for athletes. Breathable materials, superior comfort, and durable construction for everyday training.',
                              style: theme.textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 16),
                            Text('Select Size', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              children: sizes.map((s) {
                                final bool isSelected = s == _selectedSize;
                                return ChoiceChip(
                                  label: Text(s),
                                  selected: isSelected,
                                  onSelected: (_) => setState(() => _selectedSize = s),
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () => setState(() => _quantity = (_quantity - 1).clamp(1, 999)),
                                      icon: const Icon(Icons.remove_circle_outline),
                                    ),
                                    Text('$_quantity', style: theme.textTheme.titleLarge),
                                    IconButton(
                                      onPressed: () => setState(() => _quantity = _quantity + 1),
                                      icon: const Icon(Icons.add_circle_outline),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 46,
                                  child: FilledButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.shopping_bag_outlined),
                                    label: const Text('Add to cart'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
