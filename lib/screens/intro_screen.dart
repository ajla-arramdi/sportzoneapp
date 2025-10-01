import 'package:flutter/material.dart';
import '../widgets/app_theme.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _page = 0;

  void _next() {
    if (_page < 2) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _page = i),
                children: const [
                  _IntroSlide(
                    icon: Icons.sports_basketball,
                    title: 'Curated Products',
                    desc: 'Find top-tier gear for every sport.',
                  ),
                  _IntroSlide(
                    icon: Icons.local_shipping_outlined,
                    title: 'Fast Delivery',
                    desc: 'Get your items quickly and reliably.',
                  ),
                  _IntroSlide(
                    icon: Icons.lock_outline,
                    title: 'Secure Checkout',
                    desc: 'Your payments are encrypted and safe.',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(3, (i) {
                      final selected = _page == i;
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: selected ? 16 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: selected ? theme.colorScheme.primary : theme.colorScheme.primary.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(999),
                        ),
                      );
                    }),
                  ),
                  ElevatedButton.icon(
                    onPressed: _next,
                    icon: Icon(_page < 2 ? Icons.arrow_forward : Icons.check),
                    label: Text(_page < 2 ? 'Next' : 'Start'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroSlide extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  const _IntroSlide({required this.icon, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppTheme.primaryCyan, AppTheme.secondaryCyan],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 24, offset: const Offset(0, 10)),
                  ],
                ),
                child: Icon(icon, color: theme.colorScheme.primary, size: 48),
              ),
              const SizedBox(height: 16),
              Text(
                title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              Text(
                desc,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(color: Colors.white.withOpacity(0.9)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

