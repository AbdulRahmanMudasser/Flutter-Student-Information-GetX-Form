import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/controllers/form_controller.dart';
import 'package:flutter_student_info_getx_form/widgets/custom_card.dart';
import 'package:flutter_student_info_getx_form/widgets/custom_checkbox_list_tile.dart';
import 'package:flutter_student_info_getx_form/widgets/heading_text.dart';
import 'package:get/get.dart';

class SoftSkillsPart extends StatelessWidget {
  const SoftSkillsPart({
    super.key,
    required this.heading,
    required this.controller,
  });

  final String heading;
  final FormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // technical skills heading
        HeadingText(headingText: heading),

        const SizedBox(
          height: 10,
        ),

        // checkbox list
        Column(
          children: List.generate(
            controller.softSkills.length,
            (index) {
              return CustomCheckboxListTile(
                controller: controller,
                index: index,
                skillsList: controller.softSkills,
                gotAnySkillsList: controller.gotAnySoftSkill,
              );
            },
          ),
        ),

        // checked skills
        Obx(
          () {
            return Wrap(
              children: List.generate(
                controller.gotAnySoftSkill.length,
                (index) {
                  if (controller.gotAnySoftSkill[index] == true) {
                    return CustomCard(
                      controller: controller,
                      index: index,
                      skillsList: controller.softSkills,
                      gotAnySkillsList: controller.gotAnySoftSkill,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
