import 'package:banking_demo/models/accounts_model.dart';
import 'package:banking_demo/repositories/accounts/accounts_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:banking_demo/blocs/accounts_bloc/accounts_state.dart';

class AccountsCubit extends Cubit<AccountsState> {
  AccountsCubit() : super(AccountsLoadingState()) {
    fetchAccountsData();
  }

  AccountsRepository accountsRepository = AccountsRepository();

  void fetchAccountsData() async {
    try {
      List<AccountsData>? accountsData = await accountsRepository.fetchAccounts();
      if(accountsData == null){
        emit(AccountsErrorState("Something went wrong!"));
        return;
      }
      emit(AccountsLoadedState(accountsData));
    } catch(ex) {
      emit(AccountsErrorState("Something went wrong!"));
    }
  }
}