import 'package:monymonky/features/account_management/0_entity/entity.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';


class DeleteAccountUseCase {
  final AccountRepository accountRepository;

  DeleteAccountUseCase(this.accountRepository);

  Future<bool> call(String accountNumber) async {
    return await accountRepository.deleteAccount(accountNumber);
  }
}