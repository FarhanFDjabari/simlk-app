import 'package:get/get.dart';

import 'package:simlk_app/src/modules/reservation/controller/supervisor_reservation_controller.dart';

class SupervisorReservationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupervisorReservationController());
  }
}
