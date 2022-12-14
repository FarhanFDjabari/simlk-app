import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class SupervisorReservationHistoryController
    extends BaseListController<ReservationSchedule> {
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
    getSupervisorReservationHistory();
  }

  void goToDetail({required int id}) {
    Get.toNamed('/konselor/history/$id');
  }

  Future<void> getSupervisorReservationHistory() async {
    loadingState();
    await client().then((value) {
      value.fetchPengawasReservationHistory().validateStatus().then((data) {
        dataList.clear();
        setFinishCallbacks(data.data?.reversed.toList() ?? []);
      }).handleError((onError) {
        debugPrint(onError);
        finishLoadData(errorMessage: onError);
      });
    });
  }
}
