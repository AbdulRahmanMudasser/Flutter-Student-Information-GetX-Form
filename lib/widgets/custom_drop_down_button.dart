import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/responsive/app_size.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  final String value;
  final void Function(String?) onChanged;
  final List<DropdownMenuItem<String>> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.baseSize * 21.5,
      child: DropdownButton<String>(
        borderRadius: BorderRadius.circular(12),
        underline: Container(
          color: const Color(0xffa91079),
          height: 1,
        ),
        value: value,
        onChanged: onChanged,
        items: items,
        style: GoogleFonts.mooli(
          fontWeight: FontWeight.w600,
          color: Colors.black54,
          fontSize: 15,
        ),
        isExpanded: true,
        dropdownColor: const Color(0xfff9f2ff),
        elevation: 0,
        padding: const EdgeInsets.only(right: 10),
        // isDense: true,
      ),
    );
  }
}