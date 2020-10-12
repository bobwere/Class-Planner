import 'package:bloc_test/bloc_test.dart';
import 'package:class_planner/src/cubit/classes_cubit.dart';
import 'package:class_planner/src/data/models/classes_model.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:class_planner/src/data/repository/classes_repository.dart';

class MockClassesRepository extends Mock implements IClassesFacade {}

void main() {
  MockClassesRepository mockClassesRepository;
  ClassesCubit classesCubit;

  setUp(() {
    mockClassesRepository = MockClassesRepository();
    classesCubit = ClassesCubit(mockClassesRepository);
  });

  group('get lessons from firebase', () {
    final classe = Classes(
        color: '#FFFFFF',
        starttime: '8.00 A.M',
        endtime: '9:00 A.M',
        lecturer: 'Dr.David',
        location: 'BS 15',
        order: '2',
        subject: 'Clinical Medicine');
    final listOfClasses = [classe];

    blocTest<ClassesCubit, ClassesState>(
      'emits [] when nothing is called or initial state',
      build: () => classesCubit,
      expect: [],
    );

    blocTest<ClassesCubit, ClassesState>(
        'should emit [CLASSESLOADING , CLASSESLOADED ] when successful',
        build: () {
          when(mockClassesRepository.getClassDetails(day: '4', course: 'econ'))
              .thenAnswer((_) async => listOfClasses);
          return classesCubit;
        },
        act: (cubit) async => cubit.getClasses(day: 4, course: 'econ'),
        expect: [isA<ClassesLoading>(), isA<ClassesLoaded>()]);

    blocTest<ClassesCubit, ClassesState>(
        'should emit [CLASSESLOADING , CLASSESERROR ] when unsuccessful',
        build: () {
          when(mockClassesRepository.getClassDetails(day: '4', course: 'econ'))
              .thenThrow(Exception('any'));
          return classesCubit;
        },
        act: (cubit) async => cubit.getClasses(day: 4, course: 'econ'),
        expect: [isA<ClassesLoading>(), isA<ClassesError>()],
        verify: (_) {
          verify(mockClassesRepository.getClassDetails(
                  day: '4', course: 'econ'))
              .called(1);
        });
  });
}
