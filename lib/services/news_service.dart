import 'package:dio/dio.dart';

import '../models/article_model.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<ArticleModel>>getNews({required String category}) async {
    try {
      Response response = await dio.get(
          "https://newsapi.org/v2/top-headlines?apiKey=1133cfa01edb40018f018e4ab6c32a8c&category=$category");

      var JsonData = response.data;
      List<dynamic> articles = JsonData['articles'];
      List<ArticleModel> articlesList = [];

      for (var article in articles) {
        final source = article['source'] as Map<String, dynamic>?;
        final String? sourceName = source?['name'] as String?;
        ArticleModel articleModel = ArticleModel(
          imagePath: article['urlToImage'],
          title: article['title'],
          description: article['description'],
          content: article['content'],
          url: article['url'],
          publishedAt: article['publishedAt'],
          sourceName: sourceName,
        );
        articlesList.add(articleModel);
      }
      return articlesList;
    }  catch (e) {
      return [];
    }
  }
}
