import 'package:flutter/material.dart';
import 'package:tariq_challenges/model/news_model.dart';

class NewsArticleCard extends StatelessWidget {
  final NewsMyModel newsArticle;
  final VoidCallback onBookmark;

  NewsArticleCard({
    required this.newsArticle,
    required this.onBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(newsArticle.image!),
          ListTile(
            title: Text(newsArticle.title!),
            subtitle: Text(newsArticle.category!),
            trailing: IconButton(
              icon: Icon(Icons.bookmark),
              onPressed: onBookmark,
            ),
          ),
        ],
      ),
    );
  }
}
