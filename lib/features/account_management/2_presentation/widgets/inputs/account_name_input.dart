import 'package:formz/formz.dart';

// Define input validation errors
enum AccountNameInputError { empty, length }

// Extend FormzInput and provide the input type and error type.
class AccountNameInput extends FormzInput<String, AccountNameInputError> {
  // Call super.pure to represent an unmodified form input.
  const AccountNameInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const AccountNameInput.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == AccountNameInputError.empty) return 'El campo es requerido';
    if (displayError == AccountNameInputError.length) return 'El nombre tiene menos de 4 carácteres';
  }

  // Override validator to handle validating a given input value.
  @override
  AccountNameInputError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return AccountNameInputError.empty;
    if (value.length < 4) return AccountNameInputError.length;
    return null;
  }
}