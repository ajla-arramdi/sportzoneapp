
import 'package:flutter/material.dart';

class ImageSlider extends StatefulWidget {
  const ImageSlider({super.key});

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0), // 8px spacing
      height: 200, // 25 * 8px
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16), // 2 * 8px
      ),
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: 5, // Number of slides
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8.0), // 8px spacing
                decoration: BoxDecoration(
                  color: Colors.primaries[index % Colors.primaries.length],
                  borderRadius: BorderRadius.circular(16), // 2 * 8px
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8, // 8px spacing
                      offset: const Offset(0, 4), // 0.5 * 8px
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    'Promotional Image ${index + 1}',
                    style: const TextStyle(
                      fontSize: 24, // 3 * 8px
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
          // Page indicator
          Positioned(
            bottom: 16, // 2 * 8px
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  width: 8, // 8px spacing
                  height: 8, // 8px spacing
                  margin: const EdgeInsets.symmetric(horizontal: 4), // 0.5 * 8px
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentPage == index 
                        ? Theme.of(context).primaryColor 
                        : Colors.white.withOpacity(0.5),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}