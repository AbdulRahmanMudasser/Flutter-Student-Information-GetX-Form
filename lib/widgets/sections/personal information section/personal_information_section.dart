import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../section_heading.dart';
import 'age_part.dart';
import 'date_of_birth_part.dart';
import 'name_part.dart';

class PersonalInformationSection extends StatelessWidget {
  const PersonalInformationSection({
    super.key,
    required this.controller,
    required this.sectionHeading,
  });

  final String sectionHeading;
  final FormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // personal information section text
        SectionHeading(sectionText: sectionHeading),

        const SizedBox(
          height: 25,
        ),

        // name and age
        Row(
          children: [
            Expanded(
              flex: 3,
              child: NamePart(
                heading: "Name",
                controller: controller,
              ),
            ),

            // age text box
            Expanded(
              child: AgePart(
                heading: "Age",
                controller: controller,
              ),
            ),
          ],
        ),

        const SizedBox(
          height: 25,
        ),

        // date of birth
        DOBPart(
          heading: "Date of Birth",
          controller: controller,
        ),
      ],
    );
  }
}