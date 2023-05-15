import 'package:flutter/material.dart';
import 'package:tariq_challenges/components/components.dart';
import 'package:tariq_challenges/screens/recommendation_screen.dart';
import 'package:tariq_challenges/widgets/recomendation_widget.dart';
import '../model/news_model.dart';

class HomeTitleWidget extends StatelessWidget {
  final String? title;

  const HomeTitleWidget(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title!,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        TextButton(
          onPressed: ()
          {
           navigateTo(context, RecommendationScreen());
          },
          child: const Text('View All'),
        ),
      ],
    );
  }
}
