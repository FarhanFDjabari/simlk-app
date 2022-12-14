import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class SupervisorCounselorHistoryController
    extends BaseListController<Konselor> {
  @override
  void onInit() {
    refreshPage();
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getCounselorList();
  }

  void goToDetail({required int id}) {
    Get.toNamed('/supervisor/history/counselor/$id');
  }

  Future<void> getCounselorList() async {
    loadingState();
    await client().then((value) {
      value.fetchKonselorOnDay(day: 0).validateStatus().then((data) {
        dataList.clear();
        setFinishCallbacks(data.data ?? []);
      });
    });
  }
}
