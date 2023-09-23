import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_text_field.dart';
import '../../heading_text.dart';

class DOBPart extends StatelessWidget {
  const DOBPart({
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: CustomTextField(
                hintText: controller.isDatePicked(),
                readOnly: true,
              ),
            ),
            Expanded(
              child: IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: () => controller.pickDate(),
              ),
            )
          ],
        ),
      ],
    );
  }
}