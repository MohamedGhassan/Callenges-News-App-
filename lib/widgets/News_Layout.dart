import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tariq_challenges/cubit/states.dart';
import 'package:tariq_challenges/responsvie.dart';
import 'package:tariq_challenges/screens/profile_screen.dart';
import '../components/components.dart';
import '../components/constant.dart';
import '../cubit/cubit.dart';
import '../theme.dart';

class NewsLayout extends StatelessWidget {
  final GoogleSignInAccount? user;
  NewsLayout({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.blue,
          //   title: Text("Test"),
          //   leading: MenuWidget(),
          // ),
          backgroundColor: !cubit.model
              ? Theme.of(context).backgroundColor
              : Colors.white,
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.bookmark_border_outlined,
                  ),
                  label: 'BookMark'),
              BottomNavigationBarItem(
                  icon: InkWell(
                    onTap: ()
                    {
                      // containerProfile(cubit.user, context);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ProfileScreen(user:User.user,)));
                    },
                    child: Icon(
                      Icons.person_outline,
                    ),
                  ),
                  label: 'Profile'),
            ],
            backgroundColor: !cubit.model ? darkHeaderClr : white,
            selectedItemColor: pinkClr,
            onTap: (index) {
              cubit.changeBottomNav(index, context);
            },
            currentIndex: cubit.currentIndex,
          ),
          // bottomNavigationBar: Stack(
          //   children: [
          //     Container(
          //       padding: EdgeInsets.only(
          //           top: 10.h, bottom: 10.h, left: 35.w, right: 35.w),
          //       color: Colors.white,
          //       child: GNav(
          //         selectedIndex: 0,
          //         backgroundColor: Colors.white,
          //         color: Colors.grey,
          //         activeColor: Colors.white,
          //         tabBackgroundColor: Theme.of(context).primaryColor,
          //         gap: 8.0,
          //         onTabChange: (index) {
          //           cubit.changeBottomNav(index, context);
          //         },
          //         padding: EdgeInsets.only(
          //             bottom: 5.h, right: 25, left: 25, top: 5.h),
          //         tabs: const [
          //           GButton(icon: Icons.home_outlined, text: 'Home'),
          //           GButton(
          //             icon: Icons.bookmark_border_outlined,
          //             text: 'Bookmarks',
          //           ),
          //           GButton(
          //             icon: Icons.person_outline_outlined,
          //             text: 'Profile',
          //           ),
          //         ],
          //       ),
          //     )
          //   ],
          // ),
          body: AppResponsive.isDesktop(context)
              ? Container()
              : cubit.bottomScreen[cubit.currentIndex],
        );
      },
    );
  }
}
