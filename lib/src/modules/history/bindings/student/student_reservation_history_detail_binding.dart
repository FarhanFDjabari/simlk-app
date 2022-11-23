import 'package:get/get.dart';
import 'package:simlk_app/src/modules/history/controllers/student/student_reservation_history_detail_controller.dart';

class StudentReservationHistoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentReservationHistoryDetailController());
  }
}
