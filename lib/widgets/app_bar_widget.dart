import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';import '../cubit/cubit.dart';


import '../theme.dart';

Widget appBarItem(context) {
  NewsCubit cubit = NewsCubit.get(context);
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
            radius: 25,
            backgroundColor: !cubit.model
                ? Colors.grey.withOpacity(0.1)
                : Colors.white.withOpacity(0.1),
            child: IconButton(
                // padding: EdgeInsets.zero,
                //   constraints: BoxConstraints(
                //     minWidth: 0,
                //     // maxWidth: 0
                //   ),
                onPressed: () {
                  ZoomDrawer.of(context)!.toggle();
                },
                icon: Icon(
                  Icons.menu,
                  size: 25,
                  color: !cubit.model ? white : darkGreyClr,
                ))),
        Spacer(),
        CircleAvatar(
            radius: 25,
            backgroundColor: !cubit.model
                ? Colors.grey.withOpacity(0.1)
                : Colors.black.withOpacity(0.1),
            child: IconButton(
                onPressed: () {},
                icon:  Icon(
                  Icons.search_off,
                  size: 25,
                  color: !cubit.model ? white : darkGreyClr,
                ))),
        SizedBox(
          width: 10.w,
        ),
        CircleAvatar(
            radius: 25,
            backgroundColor: !cubit.model
                ? Colors.grey.withOpacity(0.1)
                : Colors.white.withOpacity(0.1),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications_none_outlined,
                  size: 25,
                  color: !cubit.model ? white : darkGreyClr,
                ))),
      ],
    ),
  );
}
