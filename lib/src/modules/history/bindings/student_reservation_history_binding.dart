import 'package:get/get.dart';
import 'package:simlk_app/src/modules/history/controllers/student_reservation_history_controller.dart';

class StudentReservationHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentReservationHistoryController());
  }
}
