import 'package:get/get.dart';
import 'package:simlk_app/src/modules/history/controllers/supervisor/supervisor_counselor_history_controller.dart';
import 'package:simlk_app/src/modules/history/controllers/supervisor/supervisor_reservation_history_controller.dart';

class SupervisorReservationHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupervisorReservationHistoryController());
    Get.lazyPut(() => SupervisorCounselorHistoryController());
  }
}
