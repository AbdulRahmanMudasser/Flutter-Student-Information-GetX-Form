import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.flex = 1,
  });

  final int flex;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Column(
        children: [
          Container(
            height: 2,
            width: double.infinity,
            color: const Color(0xffa91079),
          ),
          const SizedBox(
            height: 3,
          ),
          Container(
            height: 2,
            width: double.infinity,
            color: const Color(0xffa91079),
          ),
        ],
      ),
    );
  }
}