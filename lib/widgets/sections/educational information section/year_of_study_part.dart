import 'package:flutter/material.dart';

import '../../../controllers/form_controller.dart';
import '../../custom_drop_down_button.dart';
import '../../heading_text.dart';

class YearOfStudyPart extends StatelessWidget {
  const YearOfStudyPart({
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
        // year of study heading
        HeadingText(headingText: heading),

        // year of study drop down button
        CustomDropDownButton(
          value: controller.yearOfStudySelectedValue.value,
          onChanged: (String? value) {
            controller.updateYearOfStudySelectedValue(value!);
          },
          items: controller.yearOfStudyList.map<DropdownMenuItem<String>>(
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