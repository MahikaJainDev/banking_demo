import 'package:banking_demo/models/accounts_model.dart';
import 'package:flutter/material.dart';

import '../../widgets/buildText_widget.dart';

class AccountsListTile extends StatelessWidget {
  final AccountsData data;
  final VoidCallback? onTap;

  const AccountsListTile({super.key, required this.data, this.onTap});

  @override
  Widget build(BuildContext context) =>
      Card(
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                buildText(context, 'Account Number', data.accountNumber),
                buildText(context, 'Account Type', data.accountType),
                buildText(context, 'Balance', data.balance?.toString()),
                buildText(context, 'Account Holder', data.accountHolder),
              ],
            ),
          ),
        ),
      );
}
