import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/notification/controllers/counselor_notification_controller.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorHomeController extends BaseObjectController<Konselor> {
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
