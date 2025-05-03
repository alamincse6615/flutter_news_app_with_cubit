import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_with_api_demo/cubit/news_cubit_state.dart';
import 'package:flutter_cubit_with_api_demo/model/news_model.dart';
import 'package:flutter_cubit_with_api_demo/service/api_service.dart';

class NewsCubit extends Cubit<NewsCubitState>{
  NewsCubit({required this.apiService}) : super(NewsCubitInit());
  List<NewsModel> newsList = [];
  ApiService apiService;


  void getAllNews()async{
    try{
      emit(NewsCubitLoading(isLoading: true));
      newsList = await apiService.getNews();
      emit(NewsCubitDataLoaded(newsList: newsList));
    }catch(e){
      emit(NewsCubitError(message: e.toString()));
    }
  }
}