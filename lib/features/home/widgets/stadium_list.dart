import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hiring_test_app/core/resources/values_manager.dart';
import 'package:hiring_test_app/core/theme/color_manager.dart';
import 'package:hiring_test_app/core/theme/font_manager.dart';
import 'package:hiring_test_app/core/theme/style_manager.dart';
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
        margin: const EdgeInsets.only(bottom: AppMargin.m16),
        padding: const EdgeInsets.all(AppPadding.p16),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(AppSize.s16),
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
                Container(
                  width: AppSize.s40,
                  height: AppSize.s40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12),
                    border: Border.all(color: Colors.grey.shade300),
                    image: DecorationImage(
                      image: AssetImage(stadium.imagePath),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.grey[100],
                  ),
                ),
                const SizedBox(width: AppSize.s16),
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
                              style: getMediumStyle(
                                color: ColorManager.textMain,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Color(0xFFF7C700),
                                size: AppSize.s14,
                              ),
                              const SizedBox(width: AppSize.s4),
                              Text(
                                stadium.rating.toString(),
                                style: getRegularStyle(
                                  color: ColorManager.textMain,
                                  fontSize: FontSize.s10,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s4),
                      Text(
                        stadium.description,
                        style: getRegularStyle(
                          color: ColorManager.textLight,
                          fontSize: FontSize.s10,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: AppSize.s8),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: AppSize.s14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: AppSize.s4),
                          Expanded(
                            child: Text(
                              stadium.location,
                              style: getRegularStyle(
                                color: Colors.grey,
                                fontSize: FontSize.s10,
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
            const SizedBox(height: AppSize.s8),
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
        Icon(icon, size: AppSize.s16, color: Colors.blueGrey),
        const SizedBox(width: AppSize.s4),
        Text(
          text,
          style: getMediumStyle(color: Colors.blueGrey, fontSize: FontSize.s9),
        ),
      ],
    );
  }
}
