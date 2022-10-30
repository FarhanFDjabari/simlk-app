import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentReservationHistoryController
    extends BaseListController<ReservationSchedule> {
  @override
  void onInit() {
    final nim = StorageManager().get(StorageName.MAHASISWA)['nim'];
    getReservationHistoryByNim(nim: nim);
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    final nim = StorageManager().get(StorageName.MAHASISWA)['nim'];
    getReservationHistoryByNim(nim: nim);
  }

  void goToDetail({required int id}) {
    Get.toNamed('${PageName.reservationHistoryStudent}/$id');
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
