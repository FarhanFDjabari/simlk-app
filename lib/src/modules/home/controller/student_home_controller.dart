import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentHomeController extends BaseListController {
  final RxInt notificationCount = 5.obs;
  final Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<DateTime> selectedDay = DateTime.now().obs;
  final descriptionController = TextEditingController();
  final dummyDateData = [
    DateTime.parse(DateTime(2022, 10, 19, 13, 0, 0).toString()),
    DateTime.parse(DateTime(2022, 10, 19, 14, 0, 0).toString()),
    DateTime.parse(DateTime(2022, 10, 20, 14, 0, 0).toString()),
    DateTime.parse(DateTime(2022, 10, 25, 13, 0, 0).toString()),
    DateTime.parse(DateTime(2022, 10, 25, 15, 0, 0).toString()),
  ];

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  void goToNotification() {
    Get.toNamed(PageName.notificationStudent);
  }

  void goToCompleteProfile() {
    Get.toNamed(PageName.profileCompleteStudent);
  }
}
