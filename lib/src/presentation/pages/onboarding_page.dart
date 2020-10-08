import 'package:class_planner/common/constants/strings.dart';
import 'package:class_planner/src/presentation/widgets/onboarding_page_widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
get started page inform user the intentions of this app before they
start using it
====To Be shown only once when the app is opened for the first time=====
*/

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  void initState() {
    onboardingPageHasBeenSeen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          //image widget
          TopHalfImageWidget(),
          //app description widget and get satrted button
          BottomHalfDescriptionWidget(),
        ],
      ),
    );
  }

  void onboardingPageHasBeenSeen() async {
    //init local storage
    final prefs = await SharedPreferences.getInstance();
    //set to local storage onboarding page has been seen by the user
    prefs.setBool(ON_BOARDING_PAGE_SEEN, true);
    //check n see if onboarding page has been seen and navigate to resulatant screen
  }
}
