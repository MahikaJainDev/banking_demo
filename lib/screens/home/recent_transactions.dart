import 'package:flutter/material.dart';

import '../../models/home_data_model.dart';

class RecentTransactionsWidget extends StatelessWidget {
  const RecentTransactionsWidget({super.key, required this.recentTransactions});

  final RecentTransactions recentTransactions;

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
                      '${recentTransactions.date}',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      '${recentTransactions.description}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      '${recentTransactions.amount}',
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
                Text('fromAccount: ${recentTransactions.fromAccount}'),
                const Spacer(),
                Text('toAccount: ${recentTransactions.toAccount}')
              ],
            )
          ],
        ),
      ),
    );
  }
}