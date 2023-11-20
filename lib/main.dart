import 'package:banking_demo/blocs/home_data_cubit.dart';
import 'package:banking_demo/connection/connection.dart';
import 'package:banking_demo/repositories/home_repository.dart';
import 'package:banking_demo/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
