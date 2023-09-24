import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/controllers/form_controller.dart';
import 'package:flutter_student_info_getx_form/widgets/custom_card.dart';
import 'package:flutter_student_info_getx_form/widgets/custom_checkbox_list_tile.dart';
import 'package:flutter_student_info_getx_form/widgets/heading_text.dart';
import 'package:get/get.dart';

class TechnicalSkillsPart extends StatelessWidget {
  const TechnicalSkillsPart({
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
            controller.technicalSkills.length,
            (index) {
              return CustomCheckboxListTile(
                controller: controller,
                index: index,
                skillsList: controller.technicalSkills,
                gotAnySkillsList: controller.gotAnyTechnicalSkill,
              );
            },
          ),
        ),

        // checked skills
        Obx(
          () {
            return Wrap(
              children: List.generate(
                controller.gotAnyTechnicalSkill.length,
                (index) {
                  if (controller.gotAnyTechnicalSkill[index] == true) {
                    return CustomCard(
                      controller: controller,
                      index: index,
                      skillsList: controller.technicalSkills,
                      gotAnySkillsList: controller.gotAnyTechnicalSkill,
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
