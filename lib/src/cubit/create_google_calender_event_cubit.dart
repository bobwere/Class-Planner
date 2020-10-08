import 'package:bloc/bloc.dart';
import 'package:class_planner/common/util/internet_connection.dart';
import 'package:class_planner/src/data/repository/google_calender_repository.dart';
import 'package:meta/meta.dart';

part 'create_google_calender_event_state.dart';

/*

Cubit to create new event on user google calender


 */
class CreateGoogleCalenderEventCubit
    extends Cubit<CreateGoogleCalenderEventState> {
  final IGoogleCalenderFacade _iGoogleCalenderacade;

  CreateGoogleCalenderEventCubit(this._iGoogleCalenderacade)
      : super(CreateGoogleCalenderEventInitial());

  void createEvent(
      {String title,
      DateTime startTime,
      DateTime endTime,
      String description}) async {
    CreateGoogleCalenderEventLoading();

    try {
      final internetStatus = await isConnected();
      if (!internetStatus) {
        emit(CreateGoogleCalenderEventError("No internet connection"));
        emit(CreateGoogleCalenderEventInitial());
      }
      await _iGoogleCalenderacade.createEvent(
          title: title,
          startTime: startTime,
          endTime: endTime,
          description: description);

      emit(CreateGoogleCalenderEventSuccess());
    } catch (_) {
      emit(CreateGoogleCalenderEventError("Server Error"));
    }
  }
}
