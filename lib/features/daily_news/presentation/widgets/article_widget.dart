import 'package:blog/features/daily_news/domain/entities/article.dart';
import 'package:flutter/material.dart';

class ArticleWidget extends StatelessWidget {
  final ArticleEntity? article;
  const ArticleWidget({
    Key? key,
    this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(article!.title, style: const TextStyle(color: Colors.black)),
    );
  }
}
