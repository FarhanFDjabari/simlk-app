import 'package:get/get.dart';
import 'package:simlk_app/src/modules/history/controllers/counselor_student_list_controller.dart';

class CounselorStudentListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounselorStudentListController());
  }
}
