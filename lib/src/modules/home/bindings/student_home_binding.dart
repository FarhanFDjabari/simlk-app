import 'package:get/get.dart';
import 'package:simlk_app/src/modules/home/controller/student_home_controller.dart';

class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentHomeController());
  }
}
