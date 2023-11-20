import 'package:banking_demo/blocs/home_data_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/home_data_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: BlocBuilder<HomeDataCubit, HomeDataState> (
        builder: (context, state) {
          if(state is HomeDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is HomeDataLoadedState) {
            return Center(
              child: Text(state.homeData.home!.name!),
            );
          }
          return const Center(
            child: Text('Something went wrong!'),
          );
        }
      ),
    );
  }
}
