import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_text_field.dart';
import '../../heading_text.dart';
import '../../section_heading.dart';
import 'father_name_part.dart';

class EmergencyContactInformationSection extends StatelessWidget {
  const EmergencyContactInformationSection({
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
        // Emergency Contact Information Section
        SectionHeading(sectionText: sectionHeading),

        const SizedBox(
          height: 25,
        ),

        // father name part
        FatherNamePart(heading: "Father's Name", controller: controller),
      ],
    );
  }
}
