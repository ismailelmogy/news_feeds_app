import 'package:news_feeds_app/src/features/home/data/models/article_model.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/commons.dart';
import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_points.dart';

abstract class ArticlesRemoteDataSource {
  Future<List<ArticleModel>> getArticles({required String source});
}

class ArticlesRemoteDataSourceImpl implements ArticlesRemoteDataSource {
  final ApiConsumer apiConsumer;
  ArticlesRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<List<ArticleModel>> getArticles({required String source}) async {
    final response = await apiConsumer.get(EndPoints.articles,
        queryParameters: {
          AppStrings.apiKey: AppStrings.apiKeyValue,
          AppStrings.source: source
        });
    final jsonResponse = Commons.decodeJson(response);
    Iterable iterable = jsonResponse["articles"];
    var articles =
        iterable.map((model) => ArticleModel.fromJson(model)).toList();
    return articles;
  }
}
