class InternalAccountRoutes {
  static const String accounts = '/accounts';

  static const String createAccount = '/create-account';

  static const String accountList = '/account-list';

  static const String editACcount = '/edit-account/:accountNumber';
}

class AccountRoutes {
  static const String accounts = InternalAccountRoutes.accounts;

  static const String createAccount = InternalAccountRoutes.createAccount;

  static const String accountList = InternalAccountRoutes.accountList;

  static String editACcount(String accountNumber) => '/edit-account/$accountNumber';
}