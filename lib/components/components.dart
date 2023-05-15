import 'dart:ui';

import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tariq_challenges/cubit/cubit.dart';

import '../theme.dart';

Widget defaultFormField({
  required TextEditingController controller,
  // required TextInputType type,
  Function? onSubmit,
  ValueChanged<String>? onChange,
  VoidCallback? onTap,
  bool isPassword = false,
  required FormFieldValidator<String> validate,
  String? label,
  IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPressed,
  bool isClickable = true,
  ValueChanged<String>? onFieldSubmitted,
  String? textLabel,
  required TextInputType textKeyboard,
  String helper = '',
  TextInputType? type,
  TextAlign? textAlign,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: textKeyboard,
      obscureText: isPassword,
      validator: validate,
      // onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      //validator: validate,
      // cursorColor: Colors.grey,
      decoration: InputDecoration(
        // isDense: true,
        // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        // enabledBorder: InputBorder.none,
        labelText: textLabel,
        // prefixIcon: Icon(prefix),
        // suffixIcon: suffix != null
        //     ? IconButton(onPressed: suffixPressed, icon: Icon(suffix))
        //     : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

Widget defaultButton({
  required Function() function,
  required String text,
  // double? width,
  // double? height,
  // Color? background,
  void fun()?,
}) =>
    TextButton(
      onPressed: function,
      child: Container(
        alignment: Alignment.center,
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(15)),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w900),
        ),
      ),
    );

// void navigatorTo(context, widget) {
//   Navigator.pop(context, MaterialPageRoute(builder: (context) {
//     return widget;
//   }));
// }
void navigateTo(BuildContext ctx, Widget nextScreen) {
  Navigator.push(ctx, MaterialPageRoute(builder: (_) => nextScreen));
}

Widget defaultOutlinedButton({
  required Function()? btnFunction,
  required String btnText,
  required dynamic backColor,
  double textSize = 16.0,
  double width = double.infinity,
  double height = 50.0,
  bool isUpperCase = true,
  double radius = 10.0,
  Widget? icon,
  bool enabled = true,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: enabled ? backColor : Colors.grey[600],
      borderRadius: BorderRadius.circular(radius),
    ),
    child: InkWell(
      onTap: enabled ? btnFunction : null,
      borderRadius: BorderRadius.circular(radius),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            icon,
            ///////////////////////
            const SizedBox(width: 10.0)
          ],
          ///////////////////////
          Text(
            isUpperCase ? btnText.toUpperCase() : btnText,
            style: defaultTextStyle(
              color: Colors.white,
              fontSize: textSize,
            ),
          ),
        ],
      ),
    ),
  );
}

TextStyle defaultTextStyle({
  required Color color,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
  TextDecoration? textDecoration,
  Color? decorationColor,
  double textHeight = 1.15,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    decoration: textDecoration,
    decorationColor: decorationColor,
    height: textHeight,
  );
}

Widget defaultIconButton({
  required Function()? onPressed,
  required IconData iconData,
  required dynamic backColor,
  Color iconColor = Colors.white,
  double iconSize = 24,
  double width = 30.0,
  double height = 30.0,
  double radius = 20.0,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      color: backColor,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: onPressed,
      child: Icon(
        iconData,
        color: iconColor,
        size: iconSize,
      ),
    ),
  );
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.child,
    required this.onTap,
  });

  final Widget child;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 24.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(56.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              height: 50.0,
              width: 50.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withOpacity(0.25),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
