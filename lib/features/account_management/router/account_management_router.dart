import 'package:go_router/go_router.dart';
import 'package:monymonky/features/account_management/2_presentation/presentation.dart';
import 'package:monymonky/features/account_management/router/router.dart';

List<GoRoute> getAccountManagementRoutes() => [
  GoRoute(
    path: InternalAccountRoutes.accounts,
    name: AccountsPage.name,
    builder: (context, state) => const AccountsPage(),
  ),
  GoRoute(
    path: InternalAccountRoutes.createAccount,
    name: CreateAccountPage.name,
    builder: (context, state) => const CreateAccountPage(),
  ),
  GoRoute(
    path: InternalAccountRoutes.accountList,
    name: AccountListPage.name,
    builder: (context, state) => const AccountListPage(),
  ),
  GoRoute(
    path: InternalAccountRoutes.editACcount,
    name: EditAccountPage.name,
    builder: (context, state) {
      //final String accountNumber = state.pathParameters['accountNumber'] ?? '';
      //return EditAccountPage(accountNumber: accountNumber,);
      return const EditAccountPage();
    },
  ),
];
