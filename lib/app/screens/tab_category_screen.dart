import 'package:flutter/material.dart';
import 'package:news_paper/app/models/category_model.dart';
import 'package:news_paper/app/services/services.dart';
import 'package:news_paper/app/widgets/list_news.dart';
import 'package:provider/provider.dart';

class TabCategoryScreen extends StatefulWidget {
  const TabCategoryScreen({Key? key}) : super(key: key);

  @override
  State<TabCategoryScreen> createState() => _TabCategoryScreenState();
}

class _TabCategoryScreenState extends State<TabCategoryScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsService>(context).getNewsByCategoryMap();
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Column(children: [
          const _MenuTopCategories(),
          news.isEmpty
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              : Expanded(child: ListNews(news))
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _MenuTopCategories extends StatelessWidget {
  const _MenuTopCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).categories;
    return SizedBox(
      width: double.infinity,
      height: 110,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final nameCatory = categories[index].name;
          return Padding(
            padding: const EdgeInsets.only(
              left: 6,
              right: 6,
              top: 40,
            ),
            child: Column(
              children: [
                _IconCategoryButtom(category: categories[index]),
                const SizedBox(height: 4),
                Text(nameCatory[0].toUpperCase() + nameCatory.substring(1)),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _IconCategoryButtom extends StatelessWidget {
  const _IconCategoryButtom({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final categoryActive =
        Provider.of<NewsService>(context, listen: false).categoryActive;
    return GestureDetector(
      onTap: () {
        final newsServicer = Provider.of<NewsService>(context, listen: false);
        newsServicer.categoryActive = category.name;
        newsServicer.getNewsByCategory();
      },
      child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
          child: Icon(
            category.icon,
            color: categoryActive == category.name
                ? Theme.of(context).colorScheme.primary
                : Colors.white,
          )),
    );
  }
}
