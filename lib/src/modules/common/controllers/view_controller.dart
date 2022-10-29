import 'package:get/get.dart';
import 'package:simlk_app/src/modules/notification/controllers/student_notification_controller.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';

class ViewController extends BaseObjectController {
  final RxInt pageIndex = 0.obs;

  @override
  void onReady() {
    Get.find<StudentNotificationController>().getAllNotifications();
    super.onReady();
  }
}
