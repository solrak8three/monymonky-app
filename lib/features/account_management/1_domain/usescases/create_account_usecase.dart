import 'package:monymonky/features/account_management/0_entity/entity.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';

class CreateAccountUseCase {
  final AccountRepository accountRepository;

  CreateAccountUseCase(this.accountRepository);

  Future<void> call(Account newAccount) async {
    List<String> errors = [];
    if (newAccount.name.isEmpty) errors.add('empty name');
    if (newAccount.balance < 0) errors.add('negative balance');
    if (errors.isNotEmpty) {
      final errormessage = 'Errors: ${errors.join(',')}';
      throw Exception(errormessage);
    }
    await accountRepository.createAccount(newAccount);
  }

}