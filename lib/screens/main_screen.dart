import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'categories_screen.dart';
import 'cart_screen.dart';
import 'profile_screen.dart';
import '../models/cart.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cart = CartScope.of(context);

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        elevation: 10,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          _buildDestination(
            context,
            icon: Icons.home_outlined,
            selectedIcon: Icons.home,
            label: 'Home',
            isSelected: _currentIndex == 0,
          ),
          _buildDestination(
            context,
            icon: Icons.category_outlined,
            selectedIcon: Icons.category,
            label: 'Categories',
            isSelected: _currentIndex == 1,
          ),
          _buildDestination(
            context,
            icon: Icons.shopping_cart_outlined,
            selectedIcon: Icons.shopping_cart,
            label: 'Cart',
            isSelected: _currentIndex == 2,
            badge: cart.totalItems > 0 ? cart.totalItems : null,
          ),
          _buildDestination(
            context,
            icon: Icons.person_outline,
            selectedIcon: Icons.person,
            label: 'Profile',
            isSelected: _currentIndex == 3,
          ),
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        indicatorColor: colorScheme.primary.withOpacity(0.12),
      ),
    );
  }

  NavigationDestination _buildDestination(
    BuildContext context, {
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required bool isSelected,
    int? badge,
  }) {
    final cs = Theme.of(context).colorScheme;

    Widget iconWidget = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isSelected ? cs.primary.withOpacity(0.12) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        isSelected ? selectedIcon : icon,
        color: isSelected ? cs.primary : cs.onSurfaceVariant,
      ),
    );

    if (badge != null) {
      iconWidget = Stack(
        clipBehavior: Clip.none,
        children: [
          iconWidget,
          Positioned(
            right: -2,
            top: -2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: cs.primary,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(
                '$badge',
                style: const TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      );
    }

    return NavigationDestination(
      icon: iconWidget,
      selectedIcon: iconWidget,
      label: label,
    );
  }
}