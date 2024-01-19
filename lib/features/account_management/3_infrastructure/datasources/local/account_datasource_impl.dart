import 'package:isar/isar.dart';
import 'package:monymonky/core/di/locator.dart';
import 'package:monymonky/features/account_management/0_entity/account.dart';
import 'package:monymonky/features/account_management/1_domain/datasources/account_datasource.dart';
import 'package:monymonky/features/account_management/3_infrastructure/cache/accounts_cache.dart';

class AccountDatasourceImpl implements AccountDatasource {

  final AccountsCache _accountsCache = AccountsCache();

  @override
  Future<Account?> getAccount(String accountNumber) async {
    final isar = await locator.getAsync<Isar>();
    return await isar.accounts.getByAccountNumber(accountNumber);
  }

  @override
  Future<void> createAccount(Account newAccount) async {
    final isar = await locator.getAsync<Isar>();
    await isar.writeTxn(() => isar.accounts.put(newAccount));
  }

  @override
  Future<List<Account>> getAllAccounts() async {
    if (_accountsCache.accounts != null) {
      return _accountsCache.accounts!;
    }
    final isar = await locator.getAsync<Isar>();
    _accountsCache.accounts = await isar.accounts.where().findAll();
    return _accountsCache.accounts!;
  }

  @override
  Future<bool> deleteAccount(String accountNumber) async {
    bool result = false;
    final isar = await locator.getAsync<Isar>();
    await isar.writeTxn(() async {
      result = await isar.accounts.deleteByAccountNumber(accountNumber);
    });
    return result;
  }

  @override
  Future<void> depositToAccount(int accountId, double money) {
    // TODO: implement depositToAccount
    throw UnimplementedError();
  }

  @override
  Future<bool> withdrawFromAccount(int accountId, double money) {
    // TODO: implement withdrawFromAccount
    throw UnimplementedError();
  }
}