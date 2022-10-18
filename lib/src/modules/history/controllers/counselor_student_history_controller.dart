import 'package:get/get.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorStudentHistoryController extends BaseListController {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    // TODO: implement refreshPage
  }

  void goToDetail({required int id}) {
    Get.toNamed('/konselor/history/$id');
  }
}
