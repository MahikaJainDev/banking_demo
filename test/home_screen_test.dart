import 'package:banking_demo/blocs/home_bloc/home_data_bloc.dart';
import 'package:banking_demo/blocs/home_bloc/home_data_state.dart';
import 'package:banking_demo/models/home_data_model.dart';
import 'package:banking_demo/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('HomeScreen UI Test', (WidgetTester tester) async {
    // Create a mock Home model
    final mockHome = HomeData.fromJson({
      'name': 'John Doe',
      'currency': 'USD',
      'accountNumber': '1234567890',
      'balance': 1000.0,
      'address': {
        'city': 'City',
        'state': 'State',
        'zipCode': '12345'
      },
    'recentTransactions': [
    {'description': 'Transaction 1', 'amount': 50.0},
    {'description': 'Transaction 2', 'amount': -20.0},
    ],
    'upcomingBills': [
    {'description': 'Bill 1', 'amount': 100.0},
    {'description': 'Bill 2', 'amount': 150.0}
      ],
    });

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: BlocProvider<HomeDataCubit>(
        create: (_) => HomeDataCubitMock(mockHome),
        child: HomeScreen(),
      ),
    ));

    // Wait for the widget to be rebuilt.
    await tester.pumpAndSettle();

    // Verify that the Loaded State is displayed
    expect(find.text('Hello, John Doe'), findsOneWidget);
    expect(find.text('Account Number\n1234567890'), findsOneWidget);
    expect(find.text('Balance\nUSD 1000.0'), findsOneWidget);
    expect(find.text('Recent Transactions'), findsOneWidget);
    expect(find.text('Transaction 1'), findsOneWidget);
    expect(find.text('Transaction 2'), findsOneWidget);
    expect(find.text('Upcoming Bills'), findsOneWidget);
    expect(find.text('Bill 1'), findsOneWidget);
    expect(find.text('Bill 2'), findsOneWidget);
  });
}

class HomeDataCubitMock extends HomeDataCubit {
  final HomeData mockHome;

  HomeDataCubitMock(this.mockHome) : super();

  @override
  HomeDataState buildState() {
    // Return a mock HomeDataLoadedState with the provided mockHome
    return HomeDataLoadedState(mockHome);
  }
}
