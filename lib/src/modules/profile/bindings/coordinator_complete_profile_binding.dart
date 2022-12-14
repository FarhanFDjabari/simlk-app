import 'package:get/get.dart';
import 'package:simlk_app/src/modules/profile/controllers/coordinator_complete_profile_controller.dart';

class CoordinatorCompleteProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoordinatorCompleteProfileController());
  }
}
