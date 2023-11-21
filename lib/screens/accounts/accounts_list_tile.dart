import 'package:banking_demo/models/accounts_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/rich_text_widget.dart';

class AccountsListTile extends StatelessWidget {
  final AccountsData data;
  final VoidCallback? onTap;

  const AccountsListTile({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildRichText(context, 'Account Number', data.getAccountNumber),
            buildRichText(context, 'Account Type', data.getAccountType),
            buildRichText(context, 'Balance', data.getAccountBalance.toStringAsFixed(2)),
            buildRichText(context, 'Account Holder', data.getAccountHolder),
          ],
        ),
      ),
    ),
  );
}
