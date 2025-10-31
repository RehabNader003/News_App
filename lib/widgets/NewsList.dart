// lib/widgets/news_list.dart

import 'package:flutter/material.dart';
import 'package:news_app/services/dummy_news_service.dart';
import 'package:news_app/widgets/news_card.dart';


class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    final news = DummyNewsService.getNews();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return NewsCard(
            news: news[index],
            onTap: () {
              print("pressed on : ${news[index].title}");
            },
          );
        },
        childCount: news.length,
      ),
    );
  }
}