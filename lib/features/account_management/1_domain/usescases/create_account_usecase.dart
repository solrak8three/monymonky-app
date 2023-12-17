import 'package:monymonky/features/account_management/0_entity/entity.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';
import 'package:uuid/uuid.dart';

class CreateAccountUseCase {
  final AccountRepository accountRepository;

  CreateAccountUseCase(this.accountRepository);

  Future<void> call(AccountCreationDto accountDto) async {
    List<String> errors = [];
    if (accountDto.name.isEmpty) errors.add('empty name');
    if (accountDto.balance < 0) errors.add('negative balance');
    if (errors.isNotEmpty) {
      final errorMessage = 'Errors: ${errors.join(',')}';
      throw Exception(errorMessage);
    }
    final newAccount = Account(
        name: accountDto.name,
        balance: accountDto.balance,
        accountNumber: const Uuid().v4(),
        createdAt: DateTime.now().toUtc().toIso8601String()
    );
    await accountRepository.createAccount(newAccount);
  }

}