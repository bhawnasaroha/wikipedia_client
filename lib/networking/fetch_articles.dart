import './api_provider.dart';
import '../models/article.dart';

class FetchArticles {
  static getArticles() async {
    final articlesData = await ApiProvider().get();
    ArticleModel.articles = List.from(articlesData)
        .map<Article>((item) => Article.fromMap(item))
        .toList();
  }
}
