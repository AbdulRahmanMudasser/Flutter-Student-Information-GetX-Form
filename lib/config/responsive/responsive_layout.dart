import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width <= 425;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width < 1050;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1050;
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width >= 1050) {
      return desktop;
    } else if (width >= 430 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}