import 'package:flutter/material.dart';

import '../model/news_model.dart';

class NewsDetailsBody extends StatelessWidget {
  final NewsMyModel newsItem;
  const NewsDetailsBody({super.key, required this.newsItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(newsItem.image!),
              ),
              const SizedBox(width: 8.0),
              Text(
                newsItem.channel!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            'asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as asd asd asd asd sad asd asd asd asd as',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
