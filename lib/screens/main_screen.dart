import 'package:banking_demo/screens/accounts/accounts_screen.dart';
import 'package:banking_demo/screens/home/home_screen.dart';
import 'package:banking_demo/screens/services/services_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, this.name});

  final String? name;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(name: widget.name ?? ''),
        const AccountsScreen(),
        const ServicesScreen()
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(3, (i) => BottomNavigationBarItem(
            icon: Image.asset(
              [
                i == _selectedIndex ? 'assets/images/home_selected.png' : 'assets/images/home_unselected.png',
                i == _selectedIndex ? 'assets/images/accounts_selected.png' : 'assets/images/accounts_unselected.png',
                i == _selectedIndex ? 'assets/images/services_selected.png' : 'assets/images/services_unselected.png',
              ][i],
              height: 20.0,
              color: i == _selectedIndex ? Theme.of(context).colorScheme.primary : null,
            ),
            label: [
              'Home',
              'Accounts',
              'Services',
            ][i]
        )),
        currentIndex: _selectedIndex,
        onTap: (int index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}
