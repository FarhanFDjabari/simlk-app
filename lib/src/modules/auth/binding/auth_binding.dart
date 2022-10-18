import 'package:get/get.dart';
import 'package:simlk_app/src/modules/auth/controller/auth_controller.dart';
import 'package:simlk_app/src/modules/auth/controller/counselor_login_controller.dart';
import 'package:simlk_app/src/modules/auth/controller/student_login_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => CounselorLoginController());
    Get.lazyPut(() => StudentLoginController());
  }
}
