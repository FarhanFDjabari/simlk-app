import 'package:get/get.dart';
import 'package:simlk_app/src/modules/reservation/controller/supervisor_new_reservation_detail_controller.dart';

class SupervisorNewReservationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupervisorNewReservationDetailController());
  }
}
