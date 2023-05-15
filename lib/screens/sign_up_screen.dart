import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tariq_challenges/components/components.dart';
import 'package:tariq_challenges/cubit/cubit.dart';
import '../components/constant.dart';
import '../helper/api_helper/google_signin_api.dart';
import '../widgets/News_Layout.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _myController = TextEditingController();
    NewsCubit cubit = NewsCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text("Hello!",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.black)),
                    SizedBox(
                      height: 30.h,
                    ),
                    Container(
                      height: 50.h,
                      child: defaultFormField(
                        textLabel: "Email",
                        controller: _myController,
                        validate: (value) {},
                        // label: 'Email',
                        textKeyboard: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    defaultButton(
                      function: () {},
                      text: 'Continue',
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Text(
                        'Or',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.black, fontSize: 16.sp),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey)),
                      height: 50.h,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          InkWell(
                            onTap: () {},
                            child: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blue,
                              size: 33,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            'Continue With Facebook',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey)),
                      height: 50.h,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 7.w,
                          ),
                          InkWell(
                            onTap: () {
                              cubit.signIn(context);
                            },
                            child: Image.network(
                              'http://pngimg.com/uploads/google/google_PNG19635.png',
                              fit: BoxFit.cover,
                              height: 50,
                              width: 50,
                            ),
                          ),
                          // InkWell(
                          //   onTap: () {},
                          //   child: FaIcon(FontAwesomeIcons.google, size: 33,),
                          // ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Continue in With Google',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey)),
                      height: 50.h,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 15.w,
                          ),
                          // Image.network(
                          //   'http://pngimg.com/uploads/google/google_PNG19635.png',
                          //   fit: BoxFit.cover, height: 50, width: 50,),
                          InkWell(
                            onTap: () {},
                            child: FaIcon(
                              FontAwesomeIcons.apple,
                              color: Colors.black,
                              size: 33,
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            'Continue with Apple',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'New user?',
                        style: Theme.of(context).textTheme.titleLarge),
                    TextSpan(
                        text: '    Create an account',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: Colors.blue))
                  ]),
                ),
              )
            ],
          ),
        ),
        // Center(
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: [
        //       ElevatedButton.icon(
        //           style: ElevatedButton.styleFrom(
        //             primary: Colors.white,
        //             onPrimary: Colors.black,
        //             maximumSize: Size(double.infinity, 50),
        //           ),
        //           onPressed: signIn,
        //           icon: FaIcon(
        //             FontAwesomeIcons.google,
        //             color: Colors.red,
        //           ),
        //           label: Text('Sign Up with google'))
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
