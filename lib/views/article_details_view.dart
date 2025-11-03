import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/core/style/app_colors.dart';
import 'package:news_app/views/article_web_view.dart';

class ArticleDetailsView extends StatelessWidget {
  final ArticleModel article;

  const ArticleDetailsView({super.key, required this.article});



  @override
  Widget build(BuildContext context) {
    final date = article.publishedAt != null
        ? DateFormat('MMM d, yyyy - h:mm a').format(DateTime.parse(article.publishedAt!))
        : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Article'),

      ),
      body: CustomScrollView(
        slivers: [
          if (article.imagePath != null)
            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                child: Image.network(
                  article.imagePath!,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 250,
                    color: Colors.grey[300],
                    child: const Icon(Icons.broken_image, size: 60),
                  ),
                ),
              ),
            ),

          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                // Source & Date
                if (article.sourceName != null || date != null)
                  Row(
                    children: [
                      if (article.sourceName != null)
                        Chip(
                          label: Text(
                            article.sourceName!,
                            style: const TextStyle(fontSize: 12),
                          ),
                          backgroundColor: AppColors.primary.withOpacity(0.1),
                        ),
                      const SizedBox(width: 8),
                      if (date != null)
                        Text(
                          date,
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                    ],
                  ),
                const SizedBox(height: 12),

                // Title
                Text(
                  article.title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // Description
                if (article.description != null) ...[
                  Text(
                    article.description!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                ],

                // Content
                if (article.content != null)
                  Text(
                    article.content!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                else
                  const Text(
                    "No full content available.",
                    style: TextStyle(color: Colors.grey),
                  ),

                const SizedBox(height: 20),

                // Read Full Article Button
                // في ArticleDetailsView.dart → داخل SliverChildListDelegate
                if (article.url != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ArticleWebView(
                                url: article.url!,
                                title: article.title,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.open_in_browser),
                        label: const Text("Open Full Article"),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}