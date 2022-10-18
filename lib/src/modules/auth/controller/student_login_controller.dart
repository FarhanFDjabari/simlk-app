import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentLoginController extends BaseObjectController {
  final nimController = TextEditingController();
  final passwordController = TextEditingController();
  final RxBool isObscured = true.obs;

  void goToHome() {
    Get.offNamed(PageName.root);
  }
}
