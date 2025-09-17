


import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../widgets/modern_app_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartScope.of(context);
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      appBar: const ModernAppBar(title: 'Your Cart', showBackButton: false),
      body: cart.items.isEmpty
          ? _EmptyState()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) {
                      final item = cart.items[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: theme.cardColor,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                color: cs.primary.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(Icons.sports_basketball, color: cs.primary),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(item.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                                      ),
                                      IconButton(
                                        tooltip: 'Remove',
                                        onPressed: () => cart.removeItem(id: item.id, size: item.size),
                                        icon: const Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                  if (item.size != null)
                                    Text('Size: ${item.size}', style: theme.textTheme.bodySmall),
                                  const SizedBox(height: 6),
                                  Text(item.priceLabel, style: theme.textTheme.titleMedium?.copyWith(color: cs.primary, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      _qtyBtn(context, icon: Icons.remove, onTap: () => cart.updateQuantity(id: item.id, size: item.size, delta: -1)),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 12),
                                        child: Text('${item.quantity}', style: theme.textTheme.titleMedium),
                                      ),
                                      _qtyBtn(context, icon: Icons.add, onTap: () => cart.updateQuantity(id: item.id, size: item.size, delta: 1)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                _SummaryBar(total: cart.totalAmount, onCheckout: () {}),
              ],
            ),
    );
  }

  Widget _qtyBtn(BuildContext context, {required IconData icon, required VoidCallback onTap}) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: onTap,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: cs.primary.withOpacity(0.2)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(icon, size: 18, color: cs.primary),
        ),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.shopping_bag_outlined, size: 72, color: cs.primary),
            const SizedBox(height: 12),
            Text('Your cart is empty', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 6),
            Text('Browse products and add your favorite items.', style: theme.textTheme.bodyMedium, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Start shopping'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryBar extends StatelessWidget {
  final double total;
  final VoidCallback onCheckout;

  const _SummaryBar({required this.total, required this.onCheckout});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: theme.textTheme.titleMedium),
              Text(
                _formatCurrency(total),
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: onCheckout,
              icon: const Icon(Icons.lock_outline),
              label: const Text('Checkout Securely'),
            ),
          ),
        ],
      ),
    );
  }

  String _formatCurrency(double amount) {
    return '\$' + amount.toStringAsFixed(2);
  }
}