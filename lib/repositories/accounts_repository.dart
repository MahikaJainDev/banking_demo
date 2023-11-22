import 'package:banking_demo/models/accounts_model.dart';
import 'package:banking_demo/others/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AccountsRepository {
  final GraphQLClient _client;
  List<AccountsData>? accounts;

  AccountsRepository(this._client);

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