import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tariq_challenges/components/components.dart';
import 'package:tariq_challenges/cubit/cubit.dart';
import 'package:tariq_challenges/cubit/states.dart';
import 'package:tariq_challenges/widgets/appbar_icon.dart';

import '../helper/sp_helper/sp_helper.dart';
import '../model/news_model.dart';
import '../screens/book_mark_screen.dart';
import '../screens/bookmark/bookmark_cubit/bookmark_cubit.dart';
import '../screens/bookmark/bookmark_cubit/bookmark_state.dart';

class NewsDetailsAppBar extends StatefulWidget {
  // final NewsModel newsItem;
  final int index;

  const NewsDetailsAppBar({Key? key, required this.index}) : super(key: key);

  @override
  State<NewsDetailsAppBar> createState() => _NewsDetailsAppBarState();
}

class _NewsDetailsAppBarState extends State<NewsDetailsAppBar> {
  NewsMyModel? newsModel;
  List<String> _bookmarks = [];

  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.get(context);
    final size = MediaQuery
        .of(context)
        .size;
    return SliverAppBar(
      expandedHeight: size.height * 0.4,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Padding(
        padding: EdgeInsets.only(left: 8.0.w),
        child: AppBarIcon(
          icon: Icons.chevron_left,
          iconSize: 30.sp,
        ),
      ),
      leadingWidth: 40.w,
      actions: [
        AppBarIcon(
          icon: news[widget.index].isBookmarked
              ? Icons.bookmark
              : Icons.bookmark_border_outlined,
          // Icons.bookmark_border_outlined,
          iconSize: 25.sp,
          onTap: () async {
            setState(() {
              //   SharedPreferences prefs = await SharedPreferences.getInstance();
              //   prefs.setStringList('bookmarks', _bookmarks);
              news[widget.index] = news[widget.index]
                  .copyWith(isFavorite: !news[widget.index].isBookmarked);
              // SharedPreferencesController.saveBookmark(news[widget.index].id);
              navigateTo(context, BookMarksScreen());
              print('dddddddddddddddddd${news[widget.index].id}');
              // SharedPreferencesController.addItem(newsItem);
            }
            );
          },
        ),
        SizedBox(
          width: 6.0.w,
        ),
        AppBarIcon(
          icon: Icons.menu,
          iconSize: 25.sp,
        ),
        SizedBox(
          width: 6.0.w,
        ),
      ],
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
                child: Image.network(
                  news[widget.index].image!,
                  fit: BoxFit.cover,
                )),
            // const Positioned.fill(
            //     child: Opacity(
            //       opacity: 0.15,
            //       child: DecoratedBox(
            //           decoration: BoxDecoration(color: Colors.black)),
            //     )),
            Positioned(
              bottom: 50.h,
              left: 16.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        news[widget.index].category!,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  SizedBox(
                    width: size.width * 0.9,
                    child: Text(
                      news[widget.index].title!,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white),
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(
                    height: 8.0.h,
                  ),
                  Text(
                    '${news[widget.index].channel} • ${news[widget.index]
                        .hours} hours ago',
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.zoomBackground
        ],
      ),
      pinned: true,
      collapsedHeight: size.height * 0.1,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: SizedBox(
            height: 30.h,
            width: size.width,
            child: const DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(36.0))),
              // height: 40.h,
              // width: 40.w,
              // color: Colors.white,
            )),
      ),
    );
  }
}
