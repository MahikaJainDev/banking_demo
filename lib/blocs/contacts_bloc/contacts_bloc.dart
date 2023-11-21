import 'package:banking_demo/blocs/contacts_bloc/contacts_state.dart';
import 'package:banking_demo/models/contacts_model.dart';
import 'package:banking_demo/repositories/contact_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactLoadingState()) {
    fetchContactsData();
  }

  ContactsRepository contactsRepository = ContactsRepository();

  void fetchContactsData() async {
    try {
      List<ContactData>? contactsData = await contactsRepository.fetchContacts();
      if(contactsData == null){
        emit(ContactErrorState("Something went wrong!"));
        return;
      }
      emit(ContactLoadedState(contactsData));
    } catch(ex) {
      emit(ContactErrorState("Something went wrong!"));
    }
  }
}