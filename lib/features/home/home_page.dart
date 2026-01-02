import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_test_app/core/extensions/context_extensions.dart';
import 'package:hiring_test_app/core/theme/color_manager.dart';
import 'package:hiring_test_app/core/logger/app_logger.dart';
import 'package:hiring_test_app/features/home/cubit/home_cubit.dart';
import 'package:hiring_test_app/features/home/cubit/home_state.dart';

import 'widgets/home_header.dart';
import 'widgets/hero_banner.dart';
import 'widgets/filter_section.dart';
import 'widgets/stadium_list.dart';
import '../../shared/widgets/custom_bottom_nav.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => HomeCubit(), child: const HomeView());
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.05,
            vertical: context.height * 0.02,
          ),
          child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {
              state.maybeWhen(error: (msg) => log.e(msg), orElse: () {});
            },
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (cities, selectedCity, stadiums) {
                  return Column(
                    children: [
                      const HomeHeader(),
                      SizedBox(height: context.height * 0.025),
                      const HeroBanner(),
                      SizedBox(height: context.height * 0.03),
                      FilterSection(
                        cities: cities,
                        selectedCity: selectedCity,
                        onCityChanged: (city) =>
                            context.read<HomeCubit>().changeCity(city),
                      ),
                      SizedBox(height: context.height * 0.03),
                      const StadiumList(),
                    ],
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(),
    );
  }
}
