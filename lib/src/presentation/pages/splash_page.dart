import 'package:animation_director/animation_director.dart';
import 'package:class_planner/common/constants/strings.dart';
import 'package:class_planner/src/cubit/classes_cubit.dart';
import 'package:class_planner/src/presentation/widgets/splash_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
 
 ===== SPLASH PAGE ====
  
 */
class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    //Enable app to be responsive to different screen resolutions initialised only once at the root page of the app *splashpage*
    ResponsiveWidgets.init(
      context,
      height: 480, //base height itel A33
      width: 854, //base width  itel A33
      allowFontScaling: false,
    );

    //load timetable from firebase beforehand (while in the splash page)- when in user navigates to the homepage the data is available
    getClasses(context);

    return Scaffold(
      body: Stack(children: [
        //Animate UI Elements
        AnimationDirector(
          repeatTimes: 1,
          speed: 2,
          autoStart: true,
          onCompleted: (int repeated, Duration runtime) {
            print("FINISHED - REPEATED $repeated in ${runtime.inMilliseconds}");
            navigateToHomePageOrOnboardingPage(context);
          },
          cast: <ActorWidget>[
            backGround(context: context),
            bottomBeizerCurve(
                context: context, startInMilliseconds: 50, duration: 1500),
            topBeizerCurve(
                context: context, startInMilliseconds: 150, duration: 1500),
            logo(context: context, startInMilliseconds: 600, duration: 1500),
          ],
        ),
      ]),
    );
  }

  void navigateToHomePageOrOnboardingPage(BuildContext context) async {
    //init local storage
    final prefs = await SharedPreferences.getInstance();
    //time for splash screen to play
    await Future.delayed(Duration(seconds: 4));
    //check n see if onboarding page has been seen and navigate to resulatant screen
    final isSeen = prefs.getBool(ON_BOARDING_PAGE_SEEN) ?? false;

    !isSeen
        ? Navigator.of(context).popAndPushNamed('/onboardingpage')
        : Navigator.of(context).popAndPushNamed('/homepage');
  }

  //method to retrieve data(days lesson) from firebase
  void getClasses(BuildContext context) {
    final classesCubit = BlocProvider.of<ClassesCubit>(context);
    classesCubit.getClasses();
  }
}
