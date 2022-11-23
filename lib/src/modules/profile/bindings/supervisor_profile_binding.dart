import 'package:get/get.dart';

import 'package:simlk_app/src/modules/profile/controllers/supervisor_profile_controller.dart';

class SupervisorProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupervisorProfileController());
  }
}
