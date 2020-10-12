import 'package:class_planner/src/cubit/create_google_calender_event_cubit.dart';
import 'package:class_planner/src/presentation/widgets/create_google_event_widgets.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CreateGoogleEventPage extends StatelessWidget {
  const CreateGoogleEventPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateGoogleCalenderEventCubit,
        CreateGoogleCalenderEventState>(
      listener: (context, state) {
        if (state is CreateGoogleCalenderEventError) {
          final errorMessaage = state.message;
          Flushbar(
            title: 'Error Occurred',
            message: errorMessaage,
            margin: EdgeInsets.all(20.h),
            flushbarPosition: FlushbarPosition.TOP,
            duration: Duration(seconds: 3),
            isDismissible: true,
            backgroundColor: Color(0xFFFD9726),
            borderRadius: 15.h,
          ).show(context);
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: TextResponsive(
            'Create Note On Your Calendar',
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
            //google calender event form  widget
            CreateGoogleEventFormWidget(),
          ],
        ),
      ),
    );
  }
}
