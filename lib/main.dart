import 'package:banking_demo/blocs/accounts_bloc/accounts_bloc.dart';
import 'package:banking_demo/blocs/contacts_bloc/contacts_bloc.dart';
import 'package:banking_demo/blocs/home_bloc/home_data_bloc.dart';
import 'package:banking_demo/blocs/statements_bloc/statements_bloc.dart';
import 'package:banking_demo/blocs/transactions_bloc/transaction_bloc.dart';
import 'package:banking_demo/others/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      title: 'Banking Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff31a062)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
