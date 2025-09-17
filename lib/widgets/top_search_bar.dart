import 'package:flutter/material.dart';

class TopSearchBar extends StatelessWidget {
  const TopSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.all(8.0), // 8px spacing
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark 
            ? Colors.grey[800] 
            : Colors.grey[200],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search products...',
          hintStyle: TextStyle(
            color: Theme.of(context).brightness == Brightness.dark 
                ? Colors.grey[400] 
                : Colors.grey[600],
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Theme.of(context).brightness == Brightness.dark 
                ? Colors.grey[400] 
                : Colors.grey[600],
          ),
          suffixIcon: Icon(
            Icons.filter_list,
            color: Theme.of(context).brightness == Brightness.dark 
                ? Colors.grey[400] 
                : Colors.grey[600],
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16.0, // 2 * 8px
            vertical: 12.0, // 1.5 * 8px
          ),
        ),
        onSubmitted: (value) {
          // Handle search submission
          // This would typically navigate to a search results page
        },
      ),
    );
  }
}