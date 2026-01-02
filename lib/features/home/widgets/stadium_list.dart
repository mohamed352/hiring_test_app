import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hiring_test_app/core/theme/color_manager.dart';
import 'package:hiring_test_app/features/home/cubit/home_cubit.dart';
import 'package:hiring_test_app/features/home/cubit/home_state.dart';
import 'package:hiring_test_app/features/home/models/stadium_model.dart';

class StadiumList extends StatelessWidget {
  const StadiumList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (cities, selectedCity, stadiums) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: stadiums.length,
              itemBuilder: (context, index) {
                return _StadiumCard(stadium: stadiums[index]);
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}

class _StadiumCard extends StatelessWidget {
  const _StadiumCard({required this.stadium});

  final StadiumModel stadium;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/details');
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image Container
                Container(
                  width: 40, // Reduced from 47
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                    image: DecorationImage(
                      image: AssetImage(stadium.imagePath),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[100],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              stadium.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500, // Medium
                                fontSize: 12, // 12px
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(
                                  0xFFF7C700,
                                ), // rgba(247, 199, 0, 1)
                                size: 14,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                stadium.rating.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400, // Regular
                                  fontSize: 10, // 10px
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        stadium.description,
                        style: const TextStyle(
                          color: ColorManager.textLight,
                          fontSize: 10, // 10px
                          fontWeight: FontWeight.w400, // Regular
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              stadium.location,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 10, // 10px
                                fontWeight: FontWeight.w400, // Regular
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(color: Color(0xFFF0F0F0)),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _InfoItem(
                  icon: Icons.access_time,
                  text: 'Max Booking: 2 hours',
                ),
                _InfoItem(
                  icon: Icons.access_time,
                  text: 'Min Booking: 2 hours',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  const _InfoItem({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.blueGrey),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 9, // Updated to 9px Medium per user list
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
