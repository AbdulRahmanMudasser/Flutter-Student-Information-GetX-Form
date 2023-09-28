import 'package:flutter/material.dart';
import 'package:flutter_student_info_getx_form/bindings/form_bindings.dart';
import 'package:flutter_student_info_getx_form/screens/data_screen.dart';
import 'package:flutter_student_info_getx_form/screens/form_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Student Form',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.mooliTextTheme()
      ),
      initialRoute: '/form',
      getPages: [
        GetPage(name: '/form', page: () => const FormScreen()),
        GetPage(name: '/data', page: () =>  DataScreen()), // Register DataScreen
      ],
      debugShowCheckedModeBanner: false,
      home:  const FormScreen(),
      initialBinding: FormBinding(),
    );
  }
}
