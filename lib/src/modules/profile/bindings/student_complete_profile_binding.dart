import 'package:get/get.dart';
import 'package:simlk_app/src/modules/profile/controllers/student_complete_profile.dart';

class StudentCompleteProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentCompleteProfileController());
  }
}
