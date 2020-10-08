import 'package:bloc/bloc.dart';
import 'package:class_planner/common/util/int_to_weekday_string.dart';
import 'package:class_planner/common/util/internet_connection.dart';
import 'package:class_planner/src/data/models/classes_model.dart';
import 'package:class_planner/src/data/repository/classes_repository.dart';
import 'package:meta/meta.dart';

part 'classes_state.dart';

/*
 Cubit to retrieve data from firestore
 */
class ClassesCubit extends Cubit<ClassesState> {
  final IClassesFacade _iClassesFacade;

  ClassesCubit(this._iClassesFacade) : super(ClassesInitial());

  //default course and weekday
  var defaultcourse = 'economics';
  var defaultday = convertToDayOfWeek(DateTime.now().weekday);

  Future<void> getClasses({String course, int day}) async {
    var selectedcourse;
    if (course == null) {
      selectedcourse = defaultcourse;
    } else {
      selectedcourse = course;
      defaultcourse = course;
    }

    var selectedday;
    if (day == null) {
      selectedday = defaultday;
    } else {
      selectedday = convertToDayOfWeek(day);
      defaultday = convertToDayOfWeek(day);
    }

    if (selectedday == 'saturday' || selectedday == 'sunday') {
      emit(NoClassesFound());
    } else {
      emit(ClassesLoading());
      final internetStatus = await isConnected();

      if (!internetStatus) {
        emit(ClassesError("No internet connection"));
      } else {
        try {
          final classes = await _iClassesFacade.getClassDetails(
              course: selectedcourse, day: selectedday);

          emit(ClassesLoaded(classes));
        } catch (e) {
          emit(ClassesError("Server Error"));
        }
      }
    }
  }
}
