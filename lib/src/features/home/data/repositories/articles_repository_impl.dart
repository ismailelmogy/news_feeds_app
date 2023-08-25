import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/app_strings.dart';
import '../../domain/entities/article.dart';
import '../../domain/repositories/articles_repository.dart';
import '../datasources/articles_remote_data_source.dart';

class ArticlesRepositoryImpl implements ArticlesRepository {
  final ArticlesRemoteDataSource articlesRemoteDataSource;
  ArticlesRepositoryImpl({required this.articlesRemoteDataSource});
  @override
  Future<Either<Failure, List<Article>>> getArticles(
      {required String source}) async {
    try {
      final response =
          await articlesRemoteDataSource.getArticles(source: source);
      return Right(response);
    } on NoInternetConnectionException catch (_) {
      return const Left(
          ServerFailure(message: AppStrings.noInternetConnection));
    } on InternalServerErrorException catch (_) {
      return const Left(ServerFailure(message: AppStrings.internalServerError));
    } on FormatException catch (_) {
      return const Left(
          ServerFailure(message: AppStrings.errorOccurredDuringReadingData));
    } catch (exception) {
      return const Left(ServerFailure(message: AppStrings.somethingWentWrong));
    }
  }
}
