import 'package:equatable/equatable.dart';
import 'package:flutter_cubit_with_api_demo/model/news_model.dart';

abstract class NewsCubitState extends Equatable{
    const NewsCubitState();
}
class NewsCubitInit extends NewsCubitState{
  @override
  List<Object?> get props => [];
}
class NewsCubitLoading extends NewsCubitState{
  const NewsCubitLoading({required this.isLoading});
  final bool isLoading;
  @override
  List<Object?> get props => [isLoading];
}
class NewsCubitDataLoaded extends NewsCubitState{
  const NewsCubitDataLoaded({required this.newsList});
  final List<NewsModel> newsList;
  @override
  // TODO: implement props
  List<Object?> get props => [newsList];

}
class NewsCubitError extends NewsCubitState{
  const NewsCubitError({required this.message});
  final String message;
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}