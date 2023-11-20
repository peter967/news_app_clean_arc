import 'package:news_app_clean_arc/core/resources/data_state.dart';
import 'package:news_app_clean_arc/features/daily_news/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticles();
}
