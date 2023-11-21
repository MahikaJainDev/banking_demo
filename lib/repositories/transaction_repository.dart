
import 'package:banking_demo/connection/connection.dart';
import 'package:banking_demo/models/transaction_model.dart';
import 'package:banking_demo/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class TransactionsRepository {
  GraphQLClient _client = clientToQuery();

  Future<List<TransactionsData>?> fetchTransactions() async {
    QueryResult result = await _client.query(
        QueryOptions(document: gql(getTransactions))
    );
    if(result.hasException){
      return null;
    }
    Map<String, dynamic>? map = result.data;
    if(map == null){
      return null;
    }
    List<TransactionsData> list = [];
    for(Map<String, dynamic> element in map['transactions']){
      list.add(TransactionsData.fromJson(element));
    }
    return list;
  }
}