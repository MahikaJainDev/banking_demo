import 'package:flutter/material.dart';

import '../../models/home_data_model.dart';

class UpcomingBillsWidget extends StatelessWidget {
  const UpcomingBillsWidget({super.key, required this.upcomingBills});

  final UpcomingBills upcomingBills;

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
                      '${upcomingBills.date}',
                      style:
                      Theme.of(context).textTheme.titleSmall,
                    ),
                    Text(
                      '${upcomingBills.description}',
                      style:
                      Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                      '${upcomingBills.amount}',
                      style:
                      Theme.of(context).textTheme.titleSmall,
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
                Text(
                    'fromAccount: ${upcomingBills.fromAccount}'),
                const Spacer(),
                Text(
                    'toAccount: ${upcomingBills.toAccount}')
              ],
            )
          ],
        ),
      ),
    );
  }
}
