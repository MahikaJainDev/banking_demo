import 'package:banking_demo/blocs/contacts_bloc/contacts_bloc.dart';
import 'package:banking_demo/blocs/contacts_bloc/contacts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: BlocProvider(
        create: (context) => ContactCubit(),
        child: BlocBuilder<ContactCubit, ContactState>(
          builder: (context, state) {
            if(state is ContactLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is ContactErrorState) {
              return const Center(
                child: Text('No Contacts found!'),
              );
            }
            if(state is! ContactLoadedState){
              return const Center(
                child: Text('No Contacts found!'),
              );
            }
            return Container();
          }
        ),
      ),
    );
  }
}
