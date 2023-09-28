import 'package:flutter_student_info_getx_form/controllers/form_controller.dart';
import 'package:get/get.dart';

import '../models/student_model.dart';

class DataController extends GetxController {
  final formController = Get.find<FormController>();

  RxList<StudentModel> studentsList = <StudentModel>[].obs;

  // add students
  void addStudentToStudentsList(StudentModel student) {
    studentsList.add(student);
  }

  void onSubmit() {
    final studentData = StudentModel(
      name: formController.name,
      email: formController.email,
      age: int.parse(formController.age),
    );

    addStudentToStudentsList(studentData);
  }
}