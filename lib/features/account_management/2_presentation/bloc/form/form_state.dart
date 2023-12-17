part of 'form_cubit.dart';

enum FormStatus { invalid, valid, validating, posting }

class AccountFormState extends Equatable {
  final FormStatus formStatus;
  final AccountNameInput nameInput;
  final AccountBalanceInput balanceInput;

  final bool isValid;

  const AccountFormState({
    this.formStatus = FormStatus.invalid,
    this.nameInput = const AccountNameInput.pure(),
    this.balanceInput = const AccountBalanceInput.pure(),
    this.isValid = false,
  });

  AccountFormState copyWith({
    FormStatus? formStatus,
    AccountNameInput? nameInput,
    AccountBalanceInput? balanceInput,
    bool? isValid,
  }) => AccountFormState(
    formStatus: formStatus ?? this.formStatus,
    nameInput: nameInput ?? this.nameInput,
    balanceInput: balanceInput ?? this.balanceInput,
    isValid: isValid ?? this.isValid,
  );

  @override
  List<Object> get props => [formStatus, nameInput, balanceInput];

}
