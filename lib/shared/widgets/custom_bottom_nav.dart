import 'package:flutter/material.dart';
import 'package:hiring_test_app/core/theme/color_manager.dart';
import 'package:hiring_test_app/core/resources/assets_manager.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(icon: Icons.home_filled, label: 'Home', isSelected: true),
          _CenterNavItem(),
          _NavItem(
            icon: Icons.person_outline,
            label: 'Profile',
            isSelected: false,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.isSelected,
  });
  final IconData icon;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          isSelected
              ? (label == 'Home' ? Icons.home_filled : Icons.person)
              : (label == 'Home' ? Icons.home_outlined : Icons.person_outline),
          color: isSelected ? ColorManager.navActive : Colors.grey[400],
          size: 28, // Increased from 24
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? ColorManager.navActive : Colors.grey[400],
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (isSelected) ...[
          const SizedBox(height: 4),
          // Dot indicator removed as per request
        ],
      ],
    );
  }
}

class _CenterNavItem extends StatelessWidget {
  const _CenterNavItem();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -20), // Adjusted offset for larger size
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 75, // Increased to 75 as requested
            height: 75,
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: const EdgeInsets.all(
                8, // Reduced padding to make icon "big it littel"
              ),
              decoration: const BoxDecoration(
                gradient: ColorManager.primaryGradient,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(81, 162, 218, 0.19),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Image.asset(
                ImageAssets.navBarMiddle,
                color: Colors.white,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.sports_soccer,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
          const SizedBox(height: 4), // Reduced spacing
          Text(
            'My Reservation',
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
