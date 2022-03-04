import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_paper/app/screens/screens.dart';
import 'package:news_paper/app/services/services.dart';
import 'package:news_paper/app/themes/theme_dart.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const NewsPaper());
}

class NewsPaper extends StatelessWidget {
  const NewsPaper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeDark,
          title: 'Material App',
          home: const TabsScreen()),
    );
  }
}
