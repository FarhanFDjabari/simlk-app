import 'package:get/get.dart';
import 'package:simlk_app/src/modules/home/controller/coordinator_home_controller.dart';

class CoordinatorHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CoordinatorHomeController());
  }
}
