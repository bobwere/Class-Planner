part of 'classes_cubit.dart';

@immutable
abstract class ClassesState {
  const ClassesState();
}

class ClassesInitial extends ClassesState {
  const ClassesInitial();
}

class ClassesLoading extends ClassesState {
  const ClassesLoading();
}

class NoClassesFound extends ClassesState {
  const NoClassesFound();
}

class ClassesLoaded extends ClassesState {
  final List<Classes> classes;
  const ClassesLoaded(this.classes);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ClassesLoaded && o.classes == classes;
  }

  @override
  int get hashCode => classes.hashCode;
}

class ClassesError extends ClassesState {
  final String message;
  const ClassesError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ClassesError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
