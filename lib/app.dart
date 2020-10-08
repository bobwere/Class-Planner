import 'package:class_planner/common/constants/strings.dart';
import 'package:class_planner/common/routes/routes.dart';
import 'package:class_planner/src/cubit/classes_cubit.dart';
import 'package:class_planner/src/cubit/create_google_calender_event_cubit.dart';
import 'package:class_planner/src/data/repository/classes_repository.dart';
import 'package:class_planner/src/data/repository/google_calender_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/constants/theme.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ClassesCubit(ClassesRepository())),
          BlocProvider(
              create: (context) =>
                  CreateGoogleCalenderEventCubit(GoogleCalenderRepository())),
        ],
        child: GestureDetector(
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);

            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              currentFocus.focusedChild.unfocus();
            }
          },
          child: MaterialApp(
            title: NAME_OF_APP,
            initialRoute: '/',
            onGenerateRoute: RouteCatalog.generateRoute,
            theme: classPlannerTheme,
            debugShowCheckedModeBanner: false,
          ),
        ));
  }
}
