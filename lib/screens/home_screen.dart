import 'package:banking_demo/queries.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home screen'),
      ),
      body: Query(
        options: QueryOptions(
          document: gql(getHomeData),
        ),
        builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
          if (result.hasException) {
            print(result.exception);
            return Center(
              child: Text(result.exception.toString()),
            );
          }
          if(result.isLoading) {
            return const Center(
            child: CircularProgressIndicator(),
            );
    }
            final homeData = result.data!['home'];
            return Center(
              child: Text(homeData['name'].toString()),
            );
          }
      ),
    );
  }
}
