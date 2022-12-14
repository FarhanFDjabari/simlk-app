import 'package:get/get.dart';
import 'package:simlk_app/src/modules/profile/controllers/coordinator_profile_controller.dart';

class CoordinatorProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoordinatorProfileController());
  }
}
