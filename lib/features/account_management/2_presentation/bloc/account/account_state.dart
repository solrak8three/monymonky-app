part of 'account_bloc.dart';

class AccountState extends Equatable {
  final String name;
  final String accountNumber;
  final double balance;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isError;
  final String errorMessage;

  const AccountState({
    this.name = '',
    this.accountNumber = '',
    this.balance = 0.0,
    this.isSubmitting = false,
    this.isSuccess = false,
    this.isError = false,
    this.errorMessage = '',
  });

  @override
  List<Object> get props => [name, accountNumber, balance, isSubmitting, isSuccess, isError, errorMessage];

  AccountState copyWith({
    String? name,
    String? accountNumber,
    double? balance,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isError,
    String? errorMessage,
  }) {
    return AccountState(
      name: name ?? this.name,
      accountNumber: accountNumber ?? this.accountNumber,
      balance: balance ?? this.balance,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AccountsInitialState extends AccountState {}

class AccountsLoadingState extends AccountState {}

class AccountCreatedState extends AccountState {}

class EmptyAccountListState extends AccountState {}

class AccountsLoadedState extends AccountState {
  final List<Account> accounts;

  const AccountsLoadedState({
    required this.accounts,
  });

  @override
  List<Object> get props => [accounts];
}

class AccountsErrorState extends AccountState {
  final String message;

  const AccountsErrorState(this.message);

  @override
  List<Object> get props => [message];
}