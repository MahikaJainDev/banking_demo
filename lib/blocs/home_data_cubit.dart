import 'package:banking_demo/blocs/home_data_state.dart';
import 'package:banking_demo/models/home_data_model.dart';
import 'package:banking_demo/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDataCubit extends Cubit<HomeDataState> {
  HomeDataCubit() : super(HomeDataLoadingState()){
    fetchHome();
  }

  HomeRepository homeRepository = HomeRepository();

  void fetchHome() async {
    try {
      HomeDataModel? homeData = await homeRepository.fetchHomeData();
      if(homeData == null){
        emit(HomeDataErrorState("Something went wrong!"));
        return;
      }
      emit(HomeDataLoadedState(homeData));
    } catch(ex) {
      emit(HomeDataErrorState("Something went wrong!"));
    }
  }
}
