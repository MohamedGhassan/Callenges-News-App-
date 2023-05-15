// import 'package:flutter/material.dart';
// import 'helper/sp_helper/sp_helper.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News App'),
//       ),
//       body: FutureBuilder(
//         future: SharedPreferencesController.getBookmarks(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             var bookmarks = snapshot.data;
//             if (snapshot.hasData) {
//               return Center(
//                 child: Text('No bookmarks'),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: SharedPreferencesController.bookmarks.length,
//                 itemBuilder: (context, index) {
//                   final id = SharedPreferencesController.bookmarks[index];
//                   return ListTile(
//                     title: Text(id),
//                     onTap: () {
//                       Navigator.pushNamed(context, '/news', arguments: id);
//                     },
//                   );
//                 },
//               );
//             }
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.bookmark_add),
//         onPressed: () {
//           Navigator.pushNamed(context, '/bookmark');
//         },
//       ),
//     );
//   }
// }
