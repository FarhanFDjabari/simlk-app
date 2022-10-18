import 'package:get/get.dart';
import 'package:simlk_app/src/modules/reservation/controller/student_reservation_controller.dart';

class StudentReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentReservationController());
  }
}
