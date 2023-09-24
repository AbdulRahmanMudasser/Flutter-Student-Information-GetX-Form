import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/controllers/form_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
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
    return Card(
      color: Colors.deepPurple.shade400,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // programming language name
            Text(
              skillsList[index],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(width: 5),

            // remove/uncheck icon
            GestureDetector(
              onTap: () {
                controller.updateSkills(gotAnySkillsList, index);
              },
              child: const Icon(
                Icons.delete_outline,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}