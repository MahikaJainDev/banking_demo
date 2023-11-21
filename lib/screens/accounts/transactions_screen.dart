import 'package:banking_demo/screens/accounts/transaction_list.dart';
import 'package:banking_demo/widgets/rich_text_widget.dart';
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
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CloseButton(),
                      buildRichText(context, 'Account Number', '\n${data.getAccountNumber}'),
                      const Spacer(),
                      buildRichText(context, 'Balance', '\n${data.getAccountBalance.toStringAsFixed(2)}'),
                    ],
                  ),
                ),
              ),
            ),
            const TabBar(
              tabs: [
                Tab(text: 'Transactions',),
                Tab(text: 'Details',)
              ]
            ),
            Expanded(
                child: TabBarView(
                  children: [
                    const TransactionList(),
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
