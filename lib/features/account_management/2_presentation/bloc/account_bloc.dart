import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'package:monymonky/features/account_management/0_entity/account.dart';
import 'package:monymonky/features/account_management/1_domain/domain.dart';

part 'account_event.dart';
part 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {

  final CreateAccountUseCase createAccountUseCase;

  AccountBloc(this.createAccountUseCase) : super(const AccountState()) {
    
    on<CreateAccountEvent>(_onCreateAccount);
  }

  void _onCreateAccount(CreateAccountEvent event, Emitter<AccountState> emit) async {
    try {
      final newAccount = Account(
          name: event.name,
          balance: event.balance,
          accountNumber: const Uuid().v4(),
          createdAt: DateTime.now().toUtc().toIso8601String()
      );
      await createAccountUseCase.call(newAccount);
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
