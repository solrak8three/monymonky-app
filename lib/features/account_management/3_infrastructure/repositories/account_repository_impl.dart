import 'package:monymonky/features/account_management/0_entity/account.dart';
import 'package:monymonky/features/account_management/1_domain/datasources/account_datasource.dart';
import 'package:monymonky/features/account_management/1_domain/repositories/account_repository.dart';

class AccountRepositoryImpl implements AccountRepository {

  final AccountDatasource datasource;

  AccountRepositoryImpl(this.datasource);

  @override
  Future<void> depositToAccount(int accountId, double money) {
    return datasource.depositToAccount(accountId, money);
  }

  @override
  Future<Account?> getAccountById(int accountId) {
    return datasource.getAccountById(accountId);
  }

  @override
  Future<List<Account>> getAllAccounts() {
    return datasource.getAllAccounts();
  }

  @override
  Future<bool> withdrawFromAccount(int accountId, double money) {
    return datasource.withdrawFromAccount(accountId, money);
  }

  @override
  Future<void> createAccount(Account newAccount) {
    return datasource.createAccount(newAccount);
  }

  @override
  Future<void> deleteAccount(int accountId) {
    return datasource.deleteAccount(accountId);
  }
}