
import 'package:flutter/material.dart';
import '../widgets/top_search_bar.dart';
import '../widgets/image_slider.dart';
import '../widgets/timeline_product.dart';
import '../widgets/payment_methods.dart';
import '../widgets/clean_card_layout.dart';

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
      appBar: AppBar(
        title: const Text('Sport Station Zone'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            children: const [
              // 8px spacing
              SizedBox(height: 8),
              TopSearchBar(),
              // 8px spacing
              SizedBox(height: 8),
              ImageSlider(),
              // 8px spacing
              SizedBox(height: 8),
              TimelineProduct(),
              // 8px spacing
              SizedBox(height: 8),
              PaymentMethods(),
              // 8px spacing
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}