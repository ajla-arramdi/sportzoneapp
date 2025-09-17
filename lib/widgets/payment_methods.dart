


import 'package:flutter/material.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> paymentMethods = [
      {
        'name': 'Bank Transfer',
        'icon': Icons.account_balance,
        'color': Colors.blue,
      },
      {
        'name': 'Credit Card',
        'icon': Icons.credit_card,
        'color': Colors.red,
      },
      {
        'name': 'PayPal',
        'icon': Icons.payment,
        'color': Colors.blueAccent,
      },
      {
        'name': 'Cash on Delivery',
        'icon': Icons.local_atm,
        'color': Colors.green,
      },
    ];

    return Container(
      margin: const EdgeInsets.all(16), // 2 * 8px
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Methods',
            style: TextStyle(
              fontSize: 20, // 2.5 * 8px
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10), // ~1.25 * 8px
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16, // 2 * 8px
              mainAxisSpacing: 16, // 2 * 8px
              childAspectRatio: 2.5,
            ),
            itemCount: paymentMethods.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10), // 1.25 * 8px
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1), // ~0.125 * 8px
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      paymentMethods[index]['icon'],
                      color: paymentMethods[index]['color'],
                      size: 30, // ~3.75 * 8px
                    ),
                    const SizedBox(width: 10), // ~1.25 * 8px
                    Text(
                      paymentMethods[index]['name'],
                      style: const TextStyle(
                        fontSize: 14, // 1.75 * 8px
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}