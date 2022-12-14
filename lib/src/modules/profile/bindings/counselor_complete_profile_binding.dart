import 'package:get/get.dart';
import 'package:simlk_app/src/modules/profile/controllers/counselor_complete_profile_controller.dart';

class CounselorCompleteProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounselorCompleteProfileController());
  }
}
