import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormController extends GetxController {
  // form key
  final GlobalKey<FormState> studentInformationForm = GlobalKey<FormState>();

  // text controllers
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController dobController;
  late TextEditingController ageController;
  late TextEditingController fatherNameController;
  late TextEditingController emailController;

  // we can also check for password if it is valid or not
  late TextEditingController passwordController;

  // variables to store the value
  var firstName = '';
  var lastName = '';
  var dob = '';
  var age = '';
  var fatherName = '';
  var email = '';

  // store password in a variable
  var password = '';

  // initialize the controllers
  @override
  void onInit() {
    super.onInit();

    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    dobController = TextEditingController();
    ageController = TextEditingController();
    fatherNameController = TextEditingController();
    emailController = TextEditingController();

    // we also have to initialize the password controller
    passwordController = TextEditingController();
  }

  // dispose the controllers
  @override
  void onClose() {
    super.onClose();

    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    ageController.dispose();
    fatherNameController.dispose();
    emailController.dispose();

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

  String? validateFirstNameAndFatherName(String value) {
    if (value.isEmpty) {
      return "Field should not be empty";
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

  // validate the form
  void checkFormValidation() {
    final isValid = studentInformationForm.currentState!.validate(); // will contain true of false

    if (!isValid) {
      return;
    }

    studentInformationForm.currentState!.save();
  }
}
