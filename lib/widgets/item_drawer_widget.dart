import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/menu_item.dart';
import '../responsvie.dart';
import 'menu_items.dart';

class ItemDrawer extends StatelessWidget {
  final MenuItemModel currentItem;
  final ValueChanged<MenuItemModel> onSelectedItem;

  const ItemDrawer(
      {required this.currentItem, required this.onSelectedItem, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [
          const Image(image: AssetImage("assets/images/background.jpeg"),
              fit: BoxFit.cover),
          ClipRRect(
            // Clip it cleanly.
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.black.withOpacity(0.1),
                alignment: Alignment.center,
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: -5,
            top: -5,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 5),
                ],
              ),
              width: AppResponsive.isMobile(context) ? MediaQuery
                  .of(context)
                  .size
                  .width / 1.5 : MediaQuery
                  .of(context)
                  .size
                  .width / 2.5,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    Container(
                      decoration: BoxDecoration(color: Colors.black54,),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, top: 75.h, bottom: 20.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // Container(
                            //   width: 100,
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(0.0),
                            //     child:  Image.asset("assets/images/profile.jpg"),
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () {},
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.white.withOpacity(0.4),
                                          offset: Offset(0, 0),
                                          blurRadius: 5
                                      ),
                                    ],
                                  ),
                                  height: 50.h,
                                  child:
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.white.withOpacity(
                                                0.4),
                                            offset: Offset(0, 0),
                                            blurRadius: 5
                                        ),
                                      ],),
                                    height: 50.h,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/myimage.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  // ClipRRect(
                                  //     child: image,
                                  //     borderRadius:  BorderRadius.circular(5)
                                  // ),
                                ),
                              ),
                            ),

                            // ProfileItemWidget(subtitle: name),
                            // ProfileItemWidget(title: "Name"),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Mohammed Ghassan',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            Spacer(),
                            CircleAvatar(
                                radius: AppResponsive.isMobile(context)
                                    ? 15
                                    : 20,
                                backgroundColor: Colors.white,
                                child: IconButton(icon: Icon(
                                  Icons.close,
                                  color: Colors.black,
                                  size: 15.sp,
                                  // size: Responsive.isMobile(context) ? 20 : 25,
                                ), onPressed: () {
                                  Navigator.pop(context);
                                },
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black87,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 10, bottom: 10),
                        child: Row(
                          children: [
                            // Icon(Icons.settings,
                            //     color: Colors.white70, size: 35),
                            SizedBox(width: 10),
                            Text(
                              "BROWES",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white70),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      child: Column(
                        children: [
                          // InkWell(
                          //   onTap: () {
                          //     setState(() {
                          //       widget.postx = 1;
                          //       widget.posty = -2;
                          //       Future.delayed(
                          //           Duration(milliseconds: 200), () {
                          //         if (widget.selectedItem != 1) {
                          //           Navigator.pushReplacement(
                          //             context,
                          //             PageRouteBuilder(
                          //               pageBuilder: (context, animation1,
                          //                   animation2) => Home(),
                          //               transitionDuration: Duration(
                          //                   seconds: 0),
                          //             ),
                          //           );
                          //         }
                          //       });
                          //     });
                          //   },
                          //   child: ListTile(
                          //     leading: Icon(
                          //       Icons.home_outlined, color: Colors.white,
                          //       size: 25,),
                          //     title: Container(
                          //       decoration: BoxDecoration(
                          //         // borderRadius: BorderRadius.circular(20),
                          //         // color:(widget.selectedItem == 1)? (widget.posty == -2 && widget.postx == 1)?Colors.white:Colors.white70:(widget.posty == -2 && widget.postx == 1)?Colors.white24:Colors.transparent,
                          //       ),
                          //       child: Text("Home", style: TextStyle(
                          //           color: (widget.selectedItem == 1)
                          //               ? Colors.black
                          //               : (widget.posty == -2 &&
                          //               widget.postx == 1)
                          //               ? Colors.white
                          //               : Colors.white60,
                          //           fontSize: 14,
                          //           fontWeight: FontWeight.w500
                          //       ),),
                          //     ),
                          //   ),
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     setState(() {
                          //       widget.postx = 2;
                          //       widget.posty = -2;
                          //       Future.delayed(
                          //           Duration(milliseconds: 200), () {
                          //         if (widget.selectedItem != 2) {
                          //           Navigator.pushReplacement(
                          //             context,
                          //             PageRouteBuilder(
                          //               pageBuilder: (context, animation1,
                          //                   animation2) => Movies(),
                          //               transitionDuration: Duration(
                          //                   seconds: 0),
                          //             ),
                          //           );
                          //         }
                          //       });
                          //     });
                          //   },
                          //   child: ListTile(
                          //     leading: Icon(
                          //       Icons.movie_creation_outlined,
                          //       color: Colors.white,
                          //       size: 25,),
                          //     title: Text("Movies", style: TextStyle(
                          //         color: (widget.selectedItem == 2)
                          //             ? Colors.black
                          //             : (widget.posty == -2 &&
                          //             widget.postx == 2)
                          //             ? Colors.white
                          //             : Colors.white60,
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.w500
                          //     ),),
                          //   ),
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     setState(() {
                          //       widget.postx = 3;
                          //       widget.posty = -2;
                          //       Future.delayed(
                          //           Duration(milliseconds: 200), () {
                          //         if (widget.selectedItem != 3) {
                          //           Navigator.pushReplacement(
                          //             context,
                          //             PageRouteBuilder(
                          //               pageBuilder: (context, animation1,
                          //                   animation2) => Series(),
                          //               transitionDuration: Duration(
                          //                   seconds: 0),
                          //             ),
                          //           );
                          //         }
                          //       });
                          //     });
                          //   },
                          //   child: ListTile(
                          //     leading: Icon(
                          //       Icons.slideshow, color: Colors.white,
                          //       size: 25,),
                          //     title: Text("Shows", style: TextStyle(
                          //         color: (widget.selectedItem == 3)
                          //             ? Colors.black
                          //             : (widget.posty == -2 &&
                          //             widget.postx == 3)
                          //             ? Colors.white
                          //             : Colors.white60,
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.w500
                          //     ),),
                          //   ),
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     setState(() {
                          //       widget.postx = 4;
                          //       widget.posty = -2;
                          //       Future.delayed(
                          //           Duration(milliseconds: 200), () {
                          //         if (widget.selectedItem != 4) {
                          //           Navigator.pushReplacement(
                          //             context,
                          //             PageRouteBuilder(
                          //               pageBuilder: (context, animation1,
                          //                   animation2) => Channels(),
                          //               transitionDuration: Duration(
                          //                   seconds: 0),
                          //             ),
                          //           );
                          //         }
                          //       });
                          //     });
                          //   },
                          //   child: ListTile(
                          //     leading: Icon(
                          //       Icons.live_tv, color: Colors.white,
                          //       size: 25,),
                          //     title: Text("Live TV", style: TextStyle(
                          //         color: (widget.selectedItem == 4)
                          //             ? Colors.black
                          //             : (widget.posty == -2 &&
                          //             widget.postx == 4)
                          //             ? Colors.white
                          //             : Colors.white60,
                          //         fontSize: 15,
                          //         fontWeight: FontWeight.w500
                          //     ),),
                          //   ),
                          // ),
                          InkWell(
                            onTap: () {},
                            child: const ListTile(
                              leading: Icon(
                                Icons.home_outlined, color: Colors.white,
                                size: 25,),
                              title: Text("Home"),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const ListTile(
                              leading: Icon(
                                Icons.category_outlined, color: Colors.white,
                                size: 25,),
                              title: Text("Category News",),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const ListTile(
                              leading: Icon(
                                Icons.bookmark_border_outlined,
                                color: Colors.white,
                                size: 25,),
                              title: Text("Bookmarks",),
                            ),
                          ),
                          const ListTile(
                            leading: Icon(
                              Icons.person_outline, color: Colors.white,
                              size: 25,),
                            title: Text("Profile",),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuItem(MenuItemModel item) => ListTileTheme(
    selectedTileColor: Colors.white,
    child: ListTile(
      selectedTileColor: Colors.black26,
      selected: currentItem == item,
      minLeadingWidth: 20.w,
      leading: Icon(item.icon),
      trailing: Text(item.title!),
      onTap: () => onSelectedItem(item),
    ),
  );
}
