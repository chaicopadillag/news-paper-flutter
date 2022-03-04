import 'package:flutter/material.dart';
import 'package:news_paper/app/services/services.dart';
import 'package:provider/provider.dart';

class TabTopHeadLines extends StatelessWidget {
  const TabTopHeadLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return const Center(
      child: Text('Top Headlines'),
    );
  }
}
