import 'package:flutter/material.dart';
import 'package:news_paper/app/models/models.dart';
import 'package:news_paper/app/themes/theme_dart.dart';

class CardArticle extends StatelessWidget {
  final Article news;
  const CardArticle(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      decoration: _cardDecoration(),
      child: Column(
        children: <Widget>[
          _ImgCard(news: news),
          _TitleCard(news: news),
          _DescriptionCard(news: news),
          _FooterCard(news: news),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      color: themeDark.primaryColor,
      boxShadow: const [
        BoxShadow(
          color: Colors.black54,
          blurRadius: 2,
          offset: Offset(0, 2),
        ),
      ],
    );
  }
}

class _FooterCard extends StatelessWidget {
  const _FooterCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              const Icon(Icons.access_time, color: Colors.white70),
              const SizedBox(width: 5),
              Text(news.publishedAt.toLocal().toString().substring(0, 16),
                  style: const TextStyle(color: Colors.white70)),
            ]),
            Icon(Icons.remove_red_eye_outlined,
                color: Theme.of(context).colorScheme.primary),
          ],
        ));
  }
}

class _DescriptionCard extends StatelessWidget {
  const _DescriptionCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      child: Text(
        news.description ?? '',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.white70,
        ),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  const _TitleCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Text(
          news.title,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ));
  }
}

class _ImgCard extends StatelessWidget {
  const _ImgCard({
    Key? key,
    required this.news,
  }) : super(key: key);

  final Article news;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: news.urlToImage == null
          ? Image.asset('assets/no-image.png')
          : FadeInImage(
              placeholder: const AssetImage('assets/giphy.gif'),
              image: NetworkImage(news.urlToImage ?? '')),
    );
  }
}
