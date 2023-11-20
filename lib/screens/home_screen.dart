import 'package:banking_demo/blocs/home_data_state.dart';
import 'package:banking_demo/models/home_data_model.dart';
import 'package:banking_demo/widgets/upcoming_bills.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home_data_cubit.dart';
import '../widgets/recent_transactions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      if (!(state is HomeDataLoadedState)) {
        return const Center(
          child: Text('Something went wrong!'),
        );
      }
      Home data = state.homeData.home!;
      return CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Hello, '),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Account Number:',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text('${data.accountNumber}')
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                Text(
                                  'Balance:',
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text('${data.balance} ${data.currency}')
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Address: ',
                              style: Theme.of(context).textTheme.titleSmall,
                              children: [
                                TextSpan(
                                  text:
                                      '${data.address!.buildingNumber}, ${data.address!.streetName}, ${data.address!.townName}, ${data.address!.country}, ${data.address!.postCode}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ]),
          ),
          const SliverAppBar(
            title: Text('Recent Transactions'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                return Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 8.0),
                    child: RecentTransactionsWidget(
                        recentTransactions: data.recentTransactions![i]));
              },
              childCount: data.recentTransactions?.length ?? 0,
            ),
          ),
          const SliverAppBar(
            title: Text('Upcoming Bills'),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, i) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: UpcomingBillsWidget(upcomingBills: data.upcomingBills![i],)
                );
              },
              childCount: data.upcomingBills?.length ?? 0,
            ),
          ),
        ],
      );
    });
  }
}
