import 'package:flutter/material.dart';
import 'package:news_paper/app/models/models.dart';
import 'package:news_paper/app/widgets/card_article.dart';

class ListNews extends StatelessWidget {
  final List<Article> news;
  const ListNews(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 10),
      itemCount: news.length,
      itemBuilder: (context, index) {
        return CardArticle(news[index]);
      },
    );
  }
}
