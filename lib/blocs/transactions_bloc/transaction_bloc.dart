import 'package:banking_demo/blocs/transactions_bloc/transaction_state.dart';
import 'package:banking_demo/models/transactions_model.dart';
import 'package:banking_demo/repositories/transaction_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionsLoadingState()) {
    fetchTransactionsData();
  }

  TransactionsRepository transactionsRepository = TransactionsRepository();

  void fetchTransactionsData() async {
    try {
      List<TransactionsData>? transactionsData = await transactionsRepository.fetchTransactions();
      if(transactionsData == null){
        emit(TransactionsErrorState("Something went wrong!"));
        return;
      }
      emit(TransationsLoadedState(transactionsData));
    } catch(ex) {
      emit(TransactionsErrorState("Something went wrong!"));
    }
  }
}