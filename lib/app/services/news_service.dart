import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_paper/app/models/models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  final String NEWS_API_URL = dotenv.env['NEWS_API_URL'] ?? '';
  final String NEWS_API_KEY = dotenv.env['NEWS_API_KEY'] ?? '';
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final uri = Uri.https(NEWS_API_URL, '/v2/top-headlines', {
      'apiKey': NEWS_API_KEY,
      'country': 'mx',
    });

    final response = await http.get(uri);
    final newsRes = newsResponseFromJson(response.body);
    print(newsRes);

    notifyListeners();
  }
}
