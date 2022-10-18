import 'package:get/get.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorStudentListController extends BaseListController {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  void goToReservationHistory({required String nim}) {
    Get.toNamed('/reservation/$nim');
  }
}
