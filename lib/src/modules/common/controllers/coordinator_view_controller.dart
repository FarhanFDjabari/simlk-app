import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/koordinator/koordinator.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/home/controller/coordinator_home_controller.dart';
import 'package:simlk_app/src/modules/notification/controllers/coordinator_notification_controller.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';

class CoordinatorViewController extends BaseObjectController {
  final RxInt pageIndex = 0.obs;
  final RxInt badgeNumber = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  Koordinator get localUserData {
    return Koordinator.fromJson(StorageManager().get(StorageName.KOORDINATOR));
  }

  @override
  void onReady() {
    updateNotifications();
    super.onReady();
  }

  void updateNotifications() {
    Get.find<CoordinatorNotificationController>().getAllNotifications();
  }

  void updateOngoingReservations() {
    Get.find<CoordinatorHomeController>().getOngoingSchedule();
  }
}
