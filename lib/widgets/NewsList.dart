
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/ArticleDetailsView.dart';
import 'package:news_app/widgets/news_card.dart';


class NewsList extends StatelessWidget {
  final List<ArticleModel> news;

  const NewsList({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return NewsCard(
            key: ValueKey(news[index].title),
            news: news[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ArticleDetailsView(article: news[index]),
                ),
              );
            },
          );
        },
        childCount: news.length,
      ),
    );
  }
}