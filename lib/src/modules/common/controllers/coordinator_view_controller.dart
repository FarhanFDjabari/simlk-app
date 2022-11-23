import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/modules/notification/controllers/coordinator_notification_controller.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';

class CoordinatorViewController extends BaseObjectController {
  final RxInt pageIndex = 0.obs;
  final RxInt badgeNumber = 0.obs;

  final dummyData = Konselor(
    id: 1,
    name: 'Konselor Prototype',
    profileImageUrl:
        "https://dreamvilla.life/wp-content/uploads/2017/07/dummy-profile-pic.png",
    email: 'konselor@test.com',
  );

  @override
  void onInit() {
    super.onInit();
  }

  Konselor get localUserData {
    return dummyData;
  }

  @override
  void onReady() {
    Get.find<CoordinatorNotificationController>().getAllNotifications();
    super.onReady();
  }
}
