import 'package:get/get.dart';
import 'package:simlk_app/src/modules/notification/controllers/coordinator_notification_controller.dart';

class CoordinatorNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoordinatorNotificationController());
  }
}
