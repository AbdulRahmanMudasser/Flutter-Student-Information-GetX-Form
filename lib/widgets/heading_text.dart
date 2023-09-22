import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key, required this.headingText,
  });

  final String headingText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        headingText,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xff5e0495),
        ),
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}