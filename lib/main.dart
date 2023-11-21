import 'package:banking_demo/blocs/accounts_bloc/accounts_bloc.dart';
import 'package:banking_demo/blocs/contacts_bloc/contacts_bloc.dart';
import 'package:banking_demo/blocs/home_bloc/home_data_bloc.dart';
import 'package:banking_demo/blocs/transactions_bloc/transaction_bloc.dart';
import 'package:banking_demo/repositories/contact_repository.dart';
import 'package:banking_demo/repositories/transaction_repository.dart';
import 'package:banking_demo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeDataCubit()),
        BlocProvider(create: (context) => AccountsCubit()),
        BlocProvider(create: (context) => TransactionCubit()),
        BlocProvider(create: (context) => ContactCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        title: 'Banking Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff31a062)),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
