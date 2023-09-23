import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/widgets/sections/contact%20information%20section/phone_number_part.dart';

import '../../../controllers/form_controller.dart';
import '../../section_heading.dart';
import 'address_part.dart';
import 'email_part.dart';

class ContactInformationSection extends StatelessWidget {
  const ContactInformationSection({
    super.key,
    required this.sectionHeading,
    required this.controller,
  });

  final String sectionHeading;
  final FormController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // section heading
        SectionHeading(sectionText: sectionHeading),

        const SizedBox(
          height: 25,
        ),

        // email part
        EmailPart(
          heading: "Email",
          controller: controller,
        ),

        const SizedBox(
          height: 25,
        ),

        // phone number part
        PhoneNumberPart(
          heading: "Phone Number",
          controller: controller,
        ),

        const SizedBox(
          height: 25,
        ),

        // address part
        AddressPart(
          heading: "Address",
          controller: controller,
        ),
      ],
    );
  }
}