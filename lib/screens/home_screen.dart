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
          document: gql("""query getHome {
          home {
          name
          accountNumber
          balance
          currency
          address {
          streetName
          buildingNumber
          townName
          postCode
          country
          }
          recentTransactions {
          date
          description
          amount
          fromAccount
          toAccount
          }
          upcomingBills {
          date
          description
          amount
          fromAccount
          toAccount
          }
          }
      }"""),
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
