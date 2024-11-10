import 'dart:io';

import 'package:blog/core/constants/constants.dart';
import 'package:blog/core/resources/data_state.dart';
import 'package:blog/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:blog/features/daily_news/data/models/article.dart';
import 'package:blog/features/daily_news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getArticles() async {
    try {
      final httpResponse = await _newsApiService.getArticles(
        apiKey: NEWS_API_KEY,
        country: NEWS_API_COUNTRY,
        category: NEWS_API_CATEGORY,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(
          DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioException catch (e) {
      return DataError(e);
    }
  }
}
