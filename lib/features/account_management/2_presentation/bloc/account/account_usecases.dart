import 'package:monymonky/features/account_management/1_domain/domain.dart';

class AccountUseCases {
  final CreateAccountUseCase createAccountUseCase;
  final GetAllAccountsUseCase getAllAccountsUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;
  final GetAccountUseCase getAccountUseCase;

  AccountUseCases({
    required this.createAccountUseCase,
    required this.getAllAccountsUseCase,
    required this.deleteAccountUseCase,
    required this.getAccountUseCase,
  });
}