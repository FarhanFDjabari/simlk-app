import 'package:get/get.dart';
import 'package:simlk_app/src/modules/reservation/controller/student_reservation_detail_controller.dart';

class StudentReservationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentReservationDetailController());
  }
}
