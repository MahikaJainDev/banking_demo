import 'package:banking_demo/connection/connection.dart';
import 'package:banking_demo/models/home_data_model.dart';
import 'package:banking_demo/others/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeRepository {
  final GraphQLClient _client = clientToQuery();

  Future<HomeDataModel?> fetchHomeData() async {
    QueryResult result = await _client.query(
      QueryOptions(document: gql(getHomeData))
    );
    if(result.hasException){
      return null;
    }
    Map<String, dynamic>? map = result.data;
    if(map == null){
      return null;
    }
    return HomeDataModel.fromJson(map);
  }
}