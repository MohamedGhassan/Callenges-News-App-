import 'package:flutter/material.dart';
import 'package:tariq_challenges/screens/sign_up_screen.dart';

import '../helper/api_helper/google_signin_api.dart';

class LoggedInScreen extends StatelessWidget {
  // final GoogleSignInAccount? user;
  //
  // const LoggedInScreen({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          // leading: IconButton(
          //   icon: FaIcon(Icons.ar),
          //   onPressed: () async {
          //     Navigator.pop(context);
          //   },
          // ),
          title: Text("Logged In"),
          centerTitle: true,
          actions: [

            TextButton(
              child: Text("Logout"),
              onPressed: () async {
                await GoogleSignInApi.logout();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => SignUpScreen()));
              },
            ),
          ],
        ),
        // body: Container(
        //   alignment: Alignment.center,
        //   color: Colors.blueGrey.shade900,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text(
        //         "Profile",
        //         style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.blue),
        //       ),
        //       SizedBox(
        //         height: 32,
        //       ),
        //       CircleAvatar(
        //         radius: 40,
        //         backgroundImage: NetworkImage(user!.photoUrl!),
        //       ),
        //       SizedBox(
        //         height: 8,
        //       ),
        //       Text(
        //         'Name: ' + user!.displayName!,
        //         style: Theme.of(context)
        //             .textTheme
        //             .titleLarge
        //         !.copyWith(color: Colors.white,),
        //       ),
        //       SizedBox(
        //         height: 8,
        //       ),
        //       Text(
        //         'Email: ' + user!.email,
        //         style: Theme.of(context)
        //             .textTheme
        //             .titleLarge
        //         !.copyWith(color: Colors.white,),
        //       )
        //     ],
        //   ),
        // )
      );
}
