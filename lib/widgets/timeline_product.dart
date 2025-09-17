import 'package:flutter/material.dart';

class TimelineProduct extends StatelessWidget {
  const TimelineProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(8.0), // 8px spacing
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Featured Products',
            style: TextStyle(
              fontSize: 20, // 2.5 * 8px
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16), // 2 * 8px
          SizedBox(
            height: 250, // ~31 * 8px
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10, // Number of products
              itemBuilder: (context, index) {
                return Container(
                  width: 180, // 22.5 * 8px
                  margin: const EdgeInsets.only(right: 16), // 2 * 8px
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(12), // 1.5 * 8px
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8, // 8px spacing
                        offset: const Offset(0, 2), // 0.25 * 8px
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product image
                      Container(
                        height: 120, // 15 * 8px
                        decoration: BoxDecoration(
                          color: Colors.primaries[index % Colors.primaries.length],
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12), // 1.5 * 8px
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Product ${index + 1}',
                            style: const TextStyle(
                              fontSize: 16, // 2 * 8px
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Product details
                      Padding(
                        padding: const EdgeInsets.all(12.0), // 1.5 * 8px
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sports Product ${index + 1}',
                              style: const TextStyle(
                                fontSize: 16, // 2 * 8px
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4), // 0.5 * 8px
                            Text(
                              'High quality sports equipment for professionals',
                              style: TextStyle(
                                fontSize: 12, // 1.5 * 8px
                                color: Theme.of(context).brightness == Brightness.dark 
                                    ? Colors.grey[400] 
                                    : Colors.grey[600],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8), // 8px spacing
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\${(index + 1) * 10}.99',
                                  style: const TextStyle(
                                    fontSize: 16, // 2 * 8px
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8, // 8px spacing
                                    vertical: 4, // 0.5 * 8px
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green[100],
                                    borderRadius: BorderRadius.circular(8), // 8px spacing
                                  ),
                                  child: const Text(
                                    'In Stock',
                                    style: TextStyle(
                                      fontSize: 12, // 1.5 * 8px
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
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
        ],
      ),
    );
  }
}