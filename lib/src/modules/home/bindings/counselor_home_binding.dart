import 'package:get/get.dart';
import 'package:simlk_app/src/modules/home/controller/counselor_home_controller.dart';
import 'package:simlk_app/src/modules/notification/controllers/counselor_notification_controller.dart';

class CounselorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounselorHomeController());
    Get.put(CounselorNotificationController());
  }
}
