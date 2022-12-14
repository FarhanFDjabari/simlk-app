import 'package:get/get.dart';
import 'package:simlk_app/src/modules/history/controllers/supervisor/supervisor_reservation_history_detail_controller.dart';

class SupervisorReservationHistoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupervisorReservationHistoryDetailController());
  }
}
