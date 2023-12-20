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

    on<DeleteAccountEvent>(_onDeleteAccount);

    on<GetAccountEvent>(_onGetAccount);

  }

  void _onGetAccount(GetAccountEvent event, Emitter<AccountState> emit) async {
    emit(AccountsLoadingState());
    try {
      final accountNumber = event.accountNumber;
      final account = await accountUseCases.getAccountUseCase.call(accountNumber);
      if (account != null) {
        emit(AccountLoadedState(account: account));
        return;
      }
      emit(const AccountsErrorState('No se encontro esa cuenta!'));
    } catch(error) {
      print('Error getAccount');
    }
  }

  void _onDeleteAccount(DeleteAccountEvent event, Emitter<AccountState> emit) async {
    try {
      emit(AccountsLoadingState());
      final deleted = await accountUseCases.deleteAccountUseCase.call(event.accountNumber);
      if (deleted) add(GetAllAccountsEvent());
    } catch (error) {
      print('Error');
    }
  }

  void _onGetAllAccounts(GetAllAccountsEvent event, Emitter<AccountState> emit) async {
    try {
      emit(AccountsLoadingState());
      await Future.delayed(const Duration(seconds: 1));
      List<Account> accounts = await accountUseCases.getAllAccountsUseCase.call();
      if (accounts.isEmpty) {
        emit(EmptyAccountListState());
        return;
      }
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
