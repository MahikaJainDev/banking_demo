import 'package:banking_demo/models/accounts_model.dart';
import 'package:banking_demo/screens/accounts/transactions_screen.dart';
import 'package:banking_demo/screens/services/contacts_screen.dart';
import 'package:banking_demo/screens/services/pdf_screen.dart';
import 'package:banking_demo/screens/services/statements_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/login_screen.dart';
import '../screens/main_screen.dart';
import '../screens/onboarding_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
        GoRoute(
            path: 'bottomNavigationBar',
          builder: (BuildContext context, GoRouterState state) {
              return MainScreen(name: state.extra as String?,);
          }
        ),
        GoRoute(
            path: 'transactions',
            builder: (BuildContext context, GoRouterState state) {
              return TransactionsScreen(data: state.extra as AccountsData);
            }
        ),
        GoRoute(
            path: 'contacts',
            builder: (BuildContext context, GoRouterState state) {
              return const ContactsScreen();
            }
        ),
        GoRoute(
            path: 'statements',
            builder: (BuildContext context, GoRouterState state) {
              return const StatementsScreen();
            }
        ),
        GoRoute(
            path: 'pdfScreen',
            builder: (BuildContext context, GoRouterState state) {
              return const PdfScreen();
            }
        ),
      ],
    ),
  ],
);