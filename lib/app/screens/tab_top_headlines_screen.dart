import 'package:flutter/material.dart';
import 'package:news_paper/app/services/services.dart';
import 'package:news_paper/app/widgets/list_news.dart';
import 'package:provider/provider.dart';

class TabTopHeadLines extends StatefulWidget {
  const TabTopHeadLines({Key? key}) : super(key: key);

  @override
  State<TabTopHeadLines> createState() => _TabTopHeadLinesState();
}

class _TabTopHeadLinesState extends State<TabTopHeadLines>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final headlines = Provider.of<NewsService>(context).headlines;
    return Scaffold(
        body: headlines.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListNews(headlines));
  }

  @override
  bool get wantKeepAlive => true;
}
