import 'package:class_planner/src/presentation/pages/class_detail_page.dart';
import 'package:class_planner/src/presentation/pages/create_google_event_page.dart';
import 'package:class_planner/src/presentation/pages/home_page.dart';
import 'package:class_planner/src/presentation/pages/onboarding_page.dart';
import 'package:class_planner/src/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class RouteCatalog {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case '/onboardingpage':
        return MaterialPageRoute(builder: (_) => OnboardingPage());
      case '/homepage':
        return MaterialPageRoute(builder: (_) => HomePage());
      case '/classdetailpage':
        return MaterialPageRoute(
            builder: (_) => ClassDetailPage(
                  classes: arguments,
                ));
      case '/creategoogleeventpage':
        return MaterialPageRoute(
            fullscreenDialog: true, builder: (_) => CreateGoogleEventPage());
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
