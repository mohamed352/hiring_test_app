import 'package:flutter/material.dart';
import 'package:hiring_test_app/core/resources/string_manager.dart';
import 'package:hiring_test_app/core/resources/assets_manager.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.searchCard),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          // Search Bar at Bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 32.0,
                right: 32.0,
                bottom:
                    46.0, // Increased bottom padding to move form "up littel"
              ),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.3),
                  ),
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  decoration: const InputDecoration(
                    hintText: StringManager.searchHint,
                    hintStyle: TextStyle(color: Colors.white70),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 20,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
