import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news_paper/app/models/models.dart';
import 'package:http/http.dart' as http;

class NewsService with ChangeNotifier {
  final String NEWS_API_URL = dotenv.env['NEWS_API_URL'] ?? '';
  final String NEWS_API_KEY = dotenv.env['NEWS_API_KEY'] ?? '';
  List<Article> headlines = [];
  List<Category> categories = [
    Category(icon: Icons.public_outlined, name: 'general'),
    Category(icon: Icons.business_outlined, name: 'business'),
    Category(icon: Icons.sports_esports_outlined, name: 'entertainment'),
    Category(icon: Icons.health_and_safety, name: 'health'),
    Category(icon: Icons.science_outlined, name: 'science'),
    Category(icon: Icons.sports_gymnastics_outlined, name: 'sports'),
    Category(icon: Icons.integration_instructions_outlined, name: 'technology'),
  ];
  String _categoryActive = 'general';

  Map<String, List<Article>> newsByCategory = {};

  NewsService() {
    getTopHeadlines();
    for (var category in categories) {
      newsByCategory[category.name] = [];
    }
    getNewsByCategory();
  }

  getTopHeadlines() async {
    final uri = Uri.https(NEWS_API_URL, '/v2/top-headlines', {
      'apiKey': NEWS_API_KEY,
      'country': 'co',
    });

    final response = await http.get(uri);
    final newsTopHeadline = newsResponseFromJson(response.body);
    headlines.addAll(newsTopHeadline.articles);

    notifyListeners();
  }

  String get categoryActive => _categoryActive;

  set categoryActive(String category) {
    _categoryActive = category;
    notifyListeners();
  }

  // get news by category
  getNewsByCategory() async {
    if (newsByCategory[categoryActive]!.isNotEmpty) {
      notifyListeners();
      return;
    }

    final uri = Uri.https(NEWS_API_URL, '/v2/top-headlines', {
      'apiKey': NEWS_API_KEY,
      'country': 'co',
      'category': categoryActive,
    });

    final response = await http.get(uri);
    final _newsByCategory = newsResponseFromJson(response.body);
    newsByCategory[categoryActive]?.addAll(_newsByCategory.articles);
    notifyListeners();
  }

  // get news by category of Map newsCategory
  List<Article> getNewsByCategoryMap() {
    return newsByCategory[categoryActive]!;
  }
}
