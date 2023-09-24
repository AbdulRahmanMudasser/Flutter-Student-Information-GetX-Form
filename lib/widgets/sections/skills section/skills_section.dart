import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/controllers/form_controller.dart';
import 'package:flutter_student_info_getx_form/widgets/section_heading.dart';
import 'package:flutter_student_info_getx_form/widgets/sections/skills%20section/programming_languages_part.dart';
import 'package:flutter_student_info_getx_form/widgets/sections/skills%20section/soft_skills_part.dart';
import 'package:flutter_student_info_getx_form/widgets/sections/skills%20section/technical_skills_part.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
    required this.sectionHeading,
    required this.controller,
  });

  final String sectionHeading;
  final FormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // section heaeding
        SectionHeading(sectionText: sectionHeading),

        const SizedBox(height: 25),

        // programming languages part
        ProgrammingLanguagesPart(
          heading: "Got Any Programming Skills?",
          controller: controller,
        ),

        const SizedBox(height: 15),

        // technical skills part
        TechnicalSkillsPart(
          heading: "Got Any Technical Skills?",
          controller: controller,
        ),

        const SizedBox(height: 15),

        // soft skills part
        SoftSkillsPart(
          heading: "Got Any Soft Skills?",
          controller: controller,
        ),
      ],
    );
  }
}
