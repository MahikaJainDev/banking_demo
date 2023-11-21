import '../../models/statement_model.dart';

abstract class StatementState {}

class StatementLoadingState extends StatementState {}

class StatementLoadedState extends StatementState {
  final List<StatementsData> statementsData;

  StatementLoadedState(this.statementsData);
}

class StatementErrorState extends StatementState {
  final String error;

  StatementErrorState(this.error);
}