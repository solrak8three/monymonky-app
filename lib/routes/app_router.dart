import 'package:go_router/go_router.dart';
import 'package:monymonky/features/account_management/2_presentation/pages/pages.dart';
import 'package:monymonky/features/dashboard/2_presentation/pages/pages.dart';


final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        name: DashboardPage.name,
        builder: (context, state) => const DashboardPage(),
    ),
    GoRoute(
      path: '/accounts',
      name: AccountsPage.name,
      builder: (context, state) => const AccountsPage(),
    ),
    GoRoute(
      path: '/create-account',
      name: CreateAccountPage.name,
      builder: (context, state) => const CreateAccountPage(),
    ),
  ],
);
