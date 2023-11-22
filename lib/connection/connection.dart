import 'package:graphql_flutter/graphql_flutter.dart';

import '../main.dart';

final HttpLink httpLink = HttpLink(baseUrl);

GraphQLClient clientToQuery() {
  return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore())
  );
}