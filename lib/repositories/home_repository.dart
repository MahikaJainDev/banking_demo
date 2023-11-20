import 'dart:convert';

import 'package:banking_demo/connection/connection.dart';
import 'package:banking_demo/models/home_data_model.dart';
import 'package:banking_demo/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeRepository {
  GraphQLClient _client = clientToQuery();
  HomeDataModel? homeData;

  Future<void> fetchHomeData() async {
    QueryResult result = await _client.query(
      QueryOptions(document: gql(getHomeData))
    );
    if(result.hasException){
      return;
    }
    Map<String, dynamic>? map = result.data;
    if(map == null){
      return;
    }
    print(result.data);
    homeData = HomeDataModel.fromJson(map);
    print(homeData!.home!.name);
  }
}