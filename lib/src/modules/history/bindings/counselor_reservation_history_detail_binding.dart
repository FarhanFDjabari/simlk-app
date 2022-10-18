import 'package:get/get.dart';
import 'package:simlk_app/src/modules/history/controllers/counselor_reservation_history_detail_controller.dart';

class CounselorReservationHistoryDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounselorReservationHistoryDetailController());
  }
}
