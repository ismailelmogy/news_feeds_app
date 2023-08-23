import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_feeds_app/src/features/home/domain/entities/article.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/usecases/get_articles.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetArticles getArticles;
  HomeBloc({required this.getArticles}) : super(HomeInitial()) {
    on<GetArticlesEvent>(_getAllArticles);
  }

  Future<void> _getAllArticles(
    GetArticlesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeIsLoading());
    final response = await getArticles.call(NoParams());
    emit(response.fold((failure) => HomeError(message: failure.message),
        (articles) => HomeLoaded(articles: articles)));
  }
}
