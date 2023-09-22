import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormController extends GetxController {
  // form key
  final GlobalKey<FormState> studentInformationForm = GlobalKey<FormState>();

  // Personal Information Section Text Controllers
  late TextEditingController nameController;
  late TextEditingController dobController;
  late TextEditingController ageController;

  // Contact Information Section Text Controllers
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController addressController;
  late TextEditingController postalCodeController;

  // Education Information Text Controllers
  late TextEditingController highSchoolController;
  late TextEditingController collegeController;

  late TextEditingController fatherNameController;

  // we can also check for password if it is valid or not
  late TextEditingController passwordController;

  // variables to store the value
  var name = '';
  var dob = '';
  var age = '';

  var selectedDate = DateTime.now().obs;
  RxBool isDatePickedBoolean = false.obs;

  var email = '';
  var phoneNumber = '';
  var address = '';
  var postalCode = '';

  var highSchool = '';
  var college = '';

  var fatherName = '';

  // store password in a variable
  var password = '';

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

    highSchoolController = TextEditingController();
    collegeController = TextEditingController();

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

    highSchoolController.dispose();
    collegeController.dispose();

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

  // validate first name, father's name, high school name, college name
  String? validateEmptyFields(String value) {
    if (value.isEmpty) {
      return "Field should not be empty";
    }

    return null;
  }

  // validate postal code
  String? validatePostalCode(String value) {
    if (value.length < 5) {
      return "Enter Correct Postal Code";
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

  isDatePicked() {
    if (isDatePickedBoolean.value) {
      return DateFormat("dd-MM-yyyy").format(selectedDate.value);
    } else {
      return '';
    }
  }

  // validate the form
  void checkFormValidation() {
    final isValid = studentInformationForm.currentState!.validate(); // will contain true of false

    if (!isValid) {
      return;
    }

    studentInformationForm.currentState!.save();
  }
}
