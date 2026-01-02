import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hiring_test_app/core/resources/assets_manager.dart';

class DetailsHeader extends StatefulWidget {
  const DetailsHeader({super.key});

  @override
  State<DetailsHeader> createState() => _DetailsHeaderState();
}

class _DetailsHeaderState extends State<DetailsHeader> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image Slider
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                return Image.asset(
                  ImageAssets.stadiumHeader,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Gradient Overlay (Optional, but good for visibility of white icons if image is light)
          // User didn't explicitly ask for gradient, but usually good.
          // User said "opacity: 1" for something, maybe image.
          // I will leave out gradient if not requested to follow "pixel perfect" based on text description precisely,
          // but indicators need visibility.
          // Back Button
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 20,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: IconButton(
                padding: EdgeInsets.zero, // Center icon
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black, // Typical for white bg
                  size: 20,
                ),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  } else {
                    context.go('/');
                  }
                },
              ),
            ),
          ),
          // Indicators
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  height: 8,
                  width: _currentPage == index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(4),
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
