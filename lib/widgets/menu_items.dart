import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tariq_challenges/cubit/cubit.dart';
import 'package:tariq_challenges/model/menu_item.dart';

class MenuItems {
  static const home = MenuItemModel('Home', Icons.home_outlined);
  static const categoryNews = MenuItemModel('Category News', Icons.category_outlined);
  static const bookmarks = MenuItemModel('Bookmarks', Icons.bookmark_border_outlined);
  static const profile = MenuItemModel('Profile', Icons.person_outline);
  // static const recommendation = MenuItemModel('Profile', Icons.person_outline);


  static const all = <MenuItemModel>[home, categoryNews, bookmarks, profile];
}

class MenuPage extends StatelessWidget {
  final MenuItemModel currentItem;
  final ValueChanged<MenuItemModel> onSelectedItem;

  const MenuPage({
    Key? key,
    required this.currentItem,
    required this.onSelectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            ...MenuItems.all.map(buildMenuItem).toList(),
            const Spacer(
              flex: 2,
            )
          ],
        )),
      ),
    );
  }

  Widget buildMenuItem(MenuItemModel item) => ListTileTheme(
    selectedColor: Colors.white,
    child: ListTile(
      selectedTileColor: Colors.black26,
      selected: currentItem == item,
      minLeadingWidth: 20.w,
      leading: Icon(item.icon, color: Colors.white,),
      title: Text(item.title!, style: const TextStyle(color: Colors.white),),
      onTap: () => onSelectedItem(item),
    ),
  );
}
