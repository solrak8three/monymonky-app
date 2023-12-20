import 'package:monymonky/features/account_management/0_entity/entity.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';

class GetAccountUseCase {
  final AccountRepository accountRepository;

  GetAccountUseCase(this.accountRepository);

  Future<Account?> call(String accountNumber) async {
    return await accountRepository.getAccount(accountNumber);
  }

}