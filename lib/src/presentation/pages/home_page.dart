import 'package:class_planner/common/constants/theme.dart';
import 'package:class_planner/src/presentation/widgets/home_page_widgets/bottom_timeline_widget.dart';
import 'package:class_planner/src/presentation/widgets/home_page_widgets/top_calender_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          //calender widget
          TopCalenderWidget(),
          //timeline of the days classes
          BottomTimelineWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.primary,
        onPressed: () {
          Navigator.of(context).pushNamed('/creategoogleeventpage');
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
