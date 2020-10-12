import 'package:class_planner/src/data/models/classes_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IClassesFacade {
  Future<List<Classes>> getClassDetails({String course, String day});
}

class ClassesRepository implements IClassesFacade {
  ClassesRepository();

  @override
  Future<List<Classes>> getClassDetails({String course, String day}) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final classesDocRef = await firestore
        .collection('courses')
        .doc(course)
        .collection(day)
        .orderBy('order')
        .get(GetOptions(source: Source.server))
        .timeout(Duration(seconds: 2))
        .catchError((e) {
      print('Exception occurs: $e');
      throw e;
    });
    List<Classes> classes = classesDocRef.docs.map((snapshot) {
      return Classes.fromJson(
        snapshot.data(),
      );
    }).toList();

    return classes;
  }
}
