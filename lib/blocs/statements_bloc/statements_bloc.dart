import 'package:banking_demo/blocs/statements_bloc/statement_state.dart';
import 'package:banking_demo/models/statement_model.dart';
import 'package:banking_demo/repositories/statement_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatementCubit extends Cubit<StatementState> {
  StatementCubit() : super(StatementLoadingState()) {
    fetchStatementsData();
  }

  StatementRepository statementRepository = StatementRepository();
  final List<StatementData> _statements = [];
  final List<int> _years = [2023,2022,2021,2020,2019];

  void fetchStatementsData() async {
    try{
      List<StatementData>? statements = await statementRepository.fetchStatements();
      if(statements == null) {
        emit(StatementErrorState('Something went wrong!'));
        return;
      }
      _statements.addAll(statements);
      emit(StatementLoadedState(statements, _years, null));
    } catch(ex) {
      emit(StatementErrorState('Something went wrong!'));
    }
  }

  void applyFilter(int? selectedYear){
    if(selectedYear == null){
      return;
    }
    if(selectedYear == -11){
      emit(StatementLoadedState(_statements, _years, null));
      return;
    }
    List<StatementData> temp = [];
    for(StatementData data in _statements){
      if(data.getDateTime.year == selectedYear){
        temp.add(data);
      }
    }
    emit(StatementLoadedState(temp, _years, selectedYear));
  }
}