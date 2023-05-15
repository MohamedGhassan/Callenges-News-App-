import 'package:flutter/cupertino.dart';

Widget textStyle(String title, double fontSize, Color color, FontWeight fontWeight){
  return Text(title, style: TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color),);
}