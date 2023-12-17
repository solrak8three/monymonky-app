import 'package:go_router/go_router.dart';
import 'package:monymonky/core/config/routes/routes.dart';
import 'package:monymonky/features/account_management/2_presentation/pages/pages.dart';
import 'package:monymonky/features/dashboard/2_presentation/pages/pages.dart';



final appRouter = GoRouter(
  initialLocation: DashboardRoutes.dashboard,
  routes: [
    GoRoute(
        path: DashboardRoutes.dashboard,
        name: DashboardPage.name,
        builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: AccountRoutes.accounts,
      name: AccountsPage.name,
      builder: (context, state) => const AccountsPage(),
    ),
    GoRoute(
      path: AccountRoutes.createAccount,
      name: CreateAccountPage.name,
      builder: (context, state) => const CreateAccountPage(),
    ),
    GoRoute(
      path: AccountRoutes.accountList,
      name: AccountListPage.name,
      builder: (context, state) => const AccountListPage(),
    ),
  ],
);
