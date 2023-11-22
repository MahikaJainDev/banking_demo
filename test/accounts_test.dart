import 'package:banking_demo/models/accounts_model.dart';
import 'package:banking_demo/others/queries.dart';
import 'package:banking_demo/repositories/accounts_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mocktail/mocktail.dart';

class MockGraphQLClient extends Mock implements GraphQLClient {}

void main() {
  late AccountsRepository accountsRepository;
  late MockGraphQLClient mockGraphQLClient;

  group('Accounts Test - ', () {

    setUp(() {
      mockGraphQLClient = MockGraphQLClient();
      accountsRepository = AccountsRepository(mockGraphQLClient);
    });

    test('Retrieve list of Accounts test', () async {
      when(
            () => mockGraphQLClient.query(
          QueryOptions(
              document: gql(getAccounts)
          ),
        ),
      ).thenAnswer((_) async {
        return QueryResult(
          data: {
            'accounts': [
              {'id': '1', 'name': 'Account 1'},
              {'id': '2', 'name': 'Account 2'},
            ],
          },
          options: QueryOptions(
            document: gql(getAccounts),
          ),
          source: QueryResultSource.network,
        );
      }
      );
      final List<AccountsData>? list = await accountsRepository.fetchAccounts();

      expect(list, isA<List<AccountsData>>());
    });
  });
}