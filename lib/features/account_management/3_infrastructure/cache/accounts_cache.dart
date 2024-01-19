import 'package:monymonky/features/account_management/0_entity/account.dart';

class AccountsCache {
  List<Account>? accounts;

  void clearCache() {
    accounts = null;
  }
}