import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/controllers/form_controller.dart';
import 'package:flutter_student_info_getx_form/widgets/heading_text.dart';
import 'package:get/get.dart';

import '../../custom_card.dart';
import '../../custom_checkbox_list_tile.dart';

class ProgrammingLanguagesPart extends StatelessWidget {
  const ProgrammingLanguagesPart({
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
        // programming skills heading
        HeadingText(headingText: heading),

        const SizedBox(height: 10),

        // checkbox list
        Column(
          children: List.generate(
            controller.programmingSkills.length,
            (index) {
              return CustomCheckboxListTile(
                controller: controller,
                index: index,
                skillsList: controller.programmingSkills,
                gotAnySkillsList: controller.gotAnyProgrammingSkills,
              );
            },
          ),
        ),

        // checked boxes card
        Obx(
          () {
            return Wrap(
              children: List.generate(
                controller.gotAnyProgrammingSkills.length,
                (index) {
                  if (controller.gotAnyProgrammingSkills[index]) {
                    return CustomCard(
                      controller: controller,
                      index: index,
                      skillsList: controller.programmingSkills,
                      gotAnySkillsList: controller.gotAnyProgrammingSkills,
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
