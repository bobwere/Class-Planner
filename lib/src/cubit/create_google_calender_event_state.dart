part of 'create_google_calender_event_cubit.dart';

@immutable
abstract class CreateGoogleCalenderEventState {
  const CreateGoogleCalenderEventState();
}

class CreateGoogleCalenderEventInitial extends CreateGoogleCalenderEventState {
  const CreateGoogleCalenderEventInitial();
}

class CreateGoogleCalenderEventLoading extends CreateGoogleCalenderEventState {
  const CreateGoogleCalenderEventLoading();
}

class CreateGoogleCalenderEventSuccess extends CreateGoogleCalenderEventState {
  const CreateGoogleCalenderEventSuccess();
}

class CreateGoogleCalenderEventError extends CreateGoogleCalenderEventState {
  final String message;
  const CreateGoogleCalenderEventError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CreateGoogleCalenderEventError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
