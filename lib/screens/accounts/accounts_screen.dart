import 'package:banking_demo/blocs/accounts_bloc/accounts_bloc.dart';
import 'package:banking_demo/blocs/accounts_bloc/accounts_state.dart';
import 'package:banking_demo/models/accounts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountsCubit, AccountsState>(
      builder: (context, state) {
        if(state is AccountsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        print('state is : $state');
        if(state is AccountsErrorState) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
        if(!(state is AccountsLoadedState)) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
        return CustomScrollView(
          slivers: [
            const SliverAppBar(
            title: Text('Accounts'),
        ),
            SliverList(
            delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(
              padding: const EdgeInsets.only(
                  left: 8.0,
              right: 8.0,
                bottom: 8.0
              ),
              child: _AccountsTile(
                  data: state.accountsData[index],
                onTap: (){
                    context.go('/transactions', extra: state.accountsData[index]);
                },
              ),
            ),
              childCount: state.accountsData.length
        ),
        )
          ],
        );
    },
    );
  }
}

class _AccountsTile extends StatelessWidget {
  final AccountsData data;
  final VoidCallback onTap;
  const _AccountsTile({super.key, required this.data, required this.onTap});

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
