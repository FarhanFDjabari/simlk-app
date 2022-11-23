import 'package:get/get.dart';
import 'package:simlk_app/src/modules/schedule/controllers/supervisor_counselor_schedule_controller.dart';

class SupervisorCounselorScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupervisorCounselorScheduleController());
  }
}
