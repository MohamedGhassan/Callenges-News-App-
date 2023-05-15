// import 'package:flutter/material.dart';
//
// import 'helper/sp_helper/sp_helper.dart';
//
// class BookmarkPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final id = ModalRoute.of(context)?.settings.arguments;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Bookmark'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: TextFormField(
//           decoration: InputDecoration(
//             labelText: 'Enter bookmark title',
//           ),
//           onFieldSubmitted: (value) {
//
//             SharedPreferencesController.addBookmark(id);
//             Navigator.pop(context);
//           },
//         ),
//       ),
//     );
//   }
// }
