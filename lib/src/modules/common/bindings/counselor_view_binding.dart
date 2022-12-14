import 'package:get/get.dart';
import 'package:simlk_app/src/modules/common/controllers/counselor_view_controller.dart';
import 'package:simlk_app/src/modules/history/controllers/counselor/counselor_student_list_controller.dart';
import 'package:simlk_app/src/modules/home/controller/counselor_home_controller.dart';
import 'package:simlk_app/src/modules/notification/controllers/counselor_notification_controller.dart';
import 'package:simlk_app/src/modules/profile/controllers/counselor_profile_controller.dart';

class CounselorViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CounselorViewController());
    Get.put(CounselorHomeController());
    Get.put(CounselorStudentListController());
    Get.put(CounselorNotificationController());
    Get.put(CounselorProfileController());
  }
}
