import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/pengawas/pengawas.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/notification/controllers/supervisor_notification_controller.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class SupervisorHomeController extends BaseObjectController<Pengawas> {
  final RxInt badgeNumber = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Pengawas get localUserData {
    return Pengawas.fromJson(StorageManager().get(StorageName.SUPERVISOR));
  }

  @override
  void onReady() {
    updateNotifications();
    super.onReady();
  }

  void updateNotifications() {
    Get.find<SupervisorNotificationController>().getAllNotifications();
  }

  void goToReservasi() {
    Get.toNamed(PageName.reservationSupervisor);
  }

  void goToNewReservasi() {
    Get.toNamed(PageName.newReservationSupervisor);
  }

  void goToSchedule() {
    Get.toNamed(PageName.counselorScheduleSupervisor);
  }

  void goToHistory() {
    Get.toNamed(PageName.reservationHistorySupervisor);
  }

  void goToNofication() {
    Get.toNamed(PageName.notificationSupervisor);
  }

  void goToProfile() {
    Get.toNamed(PageName.profileSupervisor);
  }
}
