


import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0), // 8px spacing
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 16), // 2 * 8px
                  padding: const EdgeInsets.all(16), // 2 * 8px
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16), // 2 * 8px
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8, // 8px spacing
                        offset: const Offset(0, 2), // 0.25 * 8px
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 80, // 10 * 8px
                        height: 80, // 10 * 8px
                        decoration: BoxDecoration(
                          color: Colors.primaries[index % Colors.primaries.length],
                          borderRadius: BorderRadius.circular(12), // 1.5 * 8px
                        ),
                        child: Center(
                          child: Text(
                            'Item ${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16), // 2 * 8px
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product ${index + 1}',
                              style: const TextStyle(
                                fontSize: 16, // 2 * 8px
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4), // 0.5 * 8px
                            Text(
                              '\${(index + 1) * 20}.99',
                              style: const TextStyle(
                                fontSize: 16, // 2 * 8px
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                            const SizedBox(height: 8), // 8px spacing
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(4), // 0.5 * 8px
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(4), // 0.5 * 8px
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 16, // 2 * 8px
                                  ),
                                ),
                                const SizedBox(width: 8), // 8px spacing
                                const Text('1'),
                                const SizedBox(width: 8), // 8px spacing
                                Container(
                                  padding: const EdgeInsets.all(4), // 0.5 * 8px
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(4), // 0.5 * 8px
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 16, // 2 * 8px
                                  ),
                                ),
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
          Container(
            padding: const EdgeInsets.all(16), // 2 * 8px
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8, // 8px spacing
                  offset: const Offset(0, -2), // -0.25 * 8px
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('Total:'),
                    Text(
                      '\$59.97',
                      style: TextStyle(
                        fontSize: 18, // 2.25 * 8px
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16), // 2 * 8px
                SizedBox(
                  width: double.infinity,
                  height: 50, // ~6.25 * 8px
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle checkout
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // 1.5 * 8px
                      ),
                    ),
                    child: const Text(
                      'Checkout',
                      style: TextStyle(
                        fontSize: 16, // 2 * 8px
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}