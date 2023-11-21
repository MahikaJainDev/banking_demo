import '../../models/statement_model.dart';

abstract class StatementState {}

class StatementLoadingState extends StatementState {}

class StatementLoadedState extends StatementState {
  final List<StatementData> statementsData;
  final List<int> years;
  final int? selectedYear;

  StatementLoadedState(this.statementsData, this.years, this.selectedYear);
}

class StatementErrorState extends StatementState {
  final String error;

  StatementErrorState(this.error);
}