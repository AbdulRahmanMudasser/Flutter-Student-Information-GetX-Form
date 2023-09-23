import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_text_field.dart';
import '../../heading_text.dart';

class AgePart extends StatelessWidget {
  const AgePart({
    super.key,
    required this.controller,
    required this.heading,
  });

  final FormController controller;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeadingText(headingText: heading),

        // date of birth text field
        CustomTextField(
          controller: controller.ageController,
          keyboardType: TextInputType.number,
        ),
      ],
    );
  }
}