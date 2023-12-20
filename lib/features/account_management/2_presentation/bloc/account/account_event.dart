part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
  @override
  List<Object> get props => [];
}

class CreateAccountEvent extends AccountEvent {
  final String name;
  final double balance;

  const CreateAccountEvent({
    required this.name,
    required this.balance,
  });
}

class DeleteAccountEvent extends AccountEvent {
  final String accountNumber;
  const DeleteAccountEvent({required this.accountNumber});
}

class GetAccountEvent extends AccountEvent {
  final String accountNumber;
  const GetAccountEvent({required this.accountNumber});
}

class GetAllAccountsEvent extends AccountEvent {}

class UpdateAccountEvent extends AccountEvent {}

class ResetAccountEvent extends AccountEvent {}
