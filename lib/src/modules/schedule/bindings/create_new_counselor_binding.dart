import 'package:get/get.dart';
import 'package:simlk_app/src/modules/schedule/controllers/create_new_counselor_controller.dart';

class CreateNewCounselorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateNewCounselorController());
  }
}
