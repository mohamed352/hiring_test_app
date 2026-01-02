import 'package:flutter/material.dart';
import 'package:hiring_test_app/core/theme/color_manager.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
    required this.cities,
    required this.selectedCity,
    required this.onCityChanged,
  });

  final List<String> cities;
  final String selectedCity;
  final void Function(String) onCityChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              gradient: ColorManager.primaryGradient,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: ColorManager.primary.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Move text to start, icon to end
              children: [
                Text(
                  'Sort',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 20),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                popupMenuTheme: PopupMenuThemeData(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: const BorderSide(
                      color: Color.fromRGBO(48, 81, 137, 1),
                    ),
                  ),
                  color: Colors.white,
                  surfaceTintColor: Colors.white,
                ),
                scrollbarTheme: ScrollbarThemeData(
                  thumbColor: WidgetStateProperty.all(
                    const Color.fromRGBO(50, 97, 149, 0.18),
                  ),
                  trackVisibility: WidgetStateProperty.all(true),
                  thumbVisibility: WidgetStateProperty.all(true),
                ),
              ),
              child: PopupMenuButton<String>(
                offset: const Offset(0, 40),
                constraints: const BoxConstraints(
                  maxHeight:
                      300, // Limit height to show scrollbar effect if needed
                  minWidth: 200,
                ),
                onSelected: onCityChanged,
                itemBuilder: (context) {
                  return cities.asMap().entries.map((entry) {
                    final index = entry.key;
                    final city = entry.value;
                    final isLast = index == cities.length - 1;
                    return PopupMenuItem<String>(
                      value: city,
                      height: 0, // Compact height handling
                      padding: EdgeInsets.zero,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            child: Text(
                              city,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                          if (!isLast)
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Color.fromRGBO(50, 97, 149, 0.27),
                            ),
                        ],
                      ),
                    );
                  }).toList();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cities.contains(selectedCity)
                            ? selectedCity
                            : 'Select City',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF333333),
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
