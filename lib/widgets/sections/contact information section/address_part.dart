import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_text_field.dart';
import '../../heading_text.dart';

class AddressPart extends StatelessWidget {
  const AddressPart({
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
        // address
        HeadingText(headingText: heading),

        // address text field
        CustomTextField(
          controller: controller.addressController,
          onSaved: (value) {
            controller.address = value!;
          },
        ),
      ],
    );
  }
}