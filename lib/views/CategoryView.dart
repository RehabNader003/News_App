// views/CategoryView.dart
import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_colors.dart';
import 'package:news_app/widgets/news_list_builder.dart';

class CategoryView extends StatelessWidget {
  final String category;
  const CategoryView({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          category[0].toUpperCase() + category.substring(1),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          NewsListBuilder(category: category),
        ],
      ),
    );
  }
}