import 'package:get/get.dart';

import 'package:simlk_app/src/modules/notification/controllers/supervisor_notification_controller.dart';

class SupervisorNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupervisorNotificationController());
  }
}
