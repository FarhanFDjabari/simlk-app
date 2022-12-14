import 'package:get/get.dart';
import 'package:simlk_app/src/modules/reservation/controller/coordinator_reservation_detail_controller.dart';

class CoordinatorReservationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoordinatorReservationDetailController());
  }
}
