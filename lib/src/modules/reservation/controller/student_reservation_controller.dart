import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class StudentReservationController
    extends BaseListController<ReservationSchedule> {
  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getStudentReservations();
  }

  void goToDetail({required int id}) {
    Get.toNamed('${PageName.reservationStudent}/$id');
  }

  Future<void> getStudentReservations() async {
    loadingState();
    await client().then((value) {
      value.fetchMahasiswaOngoingReservation().validateStatus().then((data) {
        dataList.clear();
        setFinishCallbacks(data.data?.reversed.toList() ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
