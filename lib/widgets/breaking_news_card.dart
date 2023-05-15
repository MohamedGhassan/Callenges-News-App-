// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:tariq_challenges/model/news_model.dart';
// import 'package:tariq_challenges/widgets/text_style_widet.dart';
//
// class BreakingNewsCard extends StatefulWidget {
//   BreakingNewsCard(this.newsModel, {Key? key}) : super(key: key);
//   NewsModel? newsModel;
//
//   @override
//   State<BreakingNewsCard> createState() => _BreakingNewsCardState();
// }
//
// class _BreakingNewsCardState extends State<BreakingNewsCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 200.h,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(25),
//           image: DecorationImage(
//               fit: BoxFit.fill, image: NetworkImage(widget.newsModel!.image!))),
//       child: Container(
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(30.0),
//             gradient: LinearGradient(
//                 colors: [Colors.transparent, Colors.black],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter
//             )),
//         child: Padding(
//           padding: EdgeInsets.only(bottom: 20.h, left: 20.w, right: 20.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.end,
//             children:
//             [
//               Row(
//                 children:
//                 [
//                   textStyle(widget.newsModel!.channel!, 16.0.sp, Colors.white,
//                     FontWeight.w400),
//                   SizedBox(
//                     width: 5.w,
//                   ),
//                   const CircleAvatar(
//                     radius: 10,
//                     backgroundColor: Colors.blue,
//                     child: Icon(
//                       Icons.check_rounded, color: Colors.white, size: 13,),
//                   ),
//                   SizedBox(
//                   width: 5.w
//                   ),
//                   Text(
//                     '.', style: TextStyle(fontSize: 40.sp, color: Colors.white),),
//                   textStyle('${widget.newsModel!.hours.toString()} hours ago', 12.0.sp, Colors.white,
//                       FontWeight.w400),
//                 ],
//               ),
//
//               SizedBox(
//                 width: 5.h,
//               ),
//               textStyle(widget.newsModel!.title, 16.0.sp, Colors.white,
//                 FontWeight.w600,)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
