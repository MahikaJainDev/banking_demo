import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Services'),
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
          _ServicesTile(label: 'Statements', onTap: () => context.push('/statements')),
          _ServicesTile(label: 'Contacts', onTap: () => context.push('/contacts')),
        ],
      ),
    );
  }
}

class _ServicesTile extends StatelessWidget {
  const _ServicesTile({required this.label, required this.onTap});

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

