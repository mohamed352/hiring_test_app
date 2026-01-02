import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_test_app/core/theme/color_manager.dart';
import 'package:hiring_test_app/core/resources/string_manager.dart';
import 'package:hiring_test_app/core/resources/assets_manager.dart';
import 'package:hiring_test_app/features/details/cubit/details_cubit.dart';
import 'package:hiring_test_app/features/details/cubit/details_state.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorManager.background),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title and Price Row
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      StringManager.detailsTitle,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20, // Bigger
                        fontWeight: FontWeight.w600, // SemiBold
                        color: ColorManager.textMain,
                        height: 1.2, // Adjusted for multi-line
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    StringManager.pricePerHour,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16, // Adjusted hierarchy
                      fontWeight: FontWeight.w500, // Medium
                      color: ColorManager.navActive,
                      height: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Info Row (3 items) - Vertical List
              const Column(
                children: [
                  _InfoItemRow(
                    label: StringManager.openingHours,
                    value: StringManager.openingHoursValue,
                  ),
                  SizedBox(height: 16),
                  _InfoItemRow(
                    label: StringManager.openingHours,
                    value: StringManager.openingHoursValue,
                  ),
                  SizedBox(height: 16),
                  _InfoItemRow(
                    label: StringManager.openingHours,
                    value: StringManager.openingHoursValue,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Available Sports Title
              const Text(
                StringManager.availableSports,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500, // Medium
                  color: ColorManager.textMain,
                  height: 1.0,
                ),
              ),
              const SizedBox(height: 16),
              // Sports Grid
              BlocBuilder<DetailsCubit, DetailsState>(
                builder: (context, state) {
                  final sports = state.maybeWhen(
                    loaded: (s, _) => s,
                    orElse: () => ['Football', 'Tennis', 'Padel'],
                  );
                  final selectedSport = state.maybeWhen(
                    loaded: (_, s) => s,
                    orElse: () => 'Football',
                  );

                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 2.5,
                        ),
                    itemCount: sports.length,
                    itemBuilder: (context, index) {
                      final sport = sports[index];
                      final isSelected = sport == selectedSport;
                      return GestureDetector(
                        onTap: () {
                          context.read<DetailsCubit>().selectSport(sport);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            gradient: isSelected
                                ? ColorManager.primaryGradient
                                : null,
                            color: isSelected ? null : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: isSelected
                                ? null
                                : Border.all(color: Colors.grey.shade300),
                            boxShadow: isSelected
                                ? [
                                    BoxShadow(
                                      color: ColorManager.primary.withValues(
                                        alpha: 0.3,
                                      ),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ]
                                : null,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.sports_soccer,
                                color: isSelected ? Colors.white : Colors.grey,
                                size: 18,
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  sport,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 24),
              // Banner Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  ImageAssets.banner,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 80), // Space for FAB
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoItemRow extends StatelessWidget {
  const _InfoItemRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: ColorManager.navActive,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.access_time, color: Colors.white, size: 18),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: ColorManager.navActive,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
