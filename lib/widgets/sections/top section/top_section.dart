import 'package:flutter/material.dart';

import '../../../config/responsive/app_size.dart';
import '../../../config/responsive/responsive_layout.dart';

class TopSection extends StatelessWidget {
  const TopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}