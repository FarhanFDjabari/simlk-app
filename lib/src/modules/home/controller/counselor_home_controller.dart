import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/notification/controllers/counselor_notification_controller.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorHomeController extends BaseObjectController<Konselor> {
  final RxInt badgeNumber = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Konselor get localUserData {
    return Konselor.fromJson(StorageManager().get(StorageName.KONSELOR));
  }

  @override
  void onReady() {
    Get.find<CounselorNotificationController>().getAllNotifications();
    super.onReady();
  }

  void goToReservasi() {
    Get.toNamed(PageName.reservationKonselor);
  }

  void goToHistory() {
    Get.toNamed(PageName.counselorStudentList);
  }

  void goToNofication() {
    Get.toNamed(PageName.notificationKonselor);
  }

  void goToProfile() {
    Get.toNamed(PageName.profileKonselor);
  }
}
