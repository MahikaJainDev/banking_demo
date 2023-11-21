
import 'package:banking_demo/models/home_data_model.dart';
import 'package:banking_demo/widgets/rich_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/home_bloc/home_data_bloc.dart';
import '../../blocs/home_bloc/home_data_state.dart';
import 'transaction_list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.name});

  final String? name;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDataCubit, HomeDataState>(builder: (context, state) {
      if (state is HomeDataLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is HomeDataErrorState) {
        return const Center(
          child: Text('Something went wrong!'),
        );
      }
      if (state is! HomeDataLoadedState) {
        return const Center(
          child: Text('Something went wrong!'),
        );
      }
      Home data = state.homeData.home!;
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Hello, $name'),
            floating: true,
            primary: true,
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          buildRichText(
                            context,
                            'Account Number',
                            '\n${data.accountNumber}'
                          ),
                          const Spacer(),
                          buildRichText(
                            context,
                            'Balance',
                            '\n${data.currency} ${data.balance}'
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      buildRichText(
                        context,
                        'Address',
                        '${data.address?.buildingNumber}, '
                          '${data.address?.streetName}, '
                          '${data.address?.townName}, '
                          '${data.address?.country}, '
                          '${data.address?.postCode}'
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
           const SliverAppBar(
            title: Text('Recent Transactions'),
            primary: false,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => TransactionListTile(
                transaction: data.recentTransactions![i]
              ),
              childCount: data.recentTransactions?.length ?? 0,
            ),
          ),
          const SliverAppBar(
            title: Text('Upcoming Bills'),
            primary: false,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) => TransactionListTile(
                transaction:
                data.upcomingBills![i]
              ),
              childCount: data.upcomingBills?.length ?? 0,
            ),
          ),
        ],
      );
    });
  }
}
