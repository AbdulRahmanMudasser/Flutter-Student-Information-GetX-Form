import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.keyboardType = TextInputType.name,
    this.controller,
    this.onSaved,
    this.validator,
  });

  final TextEditingController? controller;
  final TextInputType keyboardType;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      autovalidateMode: AutovalidateMode.always,
      keyboardType: keyboardType,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 11),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: UnderlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffa91079), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffa91079), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffa91079), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffa91079), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffa91079), width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        errorStyle: const TextStyle(
          color: Color(0xffa91079),
          fontSize: 14,
        ),
      ),
    );
  }
}