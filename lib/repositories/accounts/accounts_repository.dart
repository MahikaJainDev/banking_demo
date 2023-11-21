
import 'package:banking_demo/connection/connection.dart';
import 'package:banking_demo/models/accounts_model.dart';
import 'package:banking_demo/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AccountsRepository {
  GraphQLClient _client = clientToQuery();
  List<AccountsData>? accounts;

  Future<List<AccountsData>?> fetchAccounts() async {
    QueryResult result = await _client.query(
      QueryOptions(document: gql(getAccounts))
    );
    if(result.hasException){
      return null;
    }
    Map<String, dynamic>? map = result.data;
    if(map == null){
      return null;
    }
    List<AccountsData> list = [];
    for(Map<String, dynamic> element in map['accounts']){
      list.add(AccountsData.fromJson(element));
    }
    return list;
  }
}