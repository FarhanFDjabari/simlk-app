import 'package:get/get.dart';
import 'package:simlk_app/src/modules/history/controllers/coordinator/coordinator_reservation_history_controller.dart';

class CoordinatorReservationHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoordinatorReservationHistoryController());
  }
}
