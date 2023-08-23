part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeIsLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Article> articles;
  const HomeLoaded({required this.articles});
  @override
  List<Object?> get props => [articles];
}

class HomeError extends HomeState {
  final String? message;
  const HomeError({this.message});
  @override
  List<Object?> get props => [message];
}
