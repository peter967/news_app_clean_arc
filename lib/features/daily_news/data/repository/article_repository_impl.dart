import 'package:news_app_clean_arc/core/resources/data_state.dart';

import 'package:news_app_clean_arc/features/daily_news/domain/entities/article.dart';

import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  @override
  Future<DataState<List<ArticleEntity>>> getNewsArticles() {
    // TODO: implement getNewsArticles
    throw UnimplementedError();
  }
}
