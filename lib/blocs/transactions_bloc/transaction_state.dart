
import 'package:banking_demo/models/transactions_model.dart';

abstract class TransactionState {}

class TransactionsLoadingState extends TransactionState {}

class TransationsLoadedState extends TransactionState {
  final List<TransactionsData> transactionsData;

  TransationsLoadedState(this.transactionsData);
}

class TransactionsErrorState extends TransactionState {
  final String error;

  TransactionsErrorState(this.error);
}