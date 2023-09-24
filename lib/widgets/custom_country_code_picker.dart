import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomCountryCodePicker extends StatelessWidget {
  const CustomCountryCodePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CountryCodePicker(
      padding: EdgeInsets.zero,
      showDropDownButton: true,
      alignLeft: true,
      showFlag: true,
      hideSearch: true,
      initialSelection: 'Pakistan',
      textOverflow: TextOverflow.ellipsis,
      dialogBackgroundColor: const Color(0xffeee8f4),
      dialogTextStyle: const TextStyle(color: Colors.black54),
      favorite: const ['Pakistan', 'United States', 'Canada'],
      showFlagMain: false,
      dialogSize: Size.fromHeight(Get.height * 0.6),
    );
  }
}