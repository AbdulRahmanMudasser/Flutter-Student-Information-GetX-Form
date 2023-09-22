import 'package:flutter/material.dart';

import '../config/responsive/responsive_layout.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.sectionText,
  });

  final String sectionText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ResponsiveLayout(
        mobile: Text(
          sectionText,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xff5e0495),
          ),
        ),
        tablet: Text(
          sectionText,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xff5e0495),
          ),
        ),
        desktop: Text(
          sectionText,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
            color: Color(0xff5e0495),
          ),
        ),
      ),
    );
  }
}
