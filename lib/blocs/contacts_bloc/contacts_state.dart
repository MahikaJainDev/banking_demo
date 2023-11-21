import 'package:banking_demo/models/contacts_model.dart';

abstract class ContactState {}

class ContactLoadingState extends ContactState {}

class ContactLoadedState extends ContactState {
  final List<ContactData> contactData;

  ContactLoadedState(this.contactData);

}

class ContactErrorState extends ContactState {
  final String error;

  ContactErrorState(this.error);
}