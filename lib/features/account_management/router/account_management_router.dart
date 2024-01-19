import 'package:go_router/go_router.dart';
import 'package:monymonky/features/account_management/2_presentation/presentation.dart';
import 'package:monymonky/features/account_management/router/router.dart';

List<GoRoute> getAccountManagementRoutes() => [
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
  GoRoute(
    path: AccountRoutes.editACcount,
    name: EditAccountPage.name,
    builder: (context, state) {
      //final String accountNumber = state.pathParameters['accountNumber'] ?? '';
      //return EditAccountPage(accountNumber: accountNumber,);
      return const EditAccountPage();
    },
  ),
];
