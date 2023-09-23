import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_text_field.dart';
import '../../heading_text.dart';

class NamePart extends StatelessWidget {
  const NamePart({
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
        // full name
        HeadingText(headingText: heading),

        // full name text field
        CustomTextField(
          controller: controller.nameController,
          onSaved: (value) {
            controller.name = value!;
          },
          validator: (value) {
            return controller.validateEmptyFields(value!);
          },
        ),
      ],
    );
  }
}