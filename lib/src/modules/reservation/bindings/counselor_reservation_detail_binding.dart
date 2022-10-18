import 'package:get/get.dart';
import 'package:simlk_app/src/modules/reservation/controller/counselor_reservation_detail_controller.dart';

class CounselorReservationDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounselorReservationDetailController());
  }
}
