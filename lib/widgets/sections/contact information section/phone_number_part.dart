import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_country_code_picker.dart';
import '../../custom_text_field.dart';
import '../../heading_text.dart';

class PhoneNumberPart extends StatelessWidget {
  const PhoneNumberPart({
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
        // phone number text
        HeadingText(headingText: heading),

        Row(
          children: [
            const Expanded(
              child: CustomCountryCodePicker(),
            ),

            // phone number text field
            Expanded(
              flex: 2,
              child: CustomTextField(
                controller: controller.phoneNumberController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
      ],
    );
  }
}