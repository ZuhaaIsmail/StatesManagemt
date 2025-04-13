
import 'package:flutter/cupertino.dart';
import 'package:states_mgmt_project/models/student.dart';

class StudentDataProvider extends ChangeNotifier {

  final List<Student> _students = [];

  List<Student> getStudents() => _students;

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }

  void delStudent(int index) {
    _students.removeAt(index);
    notifyListeners();
  }

  void updateStudent(int index, Student student) {
    _students[index] = student;
    notifyListeners();
  }
}