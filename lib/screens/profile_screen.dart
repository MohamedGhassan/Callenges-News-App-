import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tariq_challenges/cubit/cubit.dart';

import '../cubit/states.dart';
import '../theme.dart';

class ProfileScreen extends StatelessWidget {
  final GoogleSignInAccount? user;

  ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    var cubit = NewsCubit.get(context);
    return Scaffold(
      backgroundColor:
          !cubit.model ? Theme.of(context).backgroundColor : Colors.white,
      // appBar: AppBar(
      //   title: Text("Profile", style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.bold ,color: Colors.blue),),
      //   centerTitle: true,
      //   actions: [
      //     // PopupMenuButton(itemBuilder: (context){
      //     //   return [
      //     //     // POP
      //     //   ];
      //     // });
      //     TextButton(
      //       child: Text("Logout", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.blue),),
      //       onPressed: () async {
      //         await GoogleSignInApi.logout();
      //         Navigator.of(context).pushReplacement(
      //             MaterialPageRoute(builder: (context) => SignUpScreen()));
      //       },
      //     )
      //   ],
      // ),
      body: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return SafeArea(
            child: Container(
              alignment: Alignment.center,
              color: !cubit.model
                  ? Theme.of(context).backgroundColor
                  : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(onPressed: ()
                    {
                      Navigator.pop(context);
                    }, icon: FaIcon(Icons.arrow_back_ios_new)),
                    SizedBox(
                      height: 5.h,
                    ),
                    // Text(
                    //   "Profile",
                    //   style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.blue),
                    // ),
                    // SizedBox(
                    //   height: 32,
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(user!.photoUrl!),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user!.displayName!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: !cubit.model
                                              ? white
                                              : Colors.black,
                                        ),
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Text(
                                    user!.email,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          color: !cubit.model
                                              ? white70
                                              : Colors.black54,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                  )
                                ]),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Divider(
                      height: 5.h,
                      thickness: 2,
                      color: !cubit.model ? white : Colors.black,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Text(
                          "Dark Theme",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: !cubit.model ? white : Colors.black,
                                  ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            cubit.changeMood(!cubit.model);
                          },
                          child: DayNightSwitcherIcon(
                            isDarkModeEnabled: cubit.model,
                            onStateChanged: cubit.changeMood,
                          ),
                        ),
                        Divider(
                          height: 5,
                          thickness: 2,
                          color: !cubit.model ? white : Colors.black,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Notification",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: !cubit.model ? white : Colors.black,
                          ),
                    ),
                    Text(
                      "Choose how to you want to receive news notification",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: !cubit.model ? white : Colors.black,
                          ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Divider(
                      height: 5,
                      thickness: 2,
                      color: !cubit.model ? white : Colors.black,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Text(
                      "Usage rules",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: !cubit.model ? white : Colors.black,
                          ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Policy Service",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: !cubit.model ? white : Colors.black,
                          ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
