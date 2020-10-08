import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:class_planner/common/constants/theme.dart';
import 'package:flutter/material.dart';
/*

===ONBOARDING PAGE STYLES====

 */

final kGreetingTextStyle = TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.w900,
    fontSize: 60,
    color: colorScheme.secondary);

final kDescriptionTextStyle = TextStyle(
    fontFamily: 'Avenir',
    fontWeight: FontWeight.w500,
    fontSize: 40,
    color: Colors.black87);

/*

===HOME_PAGE STYLES


 */

final unSelectedDayMonthOfWeekStyle =
    TextStyle(color: Colors.white, fontFamily: 'Avenir', fontSize: 35);

final selectedDayMonthOfWeekStyle =
    TextStyle(color: colorScheme.primary, fontFamily: 'Avenir', fontSize: 35);

final bottomWidgetBorderRadiusStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(15.h),
    topRight: Radius.circular(15.h),
  ),
);
