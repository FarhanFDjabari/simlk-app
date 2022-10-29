import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';

class StudentReservationDetailController
    extends BaseObjectController<ReservationSchedule> {
  final RxInt processIndex = 1.obs;

  final processes = [
    'Diajukan',
    'Dalam Proses',
    'Penanganan',
    'Selesai',
  ].obs;

  @override
  void onInit() {
    id = Get.parameters['id'].toString();
    getReservationDetail(
        id: int.tryParse(Get.parameters['id'].toString()) ?? 0);
    super.onInit();
  }

  Future<void> getReservationDetail({required int id}) async {
    loadingState();
    await client().then((value) {
      value
          .fetchMahasiswaReservationDetail(id: id)
          .validateStatus()
          .then((data) {
        processIndex(data.data?.status);
        setFinishCallbacks(data.data);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
