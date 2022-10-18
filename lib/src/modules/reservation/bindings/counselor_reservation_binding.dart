import 'package:get/get.dart';
import 'package:simlk_app/src/modules/reservation/controller/counselor_reservation_controller.dart';

class CounselorReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounselorReservationController());
  }
}
