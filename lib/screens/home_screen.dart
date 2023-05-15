import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tariq_challenges/cubit/cubit.dart';
import 'package:tariq_challenges/screens/news_details_screen.dart';
import 'package:tariq_challenges/widgets/custom_carousal_widget.dart';
import 'package:tariq_challenges/widgets/home_title_widget.dart';
import 'package:tariq_challenges/widgets/recomendation_widget.dart';
import '../model/news_model.dart';
import '../model/news_model_api.dart';
import '../theme.dart';
import '../widgets/app_bar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.get(context);
    ArticlesModel? articles;
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   leading: MenuWidget(),
      //   actions:
      //   [
      //     CircleAvatar(
      //         radius: 25,
      //         backgroundColor: Colors.grey.withOpacity(0.1),
      //         child:
      //         IconButton(onPressed: () {}, icon: const Icon(Icons.search_off,size: 25, color: Colors.black,))),
      //     SizedBox(
      //       width: 10.w,
      //     ),
      //     CircleAvatar(
      //         radius: 25,
      //         backgroundColor: Colors.grey.withOpacity(0.1),
      //         child: IconButton(
      //             onPressed: () {},
      //             icon: const Icon(Icons.notifications_none_outlined,size: 25, color: Colors.black,))),
      //   ],
      //
      // ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 8.0.h),
          child: SingleChildScrollView(
              child: Column(
            children: [
              appBarItem(context),
              SizedBox(
                height: 16.h,
              ),
              const HomeTitleWidget('Breaking News'),
              const SizedBox(height: 8.0),
              CustomCarouselSlider(),
              const SizedBox(height: 16.0),
              const HomeTitleWidget('Recommendation News'),
              const SizedBox(height: 8.0),
              ...news
                  .map((newsItem) => Padding(
                        padding: EdgeInsets.only(bottom: 16.0.h),
                        child: InkWell(
                            onTap: () {
                              final index = news.indexOf(newsItem);
                              Navigator.of(context, rootNavigator: true)
                                  .push(CupertinoPageRoute(
                                      builder: (context) =>
                                          NewsDetailsScreen(index: index)))
                                  .then((value) => setState(() {}));
                            },
                            child: RecommendationItem(newsItem: newsItem)),
                      ))
                  .toList()
            ],
          )),
        ),
      ),
    );
  }

  Widget carousalSlider(ArticlesModel model)
  {
    final _controller = CarouselController();
    int _current = 0;
    NewsCubit cubit = NewsCubit.get(context);
    // final List<ArticlesModel> imageSliders = model.map((item) => ClipRRect(
    //   borderRadius: const BorderRadius.all(Radius.circular(24.0)),
    //   child: Stack(
    //     fit: StackFit.expand,
    //     children: [
    //       Image.network(
    //         item.image!,
    //         fit: BoxFit.fill,
    //         // width: MediaQuery.of(context).size.width / 2,
    //         // width: 1000.0.w,
    //       ),
    //       Positioned(
    //         top: 10.0.h,
    //         left: 20.0.w,
    //         child: DecoratedBox(
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(16.0),
    //             color: Theme.of(context).primaryColor,
    //           ),
    //           child: Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(
    //               item.category!,
    //               style: const TextStyle(color: Colors.white),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Positioned(
    //         bottom: 0.0,
    //         left: 0.0,
    //         right: 0.0,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 20.0.w),
    //               child: Text(
    //                 '${item.channel} • ${item.hours} hours ago',
    //                 style: const TextStyle(
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.w500
    //                 ),
    //               ),
    //             ),
    //             Container(
    //               width: double.infinity,
    //               // height: AppResponsive.isMobile(context) ? 70.h : 70.h,
    //               decoration: const BoxDecoration(
    //                   gradient: LinearGradient(
    //                     colors: [
    //                       Color.fromARGB(200, 0, 0, 0),
    //                       Color.fromARGB(0, 0, 0, 0)
    //                     ],
    //                     begin: Alignment.bottomCenter,
    //                     end: Alignment.topCenter,
    //                   )
    //               ),
    //               padding: EdgeInsets.symmetric(vertical: 8.0.h ,horizontal: 20.0.w),
    //               child: Text(
    //                 item.title!,
    //                 style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: AppResponsive.isMobile(context) ? 18.0.sp : 20.0.sp,
    //                     fontWeight: FontWeight.bold),
    //                 maxLines: 2,
    //               ),
    //             )
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // )).toList();
    return Column(
      children: [
        CarouselSlider(
          items: model.articles
              !.map(
                (e) =>
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.9),
                          BlendMode.dstATop),
                      image: NetworkImage('${e.urlToImage}'),
                    ),
                  ),

                  // ),
                ),
          )
              .toList(),
          options: CarouselOptions(
            height: 100,
            initialPage: 0,
            viewportFraction: 1.0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: news.asMap().entries.map((entry)
          {
            return Container(
              height: 12.0.h,
              width: _current == entry.key ? 25.0.h : 12.0.h,
              margin: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 4.0.w),
              decoration: BoxDecoration(
                borderRadius: _current == entry.key
                    ? BorderRadius.circular(8.0)
                    : null,
                shape: _current == entry.key
                    ? BoxShape.rectangle
                    : BoxShape.circle,
                color: _current == entry.key
                    ? !cubit.model ? white : bluishClr
                // Theme.of(context).primaryColor
                    : !cubit.model ? Colors.white.withOpacity(0.3) : Colors.grey.withOpacity(0.3),
                // Colors.grey.withOpacity(0.3),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}
