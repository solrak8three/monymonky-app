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

  const DeleteAccountEvent(this.accountNumber);
}

class GetAccountEvent extends AccountEvent {
  final String accountNumber;

  const GetAccountEvent(this.accountNumber);
}

class GetAllAccountsEvent extends AccountEvent {}