import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hiring_test_app/core/theme/color_manager.dart';
import 'package:hiring_test_app/features/details/cubit/details_cubit.dart';

import 'widgets/details_header.dart';
import 'widgets/details_content.dart';
import 'widgets/book_now_button.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DetailsCubit(),
      child: const DetailsView(),
    );
  }
}

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.background,
      body: Stack(
        children: [
          Column(
            children: [
              DetailsHeader(),
              Expanded(child: DetailsContent()),
            ],
          ),
          Positioned(left: 20, right: 20, bottom: 30, child: BookNowButton()),
        ],
      ),
    );
  }
}
