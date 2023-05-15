import 'package:flutter/material.dart';

import '../model/news_model.dart';
import '../widgets/news_details_appbar.dart';
import '../widgets/news_details_body.dart';

class NewsDetailsScreen extends StatelessWidget {
  final int index;
  // final NewsModel newsItem;

  const NewsDetailsScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                // SliverPadding(
                //     padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w)),
                NewsDetailsAppBar(index: index),
                SliverToBoxAdapter(
                  child: NewsDetailsBody(
                    newsItem: news[index],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.25,
              child: DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0)
                  ]
              ))),
            ),
          )
        ],
      ),
    );
  }
}
