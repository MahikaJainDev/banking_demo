import '../../models/accounts_model.dart';

abstract class AccountsState {}

class AccountsLoadingState extends AccountsState {}

class AccountsLoadedState extends AccountsState {
  final List<AccountsData> accountsData;

  AccountsLoadedState(this.accountsData);
}

class AccountsErrorState extends AccountsState {
  final String error;

  AccountsErrorState(this.error);
}