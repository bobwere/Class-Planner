import 'package:class_planner/common/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:class_planner/src/data/models/classes_model.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

/*
class details description widget
 */
class ClassDetailDescriptionWidget extends StatelessWidget {
  const ClassDetailDescriptionWidget({Key key, @required this.classes})
      : super(key: key);

  final Classes classes;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: bottomWidgetBorderRadiusStyle,
        child: Padding(
          padding: EdgeInsetsResponsive.symmetric(horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Class starttime and end time
              SizedBoxResponsive(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LineAwesomeIcons.clock, color: Colors.grey),
                  SizedBoxResponsive(width: 50),
                  TextResponsive(
                    '${classes.starttime} - ${classes.endtime}',
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                        color: Colors.black87),
                  ),
                ],
              ),

              //class location / lecturer room
              SizedBoxResponsive(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LineAwesomeIcons.map_marker, color: Colors.grey),
                  SizedBoxResponsive(width: 50),
                  TextResponsive(
                    'Lecturer Room ${classes.location}',
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                        color: Colors.black87),
                  ),
                ],
              ),

              //class lecturer name
              SizedBoxResponsive(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(LineAwesomeIcons.user, color: Colors.grey),
                  SizedBoxResponsive(width: 50),
                  TextResponsive(
                    'Lecturer: ${classes.lecturer}',
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                        color: Colors.black87),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
