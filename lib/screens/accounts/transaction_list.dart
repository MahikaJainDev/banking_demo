import 'package:banking_demo/blocs/transactions_bloc/transaction_bloc.dart';
import 'package:banking_demo/blocs/transactions_bloc/transaction_state.dart';
import 'package:banking_demo/screens/home/transaction_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if(state is TransactionsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is TransactionsErrorState) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
        if(state is! TransationsLoadedState) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => TransactionListTile(transaction: state.transactionsData[index]),
                childCount: state.transactionsData.length
              ),
            )
          ],
        );
      }
    );
  }
}