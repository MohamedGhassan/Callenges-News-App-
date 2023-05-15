import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          // leadingWidth: 0,
          // titleSpacing: 0,
          leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey.withOpacity(0.1),
              child: IconButton(
                  onPressed: ()
                  {
                    ZoomDrawer.of(context)!.toggle();
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 25,
                    color: Colors.white,
                  ))),
          title: const Text('Category'),
        ),
        body: const Center(
      child: Text("Category Screen"),
    ));
  }
}
