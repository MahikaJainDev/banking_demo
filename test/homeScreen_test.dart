import 'package:banking_demo/blocs/home_bloc/home_data_bloc.dart';
import 'package:banking_demo/blocs/home_bloc/home_data_state.dart';
import 'package:banking_demo/models/home_data_model.dart';
import 'package:banking_demo/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeDataCubit extends Mock implements HomeDataCubit {}

void main() {
  group('HomeScreen Widget Test', () {
    late MockHomeDataCubit mockCubit;

    setUp(() {
      mockCubit = MockHomeDataCubit();
    });

    testWidgets('Renders loading state', (WidgetTester tester) async {
      when(() => mockCubit.state).thenReturn(HomeDataLoadingState());

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockCubit,
            child: const HomeScreen(name: 'John'),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('Renders error state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockCubit,
            child: const HomeScreen(name: 'John'),
          ),
        ),
      );
      await tester.pumpAndSettle();
      when(() => mockCubit.state).thenReturn(HomeDataErrorState('Err'));
      expect(find.text('Something went wrong!'), findsOneWidget);
    });

    testWidgets('Renders loaded state', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: mockCubit,
            child: const HomeScreen(name: 'John'),
          ),
        ),
      );

      final mockData = HomeData.fromJson({
        "name": "John Doe",
        "accountNumber": "1234567890",
        "balance": 2500.5,
        "currency": "USD",
      });
      await tester.pumpAndSettle();
       when(() => mockCubit.state).thenReturn(HomeDataLoadedState(mockData));
       await Future.delayed(const Duration(seconds: 1));
      await tester.pumpAndSettle();

      //await Future.delayed(const Duration(seconds: 1));
      expect(find.text('Hello, John'), findsOneWidget);
      expect(find.text('Account Number'), findsOneWidget);
      expect(find.text('${mockData.getAccountNumber}'), findsOneWidget);
      expect(find.text('Balance'), findsOneWidget);
      expect(find.text('${mockData.getCurrency} ${mockData.getBalance}'), findsOneWidget);
      expect(find.text('Address'), findsOneWidget);
      expect(find.text(mockData.getAddress.toString()), findsOneWidget);

      expect(find.text('Recent Transactions'), findsOneWidget);
      expect(find.text('Upcoming Bills'), findsOneWidget);
    });
  });
}
