import 'package:banking_demo/others/routes.dart';
import 'package:flutter/material.dart';

String baseUrl = 'http://192.168.29.18:4000/';

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
