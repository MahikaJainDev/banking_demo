import 'package:banking_demo/blocs/statements_bloc/statement_state.dart';
import 'package:banking_demo/blocs/statements_bloc/statements_bloc.dart';
import 'package:banking_demo/others/extension_methods.dart';
import 'package:banking_demo/models/statement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class StatementsScreen extends StatelessWidget {
  const StatementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<StatementCubit, StatementState>(
        builder: (context, state) {
          if (state is StatementLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is StatementErrorState) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }
          if (state is! StatementLoadedState) {
            return const Center(
              child: Text('Something went wrong!'),
            );
          }
          return CustomScrollView(
            slivers: [
              const SliverAppBar(
                title: Text('Statements'),
                primary: true,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  Center(
                    child: DropdownButton<int>(
                      hint: const Text('Select Date Filter'),
                      items: [
                        const DropdownMenuItem<int>(
                          value: -11,
                          child: Text('Clear'),
                        ),
                        ...state.years.map((e) => DropdownMenuItem<int>(
                          value: e,
                          child: Text(e.toString()),
                        )).toList()
                      ],
                      value: state.selectedYear,
                      onChanged: (int? value) => context.read<StatementCubit>().applyFilter(value)
                    ),
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _StatementListTile(
                    data: state.statementsData[index],
                    onTap: () => context.push('/pdfScreen'),
                  ),
                  childCount: state.statementsData.length
                )
              )
            ],
          );
        },
      ),
    );
  }
}

class _StatementListTile extends StatelessWidget {
  const _StatementListTile(
      {required this.data, required this.onTap});

  final StatementData data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Card(
        elevation: 0.5,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildText(context, 'Date', '\n${data.getDateTime.asString(addYear: true, addWeekDay: true)}'),
                    _buildText(context, 'Amount', '\n${data.getAmount.toStringAsFixed(2)}'),
                  ],
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Text(
                  data.getDescription,
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

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
