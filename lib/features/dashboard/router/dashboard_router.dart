
import 'package:go_router/go_router.dart';
import 'package:monymonky/features/dashboard/2_presentation/presentation.dart';
import 'package:monymonky/features/dashboard/router/router.dart';

List<GoRoute> getDashboardRoutes() => [
  GoRoute(
    path: DashboardRoutes.dashboard,
    name: DashboardPage.name,
    builder: (context, state) => const DashboardPage(),
  ),
];
