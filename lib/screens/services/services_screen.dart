import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Services'),
      ),
      body: ListView(
        children: [
          _ServicesTile(label: 'Loans', onTap: (){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Center(
                      child: Text(
                          'Error: Something went wrong!'
                      ),
                  ),
              ),
            );
          }),
          _ServicesTile(label: 'Statements', onTap: (){}),
          _ServicesTile(label: 'Contacts', onTap: (){}),
        ],
      ),
    );
  }
}

class _ServicesTile extends StatelessWidget {
  const _ServicesTile({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
            height: 200.0,
            child: Card(
              child: Center(
                child: Text(label,
                style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            )),
      ),
    );
  }
}

