import 'package:isar/isar.dart';
import 'package:monymonky/core/di/locator.dart';
import 'package:monymonky/features/account_management/0_entity/account.dart';
import 'package:monymonky/features/account_management/1_domain/datasources/account_datasource.dart';

class AccountDatasourceImpl implements AccountDatasource {

  @override
  Future<Account?> getAccountById(int accountId) {
    // TODO: implement getAccountById
    throw UnimplementedError();
  }

  @override
  Future<void> createAccount(Account newAccount) async {
    final isar = await locator.getAsync<Isar>();
    isar.writeTxn(() => isar.accounts.put(newAccount));
  }

  @override
  Future<List<Account>> getAllAccounts() async {
    final isar = await locator.getAsync<Isar>();
    return await isar.accounts.where().findAll();
  }

  @override
  Future<void> deleteAccount(int accountId) {
    // TODO: implement deleteAccount
    throw UnimplementedError();
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