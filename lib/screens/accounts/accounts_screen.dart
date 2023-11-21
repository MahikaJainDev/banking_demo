import 'package:banking_demo/blocs/accounts_bloc/accounts_bloc.dart';
import 'package:banking_demo/blocs/accounts_bloc/accounts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'accounts_list_tile.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
    create: (context) => AccountsCubit(),
    child: BlocBuilder<AccountsCubit, AccountsState>(
      builder: (context, state) {
        if(state is AccountsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if(state is AccountsErrorState) {
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
        if(state is! AccountsLoadedState) {
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
                (context, index) => AccountsListTile(
                  data: state.accountsData[index],
                  onTap: () => context.push('/transactions', extra: state.accountsData[index])
                ),
                childCount: state.accountsData.length
              ),
            )
          ],
        );
      },
    ),
  );
}