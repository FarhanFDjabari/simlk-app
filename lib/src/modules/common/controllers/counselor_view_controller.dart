import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/home/controller/counselor_home_controller.dart';
import 'package:simlk_app/src/modules/notification/controllers/counselor_notification_controller.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';

class CounselorViewController extends BaseObjectController {
  final RxInt pageIndex = 0.obs;
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
    updateNotifications();
    super.onReady();
  }

  void updateNotifications() {
    Get.find<CounselorNotificationController>().getAllNotifications();
  }

  void updateOngoingReservations() {
    Get.find<CounselorHomeController>().getOngoingReservations();
  }
}
