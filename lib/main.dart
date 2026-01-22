import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hiring_test_app/core/theme/color_manager.dart';
import 'package:hiring_test_app/core/routes/app_router.dart';
import 'package:hiring_test_app/features/home/data/stadium_repository.dart';

void main() {
  runApp(
    RepositoryProvider<StadiumRepository>(
      create: (_) => StadiumRepositoryImpl(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Hiring Test App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorManager.primary,
          primary: ColorManager.primary,
          secondary: ColorManager.primaryDark,
          surface: ColorManager.background,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.outfitTextTheme(),
        scaffoldBackgroundColor: ColorManager.background,
      ),
      routerConfig: appRouter,
    );
  }
}
