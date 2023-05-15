import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tariq_challenges/cubit/cubit.dart';
import 'package:tariq_challenges/cubit/states.dart';
import 'package:tariq_challenges/helper/sp_helper/sp_helper.dart';
import 'package:tariq_challenges/model/menu_item.dart';
import 'package:tariq_challenges/theme.dart';
import 'package:tariq_challenges/widgets/News_Layout.dart';
import 'package:tariq_challenges/widgets/menu_items.dart';
import 'bloc_observer.dart';
import 'bookmark_test.dart';
import 'home_test.dart';
import 'model/news_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPreferencesController.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final GoogleSignInAccount? user;
  const MyApp({Key? key, this.user}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MenuItemModel currentItem = MenuItems.home;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => NewsCubit()..getBookmarks(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
              NewsCubit cubit = NewsCubit.get(context);
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter Demo',
                  theme: Themes.light,
                  darkTheme: Themes.dark,
                  themeMode: cubit.model ? ThemeMode.light :ThemeMode.dark,
                  home: NewsLayout()
                // Builder(
                //     builder: (context) {
                //       double screenWith = AppResponsive.isDesktop(context)
                //           ? MediaQuery.of(context).size.width * 0.5
                //           : MediaQuery.of(context).size.width * 0.7;
                //       return ZoomDrawer(
                //           borderRadius: 40,
                //           angle: -10,
                //           slideWidth: screenWith,
                //           showShadow: true,
                //           backgroundColor: Colors.orangeAccent,
                //           style: DrawerStyle.Style1,
                //           mainScreen: getScreen(),
                //           menuScreen: Builder(
                //               builder: (context) {
                //                 return MenuPage(
                //                     currentItem: currentItem,
                //                     onSelectedItem: (item) {
                //                       setState(() => currentItem = item);
                //                       ZoomDrawer.of(context)!.close();
                //                     });
                //               }
                //           ));
                //     }
                // ),
                // home: NewsDetailsScreen(newsItem: newsModel!,),
              );
            },
            // child:
            // ZoomDrawer(
            //     style: DrawerStyle.style1,
            //     mainScreen: NewsLayout(),
            //     menuScreen: MenuPage(
            //         currentItem: currentItem, onSelectedItem: (item) {
            //       cubit.onSelectedItem(item);
            //     })
            // ),
          );
        },
      ),);
  }
  // Widget getScreen() {
  //   switch (currentItem) {
  //     case MenuItems.home:
  //       return const HomeScreen();
  //     case MenuItems.categoryNews:
  //       return const CategoryScreen();
  //     case MenuItems.bookmarks:
  //       return const BookMarksScreen();
  //     case MenuItems.profile:
  //     default:
  //       return ProfileScreen();
  //   }
  // }
}
