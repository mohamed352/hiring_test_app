import 'package:go_router/go_router.dart';
import 'package:hiring_test_app/features/home/home_page.dart';
import 'package:hiring_test_app/features/details/details_page.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: [
        GoRoute(
          path: 'details',
          builder: (context, state) => const DetailsPage(),
        ),
      ],
    ),
  ],
);
