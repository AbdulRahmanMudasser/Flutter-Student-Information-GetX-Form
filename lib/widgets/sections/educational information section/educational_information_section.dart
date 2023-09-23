import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../section_heading.dart';
import 'field_of_study_part.dart';
import 'institution_name_part.dart';
import 'student_id_part.dart';
import 'year_of_study_part.dart';

class EducationalInformationSection extends StatelessWidget {
  const EducationalInformationSection({
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
        // Education Information Section Heading
        SectionHeading(sectionText: sectionHeading),

        const SizedBox(
          height: 25,
        ),

        // student id part
        StudentIDPart(heading: "Student ID", controller: controller),

        const SizedBox(
          height: 25,
        ),

        // institution name part
        InstitutionNamePart(heading: "Institution Name", controller: controller),

        const SizedBox(
          height: 25,
        ),

        // field of study part
        FieldOfStudyPart(heading: "Field of Study", controller: controller),

        const SizedBox(
          height: 25,
        ),

        // year of study part
        YearOfStudyPart(heading: "Year of Study", controller: controller),
      ],
    );
  }
}