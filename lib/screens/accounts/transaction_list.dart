import 'package:banking_demo/blocs/transactions_bloc/transaction_bloc.dart';
import 'package:banking_demo/blocs/transactions_bloc/transaction_state.dart';
import 'package:banking_demo/models/transactions_model.dart';
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
        if(!(state is TransationsLoadedState)) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0,
                    right: 8.0,
                    bottom: 8.0
                  ),
                  child: _TransactionTile(data: state.transactionsData[index]),
                ),
                childCount: state.transactionsData.length
              ),
            )
          ],
        );
        return Center(
          child: Text(state.transactionsData.first.amount.toString()),
        );
      }
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final TransactionsData data;
  const _TransactionTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'toAccount: ${data.toAccount}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      '${data.description}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      '${data.amount?.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: [
                Text('fromAccount: ${data.fromAccount}'),
                const Spacer(),
                Text('${data.date}'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
