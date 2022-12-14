import 'package:get/get.dart';
import 'package:simlk_app/src/modules/schedule/controllers/coordinator_counselor_assign_controller.dart';

class CoordinatorCounselorAssignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoordinatorCounselorAssignController());
  }
}
