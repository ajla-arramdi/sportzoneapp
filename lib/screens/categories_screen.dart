import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0), // 8px spacing
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16, // 2 * 8px
          mainAxisSpacing: 16, // 2 * 8px
          childAspectRatio: 0.85,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80, // 10 * 8px
                  height: 80, // 10 * 8px
                  decoration: BoxDecoration(
                    color: Colors.primaries[index % Colors.primaries.length],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.category,
                      color: Colors.white,
                      size: 40, // 5 * 8px
                    ),
                  ),
                ),
                const SizedBox(height: 16), // 2 * 8px
                Text(
                  'Category ${index + 1}',
                  style: const TextStyle(
                    fontSize: 16, // 2 * 8px
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}