import 'package:banking_demo/models/home_data_model.dart';

abstract class HomeDataState {}

class HomeDataLoadingState extends HomeDataState {}

class HomeDataLoadedState extends HomeDataState {
  final HomeDataModel homeData;

  HomeDataLoadedState(this.homeData);
}

class HomeDataErrorState extends HomeDataState {
  final String error;

  HomeDataErrorState(this.error);

}