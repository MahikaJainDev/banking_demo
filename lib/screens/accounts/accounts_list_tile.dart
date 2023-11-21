import 'package:banking_demo/models/accounts_model.dart';
import 'package:flutter/material.dart';

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
            _buildText(context, 'Account Number', data.accountNumber),
            _buildText(context, 'Account Type', data.accountType),
            _buildText(context, 'Balance', data.balance?.toString()),
            _buildText(context, 'Account Holder', data.accountHolder),
          ],
        ),
      ),
    ),
  );

  _buildText(BuildContext context, String title, String? value) => RichText(
    text: TextSpan(
      text: '$title: ',
      style: Theme.of(context).textTheme.titleSmall,
      children: [
        TextSpan(
            text: '$value',
            style: Theme.of(context).textTheme.bodyMedium
        ),
      ],
    ),
  );
}