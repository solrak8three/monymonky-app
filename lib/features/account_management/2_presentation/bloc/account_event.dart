part of 'account_bloc.dart';

abstract class AccountEvent extends Equatable {
  const AccountEvent();
  @override
  List<Object> get props => [];
}

class CreateAccountEvent extends AccountEvent {
  final String name;
  final String accountNumber;
  final double balance;

  const CreateAccountEvent({
    required this.name,
    required this.accountNumber,
    required this.balance,
  });
}

class AddMoneyEvent extends AccountEvent {
  final String accountNumber;
  final double amount;

  const AddMoneyEvent({
    required this.accountNumber,
    required this.amount,
  });
}

class WithdrawMoneyEvent extends AccountEvent {
  final String accountNumber;
  final double amount;

  const WithdrawMoneyEvent({
    required this.accountNumber,
    required this.amount,
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