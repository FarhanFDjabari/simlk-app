import 'package:get/get.dart';
import 'package:simlk_app/src/modules/notification/controllers/counselor_notification_controller.dart';

class CounselorNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounselorNotificationController());
  }
}
