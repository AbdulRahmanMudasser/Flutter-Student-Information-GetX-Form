import 'package:get/get.dart';

import '../controllers/form_controller.dart';

class FormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormController>(() => FormController());
  }
}
