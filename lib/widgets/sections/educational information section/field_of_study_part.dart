import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_drop_down_button.dart';
import '../../heading_text.dart';

class FieldOfStudyPart extends StatelessWidget {
  const FieldOfStudyPart({
    super.key,
    required this.heading,
    required this.controller,
  });

  final String heading;
  final FormController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // field of study heading
        HeadingText(headingText: heading),

        // field of study drop down button
        CustomDropDownButton(
          value: controller.fieldsOfStudySelectedValue.value,
          onChanged: (String? value) {
            controller.updateFieldsOfStudySelectedValue(value!);
          },
          items: controller.fieldsOfStudyList.map<DropdownMenuItem<String>>(
                (item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}