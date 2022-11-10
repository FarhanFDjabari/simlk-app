import 'package:get/get.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/history/controllers/student_reservation_history_controller.dart';
import 'package:simlk_app/src/modules/notification/controllers/student_notification_controller.dart';
import 'package:simlk_app/src/modules/reservation/controller/student_reservation_controller.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';

class ViewController extends BaseObjectController {
  final RxInt pageIndex = 0.obs;

  @override
  void onReady() {
    updateNotifications();
    super.onReady();
  }

  void updateNotifications() {
    Get.find<StudentNotificationController>().getAllNotifications();
  }

  void updateOngoingReservations() {
    Get.find<StudentReservationController>().getStudentReservations();
  }

  void updateReservationHistories() {
    final nim = StorageManager().get(StorageName.MAHASISWA)['nim'];
    Get.find<StudentReservationHistoryController>()
        .getReservationHistoryByNim(nim: nim);
  }
}
