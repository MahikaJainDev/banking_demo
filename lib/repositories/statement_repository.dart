import 'package:banking_demo/models/statement_model.dart';
import 'package:banking_demo/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../connection/connection.dart';

class StatementRepository {
  GraphQLClient _client = clientToQuery();
  
  Future<List<StatementsData>?> fetchStatements() async {
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
    List<StatementsData> list = [];
    for(Map<String, dynamic> element in map['statements']) {
      list.add(StatementsData.fromJson(element));
    }
    return list;
  }
}