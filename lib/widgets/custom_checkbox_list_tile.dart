import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/controllers/form_controller.dart';
import 'package:get/get.dart';

class CustomCheckboxListTile extends StatelessWidget {
  const CustomCheckboxListTile({
    super.key,
    required this.controller,
    required this.index,
    required this.skillsList,
    required this.gotAnySkillsList,
  });

  final FormController controller;
  final int index;
  final RxList<String> skillsList;
  final RxList<bool> gotAnySkillsList;

  @override
  Widget build(BuildContext context) {
    final FormController controller = FormController();

    return Obx(
      () {
        return CheckboxListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          checkboxShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          checkboxSemanticLabel: skillsList[index],
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          title: Text(
            skillsList[index],
            style: const TextStyle(fontSize: 14),
          ),
          value: gotAnySkillsList[index],
          onChanged: (value) {
            controller.updateSkills(gotAnySkillsList, index);
          },
        );
      },
    );
  }
}
