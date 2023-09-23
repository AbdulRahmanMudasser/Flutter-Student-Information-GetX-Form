import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_text_field.dart';
import '../../heading_text.dart';

class InstitutionNamePart extends StatelessWidget {
  const InstitutionNamePart({
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
        // institution name text
        HeadingText(headingText: heading),

        // institution name text field
        CustomTextField(
          controller: controller.institutionNameController,
          onSaved: (value) {
            controller.institutionName = value!;
          },
          validator: (value) {
            return controller.validateEmptyFields(value!);
          },
        ),
      ],
    );
  }
}