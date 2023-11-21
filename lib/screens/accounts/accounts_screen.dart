import 'package:banking_demo/blocs/accounts_bloc/accounts_bloc.dart';
import 'package:banking_demo/blocs/accounts_bloc/accounts_state.dart';
import 'package:banking_demo/models/accounts_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

        return Center(
          child: Text(state.accountsData.first.accountHolder ?? '*****'),
        );
    },
    );
  }
}
