


import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    final List<Map<String, dynamic>> paymentMethods = [
      {
        'name': 'Cards',
        'sub': 'Visa, MasterCard',
        'icon': Icons.credit_card,
        'color': cs.primary,
      },
      {
        'name': 'Bank Transfer',
        'sub': 'Virtual Account',
        'icon': Icons.account_balance,
        'color': cs.secondary,
      },
      {
        'name': 'E-Wallets',
        'sub': 'Popular wallets',
        'icon': Icons.account_balance_wallet,
        'color': cs.tertiary,
      },
      {
        'name': 'PayPal',
        'sub': 'International',
        'icon': Icons.payment,
        'color': cs.primaryContainer,
      },
      {
        'name': 'Cash on Delivery',
        'sub': 'Pay at door',
        'icon': Icons.local_shipping,
        'color': cs.secondaryContainer,
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Payment Methods',
                style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Manage'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          LayoutBuilder(
            builder: (context, constraints) {
              final double width = constraints.maxWidth;
              final double maxExtent = width < 400 ? width : 360;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: maxExtent,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 3.4,
                ),
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = paymentMethods[index];
                  return _MethodTile(
                    name: method['name'] as String,
                    sub: method['sub'] as String,
                    icon: method['icon'] as IconData,
                    color: method['color'] as Color,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class _MethodTile extends StatelessWidget {
  final String name;
  final String sub;
  final IconData icon;
  final Color color;

  const _MethodTile({
    required this.name,
    required this.sub,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {},
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: theme.cardColor,
          border: Border.all(color: cs.primary.withOpacity(0.12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [color.withOpacity(0.9), color.withOpacity(0.6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      sub,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.textTheme.bodySmall?.color?.withOpacity(0.8)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(Icons.chevron_right, color: cs.primary.withOpacity(0.6)),
            ],
          ),
        ),
      ),
    );
  }
}
