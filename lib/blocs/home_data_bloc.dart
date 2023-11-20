import 'package:flutter/material.dart';
import 'package:banking_demo/home_data_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../queries.dart';

abstract class HomeEvent {}

class LoadedHomeData extends HomeEvent {}

class HomeState {}

class HomeLoadedState extends HomeState {
  final HomeDataModel data;

  HomeLoadedState(this.data);
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ValueNotifier<GraphQLClient> clientValueNotifier;
  HomeBloc(this.clientValueNotifier) : super(HomeState());
  HomeDataModel? data;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is LoadedHomeData) {
      yield* _mapLoadedHomeDataToState();
    }
  }

  Stream<HomeState> _mapLoadedHomeDataToState() async* {
    try {
      final GraphQLClient client = clientValueNotifier.value;

      final QueryResult result = await client.query(
        QueryOptions(document: gql(getHomeData)),
      );

      if (result.hasException) {
        print(result.exception);
      } else {
        data = HomeDataModel.fromJson(result.data!['home']);
        yield HomeLoadedState(data!);
      }
    } catch (e) {
      print(e);
    }
  }
}
