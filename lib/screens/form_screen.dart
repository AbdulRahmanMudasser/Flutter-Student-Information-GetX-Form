import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/config/responsive/app_size.dart';
import 'package:flutter_student_info_getx_form/config/responsive/responsive_layout.dart';
import 'package:flutter_student_info_getx_form/controllers/form_controller.dart';
import 'package:get/get.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/heading_text.dart';
import '../widgets/section_heading.dart';

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
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: controller.studentInformationForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // student information
                  ResponsiveLayout(
                    mobile: Text(
                      "Student Information",
                      style: TextStyle(
                        fontSize: AppSize.baseSize * 2.9,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff5e0495),
                      ),
                    ),
                    tablet: Text(
                      "Student Information",
                      style: TextStyle(
                        fontSize: AppSize.baseSize * 2.1,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff5e0495),
                      ),
                    ),
                    desktop: Text(
                      "Student Information",
                      style: TextStyle(
                        fontSize: AppSize.baseSize * 2.1,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff5e0495),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 35,
                  ),

                  // bio data section text
                  const SectionHeading(sectionText: "Bio Data"),

                  const SizedBox(
                    height: 30,
                  ),

                  // first name
                  const HeadingText(headingText: "First Name"),

                  // first name text field
                  CustomTextField(
                    controller: controller.firstNameController,
                    onSaved: (value) {
                      controller.firstName = value!;
                    },
                    validator: (value) {
                      return controller.validateFirstNameAndFatherName(value!);
                    },
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // last name and age
                  Row(
                    children: [
                      // last name text box
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeadingText(headingText: "Last Name"),

                            // last name text field
                            CustomTextField(
                              controller: controller.lastNameController,
                              onSaved: (value) {
                                controller.lastName = value!;
                              },
                            ),
                          ],
                        ),
                      ),

                      // age text box
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText(headingText: "Age"),

                            // date of birth text field
                            CustomTextField(
                              keyboardType: TextInputType.number,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // date of birth
                  const HeadingText(headingText: "Date of Birth"),

                  // date of birth text field
                  const CustomTextField(),

                  const SizedBox(
                    height: 25,
                  ),

                  Row(
                    children: [
                      // father's name
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const HeadingText(headingText: "Father's Name"),

                            // father name text field
                            CustomTextField(
                              controller: controller.fatherNameController,
                              onSaved: (value) {
                                controller.fatherName = value!;
                              },
                              validator: (value) {
                                return controller.validateFirstNameAndFatherName(value!);
                              },
                            ),
                          ],
                        ),
                      ),

                      // father's occupation
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeadingText(headingText: "Father's Occupation"),

                            // father's occupation text field
                            CustomTextField(),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // email
                  const HeadingText(headingText: "Email"),

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

                  const SizedBox(
                    height: 25,
                  ),

                  const SectionHeading(sectionText: "Education"),

                  const SizedBox(
                    height: 30,
                  ),

                  // high school name text
                  const HeadingText(headingText: "High School"),

                  // high school name text field
                  const CustomTextField(),

                  const SizedBox(
                    height: 25,
                  ),

                  // college name text
                  const HeadingText(headingText: "College"),

                  // college name text field
                  const CustomTextField(),

                  const SizedBox(
                    height: 25,
                  ),

                  const SectionHeading(sectionText: "Locality"),

                  const SizedBox(
                    height: 30,
                  ),

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
