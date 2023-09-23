import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_text_field.dart';
import '../../heading_text.dart';

class EmailPart extends StatelessWidget {
  const EmailPart({
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
        // email
        HeadingText(headingText: heading),

        // email text field
        CustomTextField(
          controller: controller.emailController,
          onSaved: (value) {
            controller.email = value!;
          },
          validator: (value) {
            return controller.validateEmail(value!);
          },
        ),
      ],
    );
  }
}