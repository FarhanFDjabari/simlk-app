import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentCompleteProfileController extends BaseObjectController {
  final dosenPaController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final lineIdController = TextEditingController();

  @override
  void dispose() {
    dosenPaController.dispose();
    phoneNumberController.dispose();
    lineIdController.dispose();
    super.dispose();
  }

  void goToHome() {
    Get.offAllNamed(PageName.root);
  }
}
