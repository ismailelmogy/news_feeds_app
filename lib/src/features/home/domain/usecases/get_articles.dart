import 'package:dartz/dartz.dart';
import '../../../../core/utils/app_strings.dart';
import '../entities/article.dart';
import '../repositories/articles_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetArticles implements UseCase<List<Article>, NoParams> {
  final ArticlesRepository articlesRepository;
  GetArticles({required this.articlesRepository});

  @override
  Future<Either<Failure, List<Article>>> call(NoParams noParams) async {
    try {
      var associatedPressArticles = await articlesRepository.getArticles(
          source: AppStrings.associatedPress);
      var theNextWebArticles =
          await articlesRepository.getArticles(source: AppStrings.theNextWeb);
      Either<Failure, List<Article>> combinedArticles =
          associatedPressArticles.fold(
        (failure) => Left(failure),
        (associatedPressList) => theNextWebArticles.fold(
          (failure) => Left(failure),
          (theNextWebList) => Right(associatedPressList + theNextWebList),
        ),
      );
      return combinedArticles;
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
