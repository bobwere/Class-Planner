import 'package:animation_director/animation_director.dart';
import 'package:class_planner/common/constants/bezier_clippers.dart';
import 'package:class_planner/common/constants/theme.dart';
import 'package:class_planner/common/util/clip_shadow_path.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter/material.dart';

//top beizercurve box shadow
final topBoxShadow = BoxShadow(
  color: Colors.black54,
  offset: Offset(3.h, 3.h),
  blurRadius: 3.h,
  spreadRadius: 3.h,
);

//bottom beizercurve box shadow
final bottomBoxShadow = BoxShadow(
  color: Colors.black54,
  offset: Offset(-3.h, -3.h),
  blurRadius: 3.h,
  spreadRadius: 3.h,
);

//white background can change to another color
ActorWidget backGround({BuildContext context, int startInMilliseconds}) {
  return ActorWidget(name: 'Background', actions: [
    //no animation just original position the object
    ActorAction(
        character: ActorCharacter(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.white),
    ))
  ]);
}

/*
Animate top beizer curve from start position to end position
 */
ActorWidget topBeizerCurve(
    {BuildContext context, int startInMilliseconds, int duration}) {
  final container = Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    color: colorScheme.primary,
  );

  return ActorWidget(name: 'TopCurve', actions: [
    //start position of the widget
    ActorAction(
        position:
            ActorPosition(top: -100, bottom: 100, right: 100, left: -100)),
    //end position of the widget after animation
    ActorAction(
      waitBeforeStart: Duration(milliseconds: startInMilliseconds),
      position: ActorPosition(
          top: -30,
          bottom: 30,
          right: 40,
          left: -40,
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: duration)),
      //object to animate a beizer curve
      character: ActorCharacter(
        child: ClipShadowPath(
            shadow: topBoxShadow,
            clipper: TopBezierClipper(),
            child: container),
      ),
    )
  ]);
}

/*
Animate bottom beizer curve from start position to end position
 */
ActorWidget bottomBeizerCurve(
    {BuildContext context, int startInMilliseconds, int duration}) {
  final container = Container(
    height: MediaQuery.of(context).size.height,
    width: MediaQuery.of(context).size.width,
    color: colorScheme.primary,
  );

  return ActorWidget(name: 'BottomCurve', actions: [
    //start position of the beizer curve
    ActorAction(
        position: ActorPosition(
            top: 400.h, bottom: -400.h, right: -80.h, left: 80.h)),
    //end position of the beizer cure after animation
    ActorAction(
      waitBeforeStart: Duration(milliseconds: startInMilliseconds),
      position: ActorPosition(
        top: 350.h,
        bottom: -350.h,
        right: -50.h,
        left: 50.h,
        curve: Curves.elasticOut,
        duration: Duration(milliseconds: duration),
      ),
      //object to animate a beizer curve
      character: ActorCharacter(
        child: ClipShadowPath(
            shadow: bottomBoxShadow,
            clipper: BottomBezierClipper(),
            child: container),
      ),
    )
  ]);
}

/*
animate logo scale from zero to 1.5
 */
ActorWidget logo(
    {BuildContext context, int startInMilliseconds, int duration}) {
  return ActorWidget(name: 'Logo', actions: [
    //scale factor of the object and position
    ActorAction(
      waitBeforeStart: Duration(milliseconds: startInMilliseconds),
      character: ActorCharacter(
        child: Center(
          child: ContainerResponsive(
            height: 500,
            width: 500,
            child: Image.asset('assets/images/logo.png',
                fit: BoxFit.contain, scale: 1.5),
          ),
        ),
      ),
      scale: ActorScale(startScale: 0, finishScale: 0),
    ),

    //scale factor of the object after animation
    ActorAction(
      scale: ActorScale(
          alignment: Alignment.center,
          startScale: 0,
          finishScale: 1,
          curve: Curves.elasticOut,
          duration: Duration(milliseconds: duration)),
    ),
  ]);
}
