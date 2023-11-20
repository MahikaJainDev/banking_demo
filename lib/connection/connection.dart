import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

// class GraphQLClientProvider {
//   static final HttpLink httpLink = HttpLink('http://192.168.29.18:4000/');
//
//   static ValueNotifier<GraphQLClient> client = ValueNotifier(
//     GraphQLClient(
//       link: httpLink,
//       cache: GraphQLCache(store: InMemoryStore())
//     ),
//   );
// }

final HttpLink httpLink = HttpLink('http://192.168.29.18:4000/');

GraphQLClient clientToQuery() {
  return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore())
  );
}