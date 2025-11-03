import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/services/news_service.dart';
import 'package:news_app/widgets/NewsList.dart';


class NewsListBuilder extends StatefulWidget {
  final String category;
  const NewsListBuilder({super.key, required this.category});

  @override
  State<NewsListBuilder> createState() => _NewsListBuilderState();
}

class _NewsListBuilderState extends State<NewsListBuilder> {
  late Future<List<ArticleModel>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _newsFuture = _getGeneralNews();
  }

  Future<List<ArticleModel>> _getGeneralNews() async {
    return await NewsService(Dio()).getNews(category: widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ArticleModel>>(
      future: _newsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return const SliverToBoxAdapter(
            child: Center(
              child: Text(
                "oops, Error: Try later",
                style: TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        final news = snapshot.data!;
        if (news.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(child: Text("No articles found")),
          );
        }
        return NewsList(news: news);
      },
    );
  }
}