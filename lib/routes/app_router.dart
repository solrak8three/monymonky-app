
import 'package:go_router/go_router.dart';
import 'package:monymonky/features/account_management/router/router.dart';
import 'package:monymonky/features/dashboard/router/router.dart';


final appRouter = GoRouter(
  initialLocation: DashboardRoutes.dashboard,
  routes: [
    ...getDashboardRoutes(),
   ...getAccountManagementRoutes()
  ]
);
