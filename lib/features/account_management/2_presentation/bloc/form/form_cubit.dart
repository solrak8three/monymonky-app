import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:monymonky/features/account_management/2_presentation/presentation.dart';

part 'form_state.dart';

class AccountFormCubit extends Cubit<AccountFormState> {

  final AccountBloc accountBloc;

  AccountFormCubit(this.accountBloc) : super(const AccountFormState());

  void onSubmit() {
    // Emitir un loading
    emit(
        state.copyWith(
          formStatus: FormStatus.validating,
          nameInput: AccountNameInput.dirty(value: state.nameInput.value),
          balanceInput: AccountBalanceInput.dirty(balance: state.balanceInput.value),
        )
    );

    accountBloc.add(CreateAccountEvent(
        name: state.nameInput.value,
        balance: state.balanceInput.value,
    ));

   // TODO: Hacer un reset del formulario
  }

  void accountNameChanged(String value) {
    final accountName = AccountNameInput.dirty(value: value);
    emit(
        state.copyWith(
          nameInput: accountName,
          isValid: Formz.validate([accountName, state.balanceInput]),
        )
    );
  }

  void accountBalanceChanged(double value) {
    final accountBalance = AccountBalanceInput.dirty(balance: value);
    emit(
        state.copyWith(
            balanceInput: accountBalance
        )
    );
  }
}
