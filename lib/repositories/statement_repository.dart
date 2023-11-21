import 'package:banking_demo/models/statement_model.dart';
import 'package:banking_demo/others/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../connection/connection.dart';

class StatementRepository {
  final GraphQLClient _client = clientToQuery();
  
  Future<List<StatementData>?> fetchStatements() async {
    QueryResult result = await _client.query(
      QueryOptions(document: gql(getStatements))
    );
    if(result.hasException){
      return null;
    }
    Map<String, dynamic>? map = result.data;
    if(map == null) {
      return null;
    }
    List<StatementData> list = [];
    for(Map<String, dynamic> element in map['statements']) {
      list.add(StatementData.fromJson(element));
    }
    return list;
  }
}