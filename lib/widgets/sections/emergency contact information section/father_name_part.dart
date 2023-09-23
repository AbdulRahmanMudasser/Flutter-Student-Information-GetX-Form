import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_text_field.dart';
import '../../heading_text.dart';

class FatherNamePart extends StatelessWidget {
  const FatherNamePart({
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
        HeadingText(headingText: heading),

        // father name text field
        CustomTextField(
          controller: controller.fatherNameController,
          onSaved: (value) {
            controller.fatherName = value!;
          },
          validator: (value) {
            return controller.validateEmptyFields(value!);
          },
        ),
      ],
    );
  }
}