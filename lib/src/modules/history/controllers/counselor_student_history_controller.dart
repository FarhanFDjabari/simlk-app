import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';

class CounselorStudentHistoryController
    extends BaseListController<ReservationSchedule> {
  final RxString nimMahasiswa = "".obs;

  @override
  void onInit() {
    nimMahasiswa(Get.parameters["nim"] as String);
    getReservationHistoryByNim(nim: nimMahasiswa.value);
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getReservationHistoryByNim(nim: nimMahasiswa.value);
  }

  void goToDetail({required int id}) {
    Get.toNamed('/konselor/history/$id');
  }

  Future<void> getReservationHistoryByNim({required String nim}) async {
    loadingState();
    await client().then((value) {
      value
          .fetchReservationScheduleByNim(nim: nim)
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
