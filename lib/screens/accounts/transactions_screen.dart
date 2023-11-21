import 'package:banking_demo/screens/accounts/transaction_list.dart';
import 'package:flutter/material.dart';

import '../../models/accounts_model.dart';
import 'accounts_list_tile.dart';

class TransactionsScreen extends StatelessWidget {
  final AccountsData data;
  const TransactionsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CloseButton(),
                        Column(
                          children: [
                            Text('Account Number:',
                            style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(data.accountNumber!)
                          ],
                        ),
                        Column(
                          children: [
                          Text('Balance:',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(data.balance!.toString())
                        ],)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TabBar(
                tabs: [
                  Tab(text: 'Transactions',),
                  Tab(text: 'Details',)
                ]),
            Expanded(
                child: TabBarView(
                  children: [
                    TransactionList(),
                    Column(
                      children: [
                        AccountsListTile(data: data)
                      ],
                    )
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}
