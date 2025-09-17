
import 'package:flutter/material.dart';
import '../widgets/top_search_bar.dart';
import '../widgets/modern_app_bar.dart';
import '../widgets/hero_banner.dart';
import '../widgets/category_chips.dart';
import '../widgets/product_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ModernAppBar(title: 'Sport Station Zone'),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth >= 1200
              ? 1100
              : (constraints.maxWidth >= 900 ? 860 : constraints.maxWidth);
          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: SingleChildScrollView(
                child: FadeTransition(
                  opacity: _animation,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      SizedBox(height: 12),
                      TopSearchBar(),
                      SizedBox(height: 8),
                      HeroBanner(),
                      SizedBox(height: 8),
                      CategoryChips(categories: ['All', 'Shoes', 'Apparel', 'Accessories', 'Football', 'Basketball', 'Running']),
                      SizedBox(height: 8),
                      ProductGrid(),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}