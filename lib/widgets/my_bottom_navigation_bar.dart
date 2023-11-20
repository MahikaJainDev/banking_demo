import 'package:banking_demo/screens/home_screen.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        HomeScreen(),
        Center(child: Text('Accounts')),
        Center(child: Text('services'))
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
