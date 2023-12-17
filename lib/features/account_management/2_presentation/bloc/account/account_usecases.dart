import 'package:monymonky/features/account_management/1_domain/domain.dart';

class AccountUseCases {
  final CreateAccountUseCase createAccountUseCase;
  final GetAllAccountsUseCase getAllAccountsUseCase;

  AccountUseCases({
    required this.createAccountUseCase,
    required this.getAllAccountsUseCase,
  });
}