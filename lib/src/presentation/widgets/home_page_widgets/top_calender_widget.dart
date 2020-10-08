import 'package:calendar_strip/calendar_strip.dart';
import 'package:class_planner/common/constants/theme.dart';
import 'package:class_planner/src/cubit/classes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

/*
  Calender Widget  
 */
class TopCalenderWidget extends StatefulWidget {
  const TopCalenderWidget({Key key}) : super(key: key);

  @override
  _TopCalenderWidgetState createState() => _TopCalenderWidgetState();
}

class _TopCalenderWidgetState extends State<TopCalenderWidget> {
  DateTime startDate = DateTime.now().subtract(Duration(days: 2));
  DateTime endDate = DateTime.now().add(Duration(days: 90));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 0));
  List<DateTime> markedDates = [
    DateTime.now().subtract(Duration(days: 1)),
    DateTime.now().subtract(Duration(days: 2)),
    DateTime.now().add(Duration(days: 4))
  ];

  onSelect(DateTime date) {
    getClasses(context, date.weekday);
  }

  void getClasses(BuildContext context, int day) {
    final classesCubit = BlocProvider.of<ClassesCubit>(context);
    classesCubit.getClasses(day: day);
  }

  _monthNameWidget(monthName) {
    return Container(
      child: TextResponsive(
        monthName,
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          color: Colors.white,
          fontFamily: 'Avenir',
        ),
      ),
      padding: EdgeInsets.only(top: 8, bottom: 4),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ContainerResponsive(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 5,
        height: 5,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      ContainerResponsive(
        width: 5,
        height: 5,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(
      date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    Color fontColor = isDateOutOfRange ? Colors.black54 : Colors.white;
    TextStyle normalStyle =
        TextStyle(color: Colors.white, fontFamily: 'Avenir', fontSize: 35);
    TextStyle selectedStyle = TextStyle(
        fontFamily: 'Avenir', fontSize: 40, color: colorScheme.primary);
    TextStyle dayNameStyle = TextStyle(
        fontSize: 35, color: isSelectedDate ? colorScheme.primary : fontColor);
    List<Widget> _children = [
      TextResponsive(dayName, style: dayNameStyle),
      SizedBoxResponsive(
        height: 5,
      ),
      TextResponsive(date.day.toString(),
          style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      //  _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(500)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Container with calender widget
    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      padding: EdgeInsetsResponsive.fromLTRB(0, 30, 0, 0),
      width: MediaQuery.of(context).size.width,
      color: Theme.of(context).primaryColor,
      child: Container(
        child: CalendarStrip(
          startDate: startDate,
          endDate: endDate,
          selectedDate: selectedDate,
          onDateSelected: onSelect,
          dateTileBuilder: dateTileBuilder,
          iconColor: Colors.white,
          monthNameWidget: _monthNameWidget,
          markedDates: markedDates,
          containerDecoration: BoxDecoration(color: Colors.transparent),
          addSwipeGesture: true,
        ),
      ),
    );
  }
}
