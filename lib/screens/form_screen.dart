import 'package:country_code_picker/country_code_picker.dart';
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
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              key: controller.studentInformationForm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // student information
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ResponsiveLayout(
                      mobile: Text(
                        "Student Profile",
                        style: TextStyle(
                          fontSize: AppSize.baseSize * 2.9,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff5e0495),
                        ),
                      ),
                      tablet: Text(
                        "Student Profile",
                        style: TextStyle(
                          fontSize: AppSize.baseSize * 2.1,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff5e0495),
                        ),
                      ),
                      desktop: Text(
                        "Student Profile",
                        style: TextStyle(
                          fontSize: AppSize.baseSize * 2.1,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff5e0495),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 30,
                  ),

                  // bio data section text
                  const SectionHeading(sectionText: "Personal Information"),

                  const SizedBox(
                    height: 25,
                  ),

                  // name and age
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // full name
                            const HeadingText(headingText: "Name"),

                            // full name text field
                            CustomTextField(
                              controller: controller.nameController,
                              onSaved: (value) {
                                controller.name = value!;
                              },
                              validator: (value) {
                                return controller.validateEmptyFields(value!);
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
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.only(left: AppSize.baseSize),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: controller.isDatePicked(), enabled: false),
                            ),
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
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // section heading
                  const SectionHeading(sectionText: "Contact Information"),

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

                  // phone number text
                  const HeadingText(headingText: "Phone Number"),

                  Row(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CountryCodePicker(
                          padding: EdgeInsets.zero,
                          showDropDownButton: true,
                          alignLeft: true,
                          showFlag: true,
                          initialSelection: 'Pakistan',
                          favorite: const ['Pakistan', 'United States', 'Canada'],
                          showFlagMain: false,
                          dialogSize: Size.fromHeight(Get.height * 0.7),
                        ),
                      ),

                      // phone number text field
                      Expanded(
                        flex: 2,
                        child: CustomTextField(
                          controller: controller.phoneNumberController,
                          // onSaved: (value) {
                          //   controller.phoneNumber = value!;
                          // },
                          // validator: (value) {
                          //   return controller.validatePhoneNumber(value!);
                          // },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // address
                  const HeadingText(headingText: "Address"),

                  // address text field
                  CustomTextField(
                    controller: controller.addressController,
                    onSaved: (value) {
                      controller.address = value!;
                    },
                  ),

                  // const SizedBox(
                  //   height: 25,
                  // ),
                  //
                  // // postal code
                  // const HeadingText(headingText: "Postal Code"),
                  //
                  // CustomTextField(
                  //   controller: controller.postalCodeController,
                  //   onSaved: (value) {
                  //     controller.postalCode = value!;
                  //   },
                  //   validator: (value) {
                  //     return controller.validatePostalCode(value!);
                  //   },
                  // ),

                  const SizedBox(
                    height: 25,
                  ),

                  const SectionHeading(sectionText: "Educational Information"),

                  const SizedBox(
                    height: 25,
                  ),

                  // high school name text
                  const HeadingText(headingText: "High School"),

                  // high school name text field
                  CustomTextField(
                    controller: controller.highSchoolController,
                    onSaved: (value) {
                      controller.highSchool = value!;
                    },
                    validator: (value) {
                      return controller.validateEmptyFields(value!);
                    },
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // college name text
                  const HeadingText(headingText: "College"),

                  // college name text field
                  CustomTextField(
                    controller: controller.collegeController,
                    onSaved: (value) {
                      controller.college = value!;
                    },
                    validator: (value) {
                      return controller.validateEmptyFields(value!);
                    },
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  const HeadingText(headingText: "Father's Name"),

                  // father name text field
                  CustomTextField(
                    controller: controller.fatherNameController,
                    onSaved: (value) {
                      controller.fatherName = value!;
                    },
                    validator: (value) {
                      return controller.validateEmptyFields(value!);
                    },
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  // father's occupation
                  const HeadingText(headingText: "Father's Occupation"),

                  // father's occupation text field
                  const CustomTextField(),

                  const SizedBox(
                    height: 25,
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
