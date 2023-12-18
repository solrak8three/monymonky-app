import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:monymonky/features/account_management/0_entity/account.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';
import 'package:monymonky/features/account_management/2_presentation/bloc/bloc.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {

  final AccountUseCases accountUseCases;

  AccountBloc(this.accountUseCases) : super(const AccountState()) {
    
    on<CreateAccountEvent>(_onCreateAccount);

    on<GetAllAccountsEvent>(_onGetAllAccounts);
  }

  void _onGetAllAccounts(GetAllAccountsEvent event, Emitter<AccountState> emit) async {
    try {
      emit(AccountsLoadingState());
      List<Account> accounts = await accountUseCases.getAllAccountsUseCase.call();
      emit(AccountsLoadedState(accounts: accounts));
    } catch(error) {
      emit(AccountsErrorState(error.toString()));
    }
  }

  void _onCreateAccount(CreateAccountEvent event, Emitter<AccountState> emit) async {
    try {
      emit(AccountsLoadingState());
      final newAccount = AccountCreationDto(
          name: event.name,
          balance: event.balance,
      );
      await accountUseCases.createAccountUseCase.call(newAccount);
      emit(AccountCreatedState());
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
