import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tariq_challenges/cubit/cubit.dart';
import 'package:tariq_challenges/model/news_model.dart';
import 'package:tariq_challenges/responsvie.dart';

import '../theme.dart';

//ignore: must_be_immutable
class CustomCarouselSlider extends StatefulWidget {
  CustomCarouselSlider({Key? key}) : super(key: key);

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final _controller = CarouselController();

  int _current = 0;

  @override
  Widget build(BuildContext context) {
    NewsCubit cubit = NewsCubit.get(context);
    final List<Widget> imageSliders = news.map((item) => ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(24.0)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.network(
            item.image!,
            fit: BoxFit.fill,
            // width: MediaQuery.of(context).size.width / 2,
            // width: 1000.0.w,
          ),
          Positioned(
            top: 10.0.h,
            left: 20.0.w,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Theme.of(context).primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item.category!,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Text(
                    '${item.channel} • ${item.hours} hours ago',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  // height: AppResponsive.isMobile(context) ? 70.h : 70.h,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(200, 0, 0, 0),
                          Color.fromARGB(0, 0, 0, 0)
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      )
                  ),
                  padding: EdgeInsets.symmetric(vertical: 8.0.h ,horizontal: 20.0.w),
                  child: Text(
                    item.title!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: AppResponsive.isMobile(context) ? 18.0.sp : 20.0.sp,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    )).toList();
    return Column(
      children: [
        CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
              // autoPlay: true,
                initialPage: 0,
                aspectRatio: AppResponsive.isMobile(context) ? 2.0 : 2.5,
                enlargeCenterPage: true,
                onPageChanged: (index, reason)
                {
                  setState(()
                  {
                    _current = index;
                  });
                }
            )
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
