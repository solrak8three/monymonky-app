import 'package:formz/formz.dart';

// Define input validation errors
enum AccountBalanceInputError { empty, quantity }

// Extend FormzInput and provide the input type and error type.
class AccountBalanceInput extends FormzInput<double, AccountBalanceInputError> {
  // Call super.pure to represent an unmodified form input.
  const AccountBalanceInput.pure() : super.pure(50);

  // Call super.dirty to represent a modified form input.
  const AccountBalanceInput.dirty({double balance = 50}) : super.dirty(balance);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AccountBalanceInputError.empty) return 'El campo es requerido';
    if (displayError == AccountBalanceInputError.quantity) return 'El valor tiene que ser superior a 50';
  }

  // Override validator to handle validating a given input value.
  @override
  AccountBalanceInputError? validator(double balance) {
    if (balance.toString().isEmpty) return AccountBalanceInputError.empty;
    if (balance < 50) return AccountBalanceInputError.quantity;
    return null;
  }
}