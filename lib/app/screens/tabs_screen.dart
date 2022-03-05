import 'package:flutter/material.dart';
import 'package:news_paper/app/providers/providers.dart';
import 'package:news_paper/app/screens/screens.dart';
import 'package:news_paper/app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        body: const _Tabs(),
        bottomNavigationBar: CustomButtomNavigationBar(),
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return PageView(
      // physics: const BouncingScrollPhysics(),
      controller: navigationProvider.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [TabTopHeadLines(), TabCategoryScreen()],
    );
  }
}
