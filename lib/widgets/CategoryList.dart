import 'package:flutter/material.dart';

import '../core/style/app_colors.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  final List<String> _categories = const [
    'All',
    'Politics',
    'Sports',
    'Technology',
    'Health',
    'Entertainment',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          itemCount: _categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Chip(
                label: Text(_categories[index]),
                backgroundColor: AppColors.primary.withOpacity(0.1),
                labelStyle: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: AppColors.primary.withOpacity(0.3)),
                ),
              ),
            );
          }
        ),
    );
  }
}