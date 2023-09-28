import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/controllers/data_controller.dart';
import 'package:get/get.dart';

class DataScreen extends GetView<DataController> {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return DataTable(
          columns: const [
            DataColumn(
              label: Text("Name"),
            ),
            DataColumn(
              label: Text("Email"),
            ),
            DataColumn(
              label: Text("Age"),
            ),
          ],
          rows: controller.studentsList.map(
            (student) {
              return DataRow(
                cells: [
                  DataCell(
                    Text(student.name),
                  ),
                  DataCell(
                    Text(student.email),
                  ),
                  DataCell(
                    Text(student.age.toString()),
                  ),
                ],
              );
            },
          ).toList(),
        );
      },
    );
  }
}
