import 'package:monymonky/features/account_management/0_entity/entity.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';


class GetAllAccountsUseCase {
  final AccountRepository accountRepository;

  GetAllAccountsUseCase(this.accountRepository);

  Future<List<Account>> call() async {
    List<Account> accounts = await accountRepository.getAllAccounts();
    return accounts;
  }

}