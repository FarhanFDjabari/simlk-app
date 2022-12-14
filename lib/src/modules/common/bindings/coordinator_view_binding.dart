import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/controllers/coordinator_view_controller.dart';
import 'package:simlk_app/src/modules/history/controllers/coordinator/coordinator_reservation_history_controller.dart';
import 'package:simlk_app/src/modules/home/controller/coordinator_home_controller.dart';
import 'package:simlk_app/src/modules/notification/controllers/coordinator_notification_controller.dart';
import 'package:simlk_app/src/modules/profile/controllers/coordinator_profile_controller.dart';
import 'package:simlk_app/src/modules/schedule/controllers/coordinator_schedule_controller.dart';

class CoordinatorViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CoordinatorViewController());
    Get.put(CoordinatorHomeController());
    Get.put(CoordinatorScheduleController());
    Get.put(CoordinatorNotificationController());
    Get.put(CoordinatorReservationHistoryController());
    Get.put(CoordinatorProfileController());
  }
}
