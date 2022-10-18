import 'package:get/get.dart';
import 'package:simlk_app/src/modules/profile/controllers/student_profile_controller.dart';

class StudentProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentProfileController());
  }
}
