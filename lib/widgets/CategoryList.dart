// import 'package:flutter/material.dart';
//
// import '../core/style/app_colors.dart';
//
// class CategoryList extends StatelessWidget {
//   const CategoryList({super.key});
//
//   final List<String> _categories = const [
//     'All',
//     'Health',
//     'Sports',
//     'science',
//     'Business',
//     'Technology',
//     'Entertainment',
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         //height: 50,
//         margin: const EdgeInsets.symmetric(vertical: 8.0),
//         child: ListView.builder(
//           scrollDirection: Axis.horizontal,
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           itemCount: _categories.length,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 4.0),
//               child: Chip(
//                 label: Text(_categories[index]),
//                 backgroundColor: AppColors.primary.withOpacity(0.1),
//                 labelStyle: const TextStyle(
//                   color: AppColors.primary,
//                   fontWeight: FontWeight.w800,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   side: BorderSide(color: AppColors.primary.withOpacity(0.3)),
//                 ),
//               ),
//             );
//           }
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:news_app/core/style/app_colors.dart';

class CategoryList extends StatelessWidget {
  final String? selectedCategory;
  final void Function(String) onCategorySelected;

  const CategoryList({
    super.key,
    this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<String> _categories = const [
    'General',
    'Health',
    'Sports',
    'science',
    'Business',
    'Technology',
    'Entertainment',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = category == selectedCategory;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: FilterChip(
              label: Text(
                category[0].toUpperCase() + category.substring(1),
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                ),
              ),
              selected: isSelected,
              selectedColor: AppColors.primary.withOpacity(0.2),
              checkmarkColor: AppColors.primary,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              side: BorderSide(
                color: isSelected
                    ? AppColors.primary
                    : AppColors.primary.withOpacity(0.3),
                width: isSelected ? 2 : 1,
              ),
              onSelected: (_) => onCategorySelected(category),
            ),
          );
        },
      ),
    );
  }
}