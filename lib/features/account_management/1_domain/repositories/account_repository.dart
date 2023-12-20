import 'package:monymonky/features/account_management/0_entity/entity.dart';

abstract class AccountRepository {

  Future<List<Account>> getAllAccounts();

  Future<Account?> getAccount(String accountNumber);

  Future<void> depositToAccount(int accountId, double money);

  Future<bool> withdrawFromAccount(int accountId, double money);

  Future<void> createAccount(Account newAccount);

  Future<bool> deleteAccount(String accountNumber);
}