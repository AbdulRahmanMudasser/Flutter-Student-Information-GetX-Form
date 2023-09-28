import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/controllers/data_controller.dart';
import 'package:flutter_student_info_getx_form/screens/data_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormController extends GetxController {
  // form key
  final GlobalKey<FormState> studentInformationForm = GlobalKey<FormState>();

  // instance of data controller
  final DataController dataController = Get.find<DataController>();

  // Personal Information Section - Text Controllers
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController ageController;

  // Contact Information Section - Text Controllers
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController addressController;
  late TextEditingController postalCodeController;

  // Education Information - Text Controllers
  late TextEditingController institutionNameController;
  late TextEditingController studentIdController;

  late TextEditingController fatherNameController;

  // we can also check for password if it is valid or not
  late TextEditingController passwordController;

  // variables to store the value
  var name = '';
  var dob = '';
  var age = '';

  var selectedDate = DateTime
      .now()
      .obs;
  RxBool isDatePickedBoolean = false.obs;

  var email = '';
  var phoneNumber = '';
  var address = '';
  var postalCode = '';

  var institutionName = '';
  var studentId = '';

  var fatherName = '';

  // store password in a variable
  var password = '';

  // selected value from fields of study drop down menu
  var fieldsOfStudySelectedValue = 'Biology'.obs;

  // selected value from year of study
  var yearOfStudySelectedValue = 'Freshman'.obs;

  var checkboxSelected = false.obs;

  // list of fields of study
  List<String> fieldsOfStudyList = [
    'Biology',
    'Computer Science',
    'Psychology',
    'Business Administration',
    'History',
  ];

  // list of year of study
  List<String> yearOfStudyList = [
    'Freshman', // first year undergraduate student
    'Sophomore', // second year undergraduate student
    'Junior', // third year undergraduate student
    'Senior', // fourth year undergraduate student
    'Graduate', // student pursuing a master
  ];

  // list of programming languages skills
  RxList<String> programmingSkills = ["Dart", "Python", "JavaScript"].obs;

  // list of skills got in programming languages
  RxList<bool> gotAnyProgrammingSkills = [false, false, false].obs;

  // list of technical works
  RxList<String> technicalSkills =
      ["Mobile App Development", "Data Analysis", "Web Development"].obs;

  // list of skills got in technical works
  RxList<bool> gotAnyTechnicalSkill = [false, false, false].obs;

  // list of technical works
  RxList<String> softSkills = ["Communication", "Problem Solving", "Leadership"].obs;

  // list of skills got in technical works
  RxList<bool> gotAnySoftSkill = [false, false, false].obs;

  // initialize the controllers
  @override
  void onInit() {
    super.onInit();

    nameController = TextEditingController();
    dobController = TextEditingController();
    ageController = TextEditingController();

    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    addressController = TextEditingController();
    postalCodeController = TextEditingController();

    institutionNameController = TextEditingController();
    studentIdController = TextEditingController();

    fatherNameController = TextEditingController();

    // we also have to initialize the password controller
    passwordController = TextEditingController();
  }

  // dispose the controllers
  @override
  void onClose() {
    super.onClose();

    nameController.dispose();
    dobController.dispose();
    ageController.dispose();

    emailController.dispose();
    postalCodeController.dispose();
    phoneNumberController.dispose();

    institutionNameController.dispose();
    studentIdController.dispose();

    fatherNameController.dispose();

    // we also have to dispose the password controller
    passwordController.dispose();
  }

  // method to validate email
  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide Valid Email";
    }
    return null;
  }

  // validate first name, father's name, college/university name
  String? validateEmptyFields(String value) {
    if (value.isEmpty) {
      return "Field should not be empty";
    }

    return null;
  }

  // validate length code
  String? validateLength(String value) {
    if (value.length < 5) {
      return "Length cannot be less than 5 digits";
    }

    return null;
  }

  // method to validate password
  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must be of 6 characters";
    }

    return null;
  }

  String? validatePhoneNumber(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "Phone number not valid";
    }

    return null;
  }

  // pick date
  pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2024),
      initialEntryMode: DatePickerEntryMode.input,
      cancelText: 'Cancel',
      confirmText: 'Confirm',
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      selectedDate.value = pickedDate;
      isDatePickedBoolean.value = true;
    }
  }

  // is date picked method
  isDatePicked() {
    if (isDatePickedBoolean.value) {
      return DateFormat("dd-MM-yyyy").format(selectedDate.value);
    } else {
      return '';
    }
  }

  // update the selected value of fields of study drop down menu
  updateFieldsOfStudySelectedValue(String value) {
    fieldsOfStudySelectedValue.value = value;
  }

  // update the selected value of year of study drop down menu
  updateYearOfStudySelectedValue(String value) {
    yearOfStudySelectedValue.value = value;
  }

  // update programming skills
  void updateSkills(list, index) {
    list[index] = !list[index];
  }

  // validate the form
  void checkFormValidation() {
    final isValid = studentInformationForm.currentState!.validate(); // will contain true of false

    if (!isValid) {
      return;
    }

    studentInformationForm.currentState!.save();

    dataController.onSubmit();

    Get.to(DataScreen());
  }
}
