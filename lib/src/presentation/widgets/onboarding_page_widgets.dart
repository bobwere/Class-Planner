import 'package:class_planner/common/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

/*
Container with Image
 */
class TopHalfImageWidget extends StatelessWidget {
  const TopHalfImageWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Container with image
    return Container(
      padding: EdgeInsets.all(20),
      color: Theme.of(context).primaryColor,
      height: MediaQuery.of(context).size.height / 2,
      child: Image.asset(
        'assets/images/onboarding_page.png',
        fit: BoxFit.contain,
      ),
    );
  }
}

/*
Description of the app widget
 */
class BottomHalfDescriptionWidget extends StatelessWidget {
  const BottomHalfDescriptionWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.h),
            topRight: Radius.circular(15.h),
          ),
        ),
        child: Padding(
          padding: EdgeInsetsResponsive.symmetric(horizontal: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBoxResponsive(
                height: 20.h,
              ),
              /*
              Greeting
              */
              TextResponsive('Hi,', style: kGreetingTextStyle),
              /*
              What this app about
              */
              TextResponsive(
                  'Welcome to your second semester starting from tommorrow to Jan 5 2021, This is the class timetable for students taking pharmacy and economic undergraduate course',
                  style: kDescriptionTextStyle),
              SizedBoxResponsive(
                height: 5,
              ),
              /*
              What user can do with this app input actions
               */
              TextResponsive(
                  'You can see all upcoming classes for each day and create reminders to your google calender',
                  style: kDescriptionTextStyle),
              Spacer(),
              /*
              Navigate to home screen button
               */
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: RaisedButtonResponsive(
                    onPressed: () {
                      navigateToHomePage(context);
                    },
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: TextResponsive(
                      'Let\'s Get Started',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Avenir',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToHomePage(BuildContext context) {
    Navigator.of(context).popAndPushNamed('/homepage');
  }
}
