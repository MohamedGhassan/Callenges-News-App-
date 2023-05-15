import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tariq_challenges/cubit/cubit.dart';
import 'package:tariq_challenges/helper/sp_helper/sp_helper.dart';
import 'package:tariq_challenges/widgets/recomendation_widget.dart';

import '../theme.dart';

class BookMarksScreen extends StatefulWidget {
  const BookMarksScreen({Key? key}) : super(key: key);

  @override
  State<BookMarksScreen> createState() => _BookMarksScreenState();
}

class _BookMarksScreenState extends State<BookMarksScreen> {
  // @override
  // initState()
  // {
  //   super.initState();
  //   SharedPreferencesController.getBookmarks();
  // }

  @override
  Widget build(BuildContext context) {
    // final favoriteItem = news.where((item) => item.isFavorite == true);
    NewsCubit cubit = NewsCubit.get(context);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: !cubit.model ? darkHeaderClr : white,
      //   leading: CircleAvatar(
      //       radius: 25,
      //       backgroundColor: !cubit.model ? Colors.grey.withOpacity(0.1) : Colors.white.withOpacity(0.1),
      //
      //       child: IconButton(
      //           onPressed: () {
      //             ZoomDrawer.of(context)!.toggle();
      //           },
      //           icon: Icon(
      //             Icons.menu,
      //             size: 25,
      //             color: !cubit.model ? white : darkGreyClr,
      //           ))),
      //   title: Text('Bookmarks',
      //       style: Theme.of(context).textTheme.titleLarge!.copyWith(
      //             color: !cubit.model ? white : darkGreyClr,
      //           )),
      //   // actions: [
      //   //   PopupMenuButton<int>(
      //   //       shape: RoundedRectangleBorder(
      //   //           borderRadius: BorderRadius.circular(10)),
      //   //       elevation: 8,
      //   //       tooltip: 'Menu',
      //   //       icon: Icon(Icons.more_vert),
      //   //       iconSize: 24,
      //   //       offset: Offset(0, 40),
      //   //       onSelected: (value) {
      //   //         print('Value: $value');
      //   //       },
      //   //       onCanceled: () {
      //   //         print('Nothing Selecting');
      //   //       },
      //   //       enabled: true,
      //   //       itemBuilder: (context) {
      //   //         return [
      //   //           PopupMenuItem(
      //   //             child: Text('About'),
      //   //             value: 1,
      //   //             enabled: false,
      //   //             onTap: () {},
      //   //             padding: EdgeInsets.all(10),
      //   //             height: 20,
      //   //           ),
      //   //           PopupMenuItem(
      //   //             child: Text('Privicy'),
      //   //             value: 2,
      //   //           ),
      //   //           PopupMenuItem(
      //   //             child: Text('Contact Us'),
      //   //             value: 3,
      //   //           ),
      //   //         ];
      //   //       })
      //   // ],
      // ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: ()
                    {
                      // SharedPreferencesController.getBookmarks();

                    },
                    child: Text('Bookmarks',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                            color: !cubit.model ? white : darkGreyClr,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Column(
                    children: cubit.favoriteItem
                        .map((favoritedItem) => Padding(
                      padding:
                      const EdgeInsets.symmetric(vertical: 8.0),
                      child:
                      RecommendationItem(newsItem: favoritedItem),
                    ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
