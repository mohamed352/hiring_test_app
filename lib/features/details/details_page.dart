import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_test_app/core/theme/color_manager.dart';
import 'package:hiring_test_app/features/details/cubit/details_cubit.dart';
import 'package:hiring_test_app/features/details/cubit/details_state.dart';
import 'package:hiring_test_app/features/home/data/stadium_repository.dart';

import 'widgets/details_header.dart';
import 'widgets/details_content.dart';
import 'widgets/book_now_button.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(context.read<StadiumRepository>()),
      child: const DetailsView(),
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.background,
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => _ErrorWidget(message: msg),
            orElse: () => const Stack(
              children: [
                Column(
                  children: [
                    DetailsHeader(),
                    Expanded(child: DetailsContent()),
                  ],
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  bottom: 30,
                  child: BookNowButton(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: ColorManager.error),
          const SizedBox(height: 16),
          Text(
            'Something went wrong!',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.read<DetailsCubit>().retry(),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
