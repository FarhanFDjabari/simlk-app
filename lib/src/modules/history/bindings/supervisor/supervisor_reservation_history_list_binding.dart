import 'package:get/get.dart';

import 'package:simlk_app/src/modules/history/controllers/supervisor/supervisor_counselor_history_list_controller.dart';

class SupervisorCounselorHistoryListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SupervisorCounselorHistoryListController());
  }
}
