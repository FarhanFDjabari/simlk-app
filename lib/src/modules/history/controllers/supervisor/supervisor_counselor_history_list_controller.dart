import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class SupervisorCounselorHistoryListController
    extends BaseListController<ReservationSchedule> {
  final RxInt idKonselor = 0.obs;

  @override
  void onInit() {
    idKonselor(int.parse(Get.parameters["id"] as String));
    getReservationHistoryByKonselorId(id: idKonselor.value);
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getReservationHistoryByKonselorId(id: idKonselor.value);
  }

  void goToDetail({required int id}) {
    Get.toNamed('${PageName.reservationHistorySupervisor}/$id');
  }

  Future<void> getReservationHistoryByKonselorId({required int id}) async {
    loadingState();
    await client().then((value) {
      value
          .fetchReservationHistoryByKonselorId(konselorId: id)
          .validateStatus()
          .then((data) {
        dataList.clear();
        setFinishCallbacks(data.data?.reversed.toList() ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
