import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/controllers/view_controller.dart';
import 'package:simlk_app/src/modules/history/controllers/student_reservation_history_controller.dart';
import 'package:simlk_app/src/modules/home/controller/student_home_controller.dart';
import 'package:simlk_app/src/modules/profile/controllers/student_profile_controller.dart';
import 'package:simlk_app/src/modules/reservation/controller/student_reservation_controller.dart';

class ViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ViewController());
    Get.lazyPut(() => StudentHomeController());
    Get.lazyPut(() => StudentReservationController());
    Get.lazyPut(() => StudentReservationHistoryController());
    Get.lazyPut(() => StudentProfileController());
    // Get.lazyPut(() => StudentNotificationController());
  }
}
