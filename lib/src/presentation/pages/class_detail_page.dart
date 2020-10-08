import 'package:class_planner/src/data/models/classes_model.dart';
import 'package:class_planner/src/presentation/widgets/class_detail_page_widgets/class_detail_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ClassDetailPage extends StatelessWidget {
  const ClassDetailPage({Key key, @required this.classes}) : super(key: key);

  final Classes classes;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
        title: TextResponsive(
          classes.subject,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontFamily: 'Avenir',
          ),
        ),
      ),
      body: Column(
        children: [
          //class detail information widget
          ClassDetailDescriptionWidget(classes: classes),
        ],
      ),
    );
  }
}
