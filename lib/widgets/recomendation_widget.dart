import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tariq_challenges/components/components.dart';
import 'package:tariq_challenges/responsvie.dart';
import 'package:tariq_challenges/screens/recommendation_screen.dart';
import '../cubit/cubit.dart';
import '../helper/sp_helper/sp_helper.dart';
import '../model/news_model.dart';
import '../screens/news_details_screen.dart';

class RecommendationItem extends StatelessWidget {
  const RecommendationItem({Key? key, required this.newsItem,}) : super(key: key);
  final NewsMyModel newsItem;
  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.get(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.h),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.network(
              newsItem.image!,
              fit: BoxFit.cover,
              // height: 120.h,
              // width: 150.w,
              height: AppResponsive.isDesktop(context)
                  ? MediaQuery.of(context).size.height * 0.33
                  : MediaQuery.of(context).size.height * 0.15,
              width: AppResponsive.isDesktop(context)
                  ? MediaQuery.of(context).size.height * 0.50
                  : MediaQuery.of(context).size.height * 0.20
            ),
          ),
        ),
        SizedBox(
          width: 16.0.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    newsItem.category!,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  Spacer(),
                  // TextButton(
                  //     onPressed: ()
                  //     {
                  //
                  //     }, child: FaIcon(Icons.bookmark,))
                ],
              ),
              SizedBox(height: 8.0.h),
              Text(
                newsItem.title!,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge,maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.0.h),
              Text(
                  '${newsItem.channel} • ${newsItem.hours} hours ago',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!.copyWith(color: Colors.grey)
              ),
            ],
          ),
        )
      ],
    );
  }
}
