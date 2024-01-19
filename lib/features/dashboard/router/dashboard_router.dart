
import 'package:go_router/go_router.dart';
import 'package:monymonky/features/dashboard/2_presentation/presentation.dart';

List<GoRoute> getDashboardRoutes() => [
  GoRoute(
    path: '/',
    name: DashboardPage.name,
    builder: (context, state) => const DashboardPage(),
  ),
];
