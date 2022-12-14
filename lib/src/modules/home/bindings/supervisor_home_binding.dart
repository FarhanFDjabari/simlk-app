import 'package:get/get.dart';
import 'package:simlk_app/src/modules/home/controller/supervisor_home_controller.dart';
import 'package:simlk_app/src/modules/notification/controllers/supervisor_notification_controller.dart';

class SupervisorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupervisorHomeController());
    Get.put(SupervisorNotificationController());
  }
}
