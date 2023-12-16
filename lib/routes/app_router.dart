import 'package:go_router/go_router.dart';
import 'package:monymonky/features/dashboard/2_presentation/pages/pages.dart';


final appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
        path: '/home',
        name: DashboardPage.name,
        builder: (context, state) => const DashboardPage(),
    ),
  ],
);
