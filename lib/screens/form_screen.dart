import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/config/responsive/app_size.dart';
import 'package:flutter_student_info_getx_form/controllers/form_controller.dart';
import 'package:flutter_student_info_getx_form/widgets/sections/skills%20section/skills_section.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/sections/contact information section/contact_information_section.dart';
import '../widgets/sections/educational information section/educational_information_section.dart';
import '../widgets/sections/personal information section/personal_information_section.dart';
import '../widgets/sections/top section/top_section.dart';

class FormScreen extends GetView<FormController> {
  const FormScreen({super.key});

  // final formController = Get.find<FormController>();
  // final HomeController controller = Get.put(HomeController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    AppSize().init();

    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: context.width,
          height: context.height,
          child:SingleChildScrollView(
              child: Form(
                key: controller.studentInformationForm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Section
                    const TopSection(),

                    const SizedBox(height: 30),

                    // Personal Information Section
                    PersonalInformationSection(
                      sectionHeading: "Personal Information",
                      controller: controller,
                    ),

                    const SizedBox(height: 30),

                    // Contact Information Section
                    ContactInformationSection(
                      sectionHeading: "Contact Information",
                      controller: controller,
                    ),

                    const SizedBox(height: 30),

                    // Educational Information Section
                    EducationalInformationSection(
                      sectionHeading: "Educational Information",
                      controller: controller,
                    ),

                    const SizedBox(height: 30),

                    // Skills Section
                    SkillsSection(
                      sectionHeading: "Skills",
                      controller: controller,
                    ),

                    // Emergency Contact Information Section
                    // EmergencyContactInformationSection(
                    //   sectionHeading: "Emergency Contact Information",
                    //   controller: controller,
                    // ),

                    const SizedBox(height: 25),

                    // submit button
                    CustomButton(
                      buttonTitle: "Submit",
                      onPressed: () {
                        controller.checkFormValidation();
                      },
                    ),
                  ],
                ),
              ),
            ),
        ),
      ),
    );
  }
}
