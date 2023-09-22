import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/config/responsive/app_size.dart';
import 'package:flutter_student_info_getx_form/config/responsive/responsive_layout.dart';
import 'package:flutter_student_info_getx_form/controllers/form_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child: Obx(
            () => SingleChildScrollView(
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

                    const SizedBox(
                      height: 30,
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
                      children: [
                        Expanded(
                          child: CountryCodePicker(
                            padding: EdgeInsets.zero,
                            showDropDownButton: true,
                            alignLeft: true,
                            showFlag: true,
                            hideSearch: true,
                            initialSelection: 'Pakistan',
                            dialogBackgroundColor:  const Color(0xffe8d1f5),
                            dialogTextStyle: const TextStyle(
                              color: Colors.black54
                            ),
                            favorite: const ['Pakistan', 'United States', 'Canada'],
                            showFlagMain: false,
                            dialogSize: Size.fromHeight(Get.height * 0.6),
                          ),
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

                    const SizedBox(
                      height: 30,
                    ),

                    // Education Information Section Heading
                    const SectionHeading(sectionText: "Educational Information"),

                    const SizedBox(
                      height: 25,
                    ),

                    // student id
                    const HeadingText(headingText: "Student ID"),

                    CustomTextField(
                      controller: controller.studentIdController,
                      onSaved: (value) {
                        controller.studentId = value!;
                      },
                      validator: (value) {
                        return controller.validateLength(value!);
                      },
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // institution name text
                    const HeadingText(headingText: "Institution Name"),

                    // institution name text field
                    CustomTextField(
                      controller: controller.institutionNameController,
                      onSaved: (value) {
                        controller.institutionName = value!;
                      },
                      validator: (value) {
                        return controller.validateEmptyFields(value!);
                      },
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // field of study
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HeadingText(headingText: "Field of Study"),
                        DropdownButton<String>(
                          borderRadius: BorderRadius.circular(12),
                          itemHeight: 50,
                          underline: Container(
                            color: const Color(0xffa91079),
                            height: 1,
                          ),
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
                          style: GoogleFonts.mooli(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          // isExpanded: true,
                          dropdownColor: const Color(0xffe8d1f5),
                          elevation: 0,
                          padding: const EdgeInsets.only(right: 10),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 25,
                    ),

                    // field of study
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const HeadingText(headingText: "Year of Study"),
                        DropdownButton<String>(
                          borderRadius: BorderRadius.circular(12),
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
                          style: GoogleFonts.mooli(
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                            fontSize: 15,
                          ),
                          // isExpanded: true,
                          dropdownColor: const Color(0xffe8d1f5),
                          elevation: 0,
                          isDense: true,
                          underline: Container(
                            color: const Color(0xffa91079),
                            height: 1,
                          ),
                          padding: const EdgeInsets.only(right: 10),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    // Emergency Contact Information Section
                    const SectionHeading(sectionText: "Emergency Contact Information"),

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
      ),
    );
  }
}
