import 'package:get/get.dart';
import 'package:simlk_app/src/modules/history/controllers/counselor_student_history_controller.dart';

class CounselorStudentHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CounselorStudentHistoryController());
  }
}
