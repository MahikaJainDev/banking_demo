
import 'package:banking_demo/connection/connection.dart';
import 'package:banking_demo/models/contacts_model.dart';
import 'package:banking_demo/queries.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ContactsRepository {
  GraphQLClient _client = clientToQuery();

  Future<List<ContactData>?> fetchContacts() async {
    QueryResult result = await _client.query(
        QueryOptions(document: gql(getContacts))
    );
    if(result.hasException){
      return null;
    }
    Map<String, dynamic>? map = result.data;
    if(map == null){
      return null;
    }
    print(map);
    List<ContactData> list = [];
    for(Map<String, dynamic> element in map['contact'] ?? []){
      list.add(ContactData.fromJson(element));
    }
    return list;
  }
}