import 'package:get/get.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorHomeController extends BaseObjectController {
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
