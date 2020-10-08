import 'package:class_planner/common/constants/styles.dart';
import 'package:class_planner/common/util/color_from_hex.dart';
import 'package:class_planner/src/cubit/classes_cubit.dart';
import 'package:class_planner/src/data/models/classes_model.dart';
import 'package:class_planner/src/data/models/qoutes_model.dart';
import 'package:dart_random_choice/dart_random_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

/*
Timeline of the days schedule widget
 */
class BottomTimelineWidget extends StatelessWidget {
  const BottomTimelineWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassesCubit, ClassesState>(
      builder: (context, state) {
        if (state is ClassesLoading) {
          return buildLoadingWidget();
        } else if (state is NoClassesFound) {
          return buildNoClasssesFoundWidget(context);
        } else if (state is ClassesLoaded) {
          final classes = state.classes;
          return buildLoadedWidget(classes, context);
        } else if (state is ClassesError) {
          return buildErrorWidget(context, state.message);
        } else {
          return buildInitialWidget();
        }
      },
    );
  }

  Widget buildInitialWidget() {
    return Expanded(
      child: Container(
        decoration: bottomWidgetBorderRadiusStyle,
      ),
    );
  }

  Widget buildLoadingWidget() {
    return Expanded(
      child: Container(
        decoration: bottomWidgetBorderRadiusStyle,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget buildNoClasssesFoundWidget(BuildContext context) {
    Quote qoute = randomChoice<Quote>(quotes);
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: bottomWidgetBorderRadiusStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBoxResponsive(
              height: 50,
            ),

            //Image

            ContainerResponsive(
              padding: EdgeInsetsResponsive.all(5),
              height: 200,
              child: Image.asset(
                'assets/images/onboarding_page.png',
                fit: BoxFit.contain,
              ),
            ),

            //No classes text

            TextResponsive('Its A Weekend No Classes Today!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                    color: Colors.black87)),
            SizedBoxResponsive(
              height: 10,
            ),

            //qoute

            Padding(
              padding: EdgeInsetsResponsive.symmetric(horizontal: 50),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextResponsive(qoute.qoute,
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                        color: Colors.grey)),
              ),
            ),
            SizedBoxResponsive(
              height: 5,
            ),

            //author of qoute

            Padding(
              padding: EdgeInsetsResponsive.symmetric(horizontal: 50),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextResponsive(
                  qoute.author,
                  style: TextStyle(
                      fontFamily: 'Avenir',
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                      color: Colors.blueGrey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildErrorWidget(BuildContext context, String message) {
    final classesCubit = BlocProvider.of<ClassesCubit>(context);
    return Expanded(
      child: Container(
        decoration: bottomWidgetBorderRadiusStyle,
        child: Center(
          child: GestureDetector(
            onTap: () {
              classesCubit.getClasses();
            },
            child: ContainerResponsive(
              alignment: Alignment.center,
              height: 100,
              width: 500,
              decoration: BoxDecoration(
                color: Color(0xFFF37F2C),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.h),
                ),
              ),
              child: TextResponsive(
                '$message check your connection and tap to retry',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoadedWidget(List<Classes> classes, BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: bottomWidgetBorderRadiusStyle,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBoxResponsive(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsResponsive.all(20),
                  child: TextResponsive(
                    'Today\'s Timeline',
                    style: TextStyle(
                        fontFamily: 'Avenir',
                        fontWeight: FontWeight.w800,
                        fontSize: 40,
                        color: Colors.black87),
                  ),
                ),
                Container(
                  height: 40,
                  width: 120,
                  child: CoursesDropdown(),
                )
              ],
            ),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  padding: EdgeInsetsResponsive.symmetric(horizontal: 40),
                  itemCount: classes.length,
                  itemBuilder: (context, index) {
                    final klass = classes[index];
/* 

build list item of classes includes time , and subject to be taught

*/
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                            verticalOffset: 50.0,
                            child: FadeInAnimation(
                              child: ContainerResponsive(
                                height: 100,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ContainerResponsive(
                                      width: 200,
                                      child: TextResponsive(
                                        klass.starttime,
                                        style: TextStyle(
                                            fontFamily: 'Avenir',
                                            fontWeight: FontWeight.w800,
                                            fontSize: 40,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    SizedBoxResponsive(
                                      width: 40,
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              '/classdetailpage',
                                              arguments: klass);
                                        },
                                        child: ContainerResponsive(
                                          height: 80,
                                          padding:
                                              EdgeInsetsResponsive.symmetric(
                                                  horizontal: 20, vertical: 10),
                                          decoration: BoxDecoration(
                                            color: colorFromHex(klass.color),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.h)),
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextResponsive(
                                                klass.subject,
                                                style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 40,
                                                    color: Colors.black87),
                                              ),
                                              TextResponsive(
                                                '${klass.starttime} - ${klass.endtime}',
                                                style: TextStyle(
                                                    fontFamily: 'Avenir',
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 35,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Course DropDown Widget separated to maintain state on its own instead of refreshing the whole page
*/
class CoursesDropdown extends StatefulWidget {
  CoursesDropdown({Key key}) : super(key: key);

  @override
  _CoursesDropdownState createState() => _CoursesDropdownState();
}

class _CoursesDropdownState extends State<CoursesDropdown> {
  String course;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
          value: course,
          isExpanded: true,
          hint: TextResponsive(
            'Courses',
            style: TextStyle(
                fontFamily: 'Avenir',
                fontWeight: FontWeight.w800,
                fontSize: 40,
                color: Colors.black87),
          ),
          items: ['pharmacy', 'economics']
              .map((course) => DropdownMenuItem(
                    value: course,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextResponsive(
                        '$course',
                        style: TextStyle(
                            fontFamily: 'Avenir',
                            fontWeight: FontWeight.w800,
                            fontSize: 40,
                            color: Colors.black87),
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              course = value;
            });
            getClasses(context, value);
          }),
    );
  }

//get classes from firestore
  void getClasses(BuildContext context, String course) {
    final classesCubit = BlocProvider.of<ClassesCubit>(context);
    classesCubit.getClasses(course: course);
  }
}
