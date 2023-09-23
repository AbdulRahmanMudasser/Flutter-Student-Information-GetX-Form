import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_text_field.dart';
import '../../heading_text.dart';

class StudentIDPart extends StatelessWidget {
  const StudentIDPart({
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
        // student id
        HeadingText(headingText: heading),

        CustomTextField(
          controller: controller.studentIdController,
          onSaved: (value) {
            controller.studentId = value!;
          },
          validator: (value) {
            return controller.validateLength(value!);
          },
        ),
      ],
    );
  }
}