import 'package:get/get.dart';
import 'package:simlk_app/src/modules/profile/controllers/counselor_profile_controller.dart';

class CounselorProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounselorProfileController());
  }
}
