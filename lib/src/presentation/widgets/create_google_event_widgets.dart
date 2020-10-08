import 'package:class_planner/common/constants/styles.dart';
import 'package:class_planner/src/cubit/create_google_calender_event_cubit.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CreateGoogleEventFormWidget extends StatefulWidget {
  const CreateGoogleEventFormWidget({Key key}) : super(key: key);

  @override
  _CreateGoogleEventFormWidgetState createState() =>
      _CreateGoogleEventFormWidgetState();
}

class _CreateGoogleEventFormWidgetState
    extends State<CreateGoogleEventFormWidget> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedStartTime = TimeOfDay.now();
  TimeOfDay selectedEndTime = TimeOfDay.now();
  int startTimeInEpoch;
  int endTimeInEpoch;
  TextEditingController eventNameTextController;
  TextEditingController eventDescriptionTextController;
  TextEditingController textControllerDate;
  TextEditingController textControllerStartTime;
  TextEditingController textControllerEndTime;

  @override
  void initState() {
    textControllerDate = TextEditingController();
    textControllerStartTime = TextEditingController();
    textControllerEndTime = TextEditingController();
    eventNameTextController = TextEditingController();
    eventDescriptionTextController = TextEditingController();
    startTimeInEpoch = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedStartTime.hour,
      selectedStartTime.minute,
    ).millisecondsSinceEpoch;

    endTimeInEpoch = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedEndTime.hour,
      selectedEndTime.minute + 30,
    ).millisecondsSinceEpoch;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: bottomWidgetBorderRadiusStyle,
        child: SingleChildScrollView(
          padding: EdgeInsetsResponsive.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Enter note title textfield

              SizedBoxResponsive(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextField(
                  controller: eventNameTextController,
                  minLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Enter note title',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54,
                      fontFamily: 'Avenir',
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.h,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                ),
              ),

              //Enter note description textfield

              SizedBoxResponsive(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextField(
                  controller: eventDescriptionTextController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText:
                        'Description e.g remember to submit assignment due',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54,
                      fontFamily: 'Avenir',
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.h,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                ),
              ),

              //Enter Date Button
              SizedBoxResponsive(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextField(
                  controller: textControllerDate,
                  onTap: () => _selectDate(context),
                  readOnly: true,
                  minLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Select Date',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54,
                      fontFamily: 'Avenir',
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.h,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                ),
              ),

              //Enter select starttime button

              SizedBoxResponsive(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextField(
                  controller: textControllerStartTime,
                  onTap: () => _selectStartTime(context),
                  readOnly: true,
                  minLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Select Start Time',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54,
                      fontFamily: 'Avenir',
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.h,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                ),
              ),

              //Enter select endtime button

              SizedBoxResponsive(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextField(
                  controller: textControllerEndTime,
                  onTap: () => _selectEndTime(context),
                  readOnly: true,
                  minLines: 1,
                  decoration: InputDecoration(
                    labelText: 'Select End Time',
                    labelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Colors.black54,
                      fontFamily: 'Avenir',
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.shade400,
                          width: 1.h,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(
                        5,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBoxResponsive(height: 20),

              //Create event button
              Container(
                padding: EdgeInsetsResponsive.only(right: 20, bottom: 5),
                width: MediaQuery.of(context).size.width,
                child: RaisedButtonResponsive(
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    createNewEvent(
                      context,
                      eventNameTextController.text,
                      eventDescriptionTextController.text,
                      DateTime.fromMillisecondsSinceEpoch(startTimeInEpoch),
                      DateTime.fromMillisecondsSinceEpoch(endTimeInEpoch),
                    );
                  },
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  child: TextResponsive('Create Note',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Avenir',
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        textControllerDate.text = DateFormat.yMMMMd().format(selectedDate);
      });
    }
  }

  _selectStartTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedStartTime,
    );
    if (picked != null && picked != selectedStartTime) {
      setState(() {
        selectedStartTime = picked;
        textControllerStartTime.text = selectedStartTime.format(context);
        startTimeInEpoch = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedStartTime.hour,
          selectedStartTime.minute,
        ).millisecondsSinceEpoch;
      });
    } else {
      setState(() {
        textControllerStartTime.text = selectedStartTime.format(context);
      });
    }
  }

  _selectEndTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: selectedEndTime,
    );
    if (picked != null && picked != selectedEndTime) {
      setState(() {
        selectedEndTime = picked;
        textControllerEndTime.text = selectedEndTime.format(context);
        endTimeInEpoch = DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedEndTime.hour,
          selectedEndTime.minute,
        ).millisecondsSinceEpoch;
      });
    } else {
      setState(() {
        textControllerEndTime.text = selectedEndTime.format(context);
      });
    }
  }

  createNewEvent(BuildContext context, String title, String description,
      DateTime startTime, DateTime endTime) {
    final createGoogleCalenderEventCubit =
        BlocProvider.of<CreateGoogleCalenderEventCubit>(context);
    endTimeInEpoch - startTimeInEpoch > 0
        ? createGoogleCalenderEventCubit.createEvent(
            title: title.isNotEmpty ? title : 'Class Note',
            description: description.isNotEmpty ? description : ' ',
            startTime: startTime,
            endTime: endTime,
          )
        : Flushbar(
            title: 'Error Occurred',
            message: 'Ensure end time is greater than start time',
            margin: EdgeInsets.all(20.h),
            flushbarPosition: FlushbarPosition.TOP,
            duration: Duration(seconds: 3),
            isDismissible: true,
            backgroundColor: Color(0xFFFD9726),
            borderRadius: 15.h,
          ).show(context);
  }
}
