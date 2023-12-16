import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monymonky/features/account_management/0_entity/account.dart';
import 'package:monymonky/features/account_management/1_domain/repositories/account_repository.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {

  final AccountRepository accountRepository;

  AccountBloc(this.accountRepository) : super(const AccountState()) {
    
    on<CreateAccountEvent>(_onCreateAccount);
  }

  void _onCreateAccount(CreateAccountEvent event, Emitter<AccountState> emit) async {
    try {
      final newAccount = Account(
          name: event.name,
          accountNumber: event.accountNumber,
          balance: event.balance as double,
      );
      await accountRepository.createAccount(newAccount);
      emit(
          state.copyWith(
            isSuccess: true,
            isError: false,
            isSubmitting: false,
          )
      );
    } catch(error) {
      emit(
        state.copyWith(
          isError: true,
          isSubmitting: false,
          errorMessage: error.toString()
        )
      );
    }
  }
}
