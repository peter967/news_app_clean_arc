import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_app_clean_arc/core/constants/constants.dart';
import 'package:news_app_clean_arc/core/resources/data_state.dart';
import 'package:news_app_clean_arc/features/daily_news/data/data_sources/remote/news_api_service.dart';

import 'package:news_app_clean_arc/features/daily_news/domain/entities/article.dart';

import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;

  ArticleRepositoryImpl(this._newsApiService);
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticles(
        apiKey: apiKey,
        country: country,
        category: categoryQuery,
      );
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioError(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioErrorType.response,
            requestOptions: httpResponse.response.requestOptions,
          ),
        );
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
