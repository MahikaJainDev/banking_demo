import 'package:banking_demo/models/accounts_model.dart';
import 'package:banking_demo/repositories/accounts_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Retrieve list of Accounts test', () async {
    final AccountsRepository accountsRepository = AccountsRepository();

    final List<AccountsData>? list = await accountsRepository.fetchAccounts();

    expect(list, isList);
  });
}