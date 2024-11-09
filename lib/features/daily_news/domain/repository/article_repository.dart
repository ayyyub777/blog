import 'package:blog/core/resources/data_state.dart';
import 'package:blog/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getArticles();
}
