import 'package:get/get.dart';
import 'package:simlk_app/src/modules/notification/controllers/student_notification_controller.dart';

class StudentNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentNotificationController());
  }
}
