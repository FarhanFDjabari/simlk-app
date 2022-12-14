import 'package:get/get.dart';
import 'package:simlk_app/src/modules/schedule/controllers/coordinator_schedule_controller.dart';

class CoordinatorScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoordinatorScheduleController());
  }
}
