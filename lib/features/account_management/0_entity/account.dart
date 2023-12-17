import 'package:isar/isar.dart';

part 'account.g.dart';

@collection
class Account {
  Id id = Isar.autoIncrement;

  String name;

  @Index(unique: true)
  String accountNumber;

  double balance;

  String createdAt;

  Account({
    required this.name,
    required this.accountNumber,
    required this.balance,
    required this.createdAt,
  });

  @override
  String toString() {
    return 'Account{id: $id, name: $name, accountNumber: $accountNumber, balance: $balance, createdAt: $createdAt}';
  }
}
