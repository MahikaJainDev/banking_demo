import 'package:banking_demo/others/extension_methods.dart';
import 'package:banking_demo/models/transaction_model.dart';
import 'package:banking_demo/widgets/rich_text_widget.dart';
import 'package:flutter/material.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile({super.key, required this.transaction});

  final TransactionsData transaction;

  @override
  Widget build(BuildContext context) => Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              buildRichText(context, 'To', transaction.getToAccount),
              const Spacer(),
              Text(
                transaction.getAmount.toStringAsFixed(2),
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          buildRichText(context, 'From', transaction.getFromAccount),
          Text(
            transaction.getDescription,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            transaction.getDateTime.asString(addWeekDay: true, addYear: true),
            textAlign: TextAlign.end
          )
        ],
      ),
    ),
  );
}