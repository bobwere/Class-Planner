import 'package:flutter/material.dart';

/* 
convert  from hex to Color
*/

Color colorFromHex(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}
