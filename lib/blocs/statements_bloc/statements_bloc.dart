import 'package:banking_demo/blocs/statements_bloc/statement_state.dart';
import 'package:banking_demo/models/statement_model.dart';
import 'package:banking_demo/repositories/statement_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatementCubit extends Cubit<StatementState> {
  StatementCubit() : super(StatementLoadingState()) {
    fetchStatementsData();
  }

  StatementRepository statementRepository = StatementRepository();

  void fetchStatementsData() async {
    try{
      List<StatementsData>? statementsData = await statementRepository.fetchStatements();
      if(statementsData == null) {
        emit(StatementErrorState('Something went wrong!'));
        return;
      }
      emit(StatementLoadedState(statementsData));
    } catch(ex) {
      emit(StatementErrorState('Something went wrong!'));
    }
  }
}