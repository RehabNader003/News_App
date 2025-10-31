import 'package:flutter/material.dart';
import 'package:news_app/views/Home.dart';
import 'core/style/app_theme.dart';

void main() {
  runApp(const NewslyApp());
}

class NewslyApp extends StatelessWidget {
  const NewslyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Newsly',
      theme: AppTheme.lightTheme,
      home:  HomeSccreen(),
    );
  }
}