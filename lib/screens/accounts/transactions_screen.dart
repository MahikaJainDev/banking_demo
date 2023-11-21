import 'package:flutter/material.dart';

import '../../models/accounts_model.dart';

class TransactionsScreen extends StatelessWidget {
  final AccountsData data;
  const TransactionsScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data!.balance!.toString()),
      ),
    );
  }
}
