import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/modules/reservation/controller/student_reservation_controller.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';

class StudentReservationDetailController
    extends BaseObjectController<ReservationSchedule> {
  final RxInt processIndex = 1.obs;

  final processes = [
    'Pengajuan Dibuat',
    'Pengajuan Diterima',
    'Konselor Ditugaskan',
    'Dijadwalkan',
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

  Future<void> cancelReservation({required int id}) async {
    loadingState();
    await client().then((value) {
      value.deleteMahasiswaReservation(id: id).validateStatus().then((data) {
        Get.find<StudentReservationController>().refreshPage();
        finishLoadData();
        Get.back();
        Get.showSnackbar(SIMLKSnackbar(
          snackbarMessage: 'Reservasi Berhasil Dibatalkan',
          snackbarStateEnum: SnackbarStateEnum.NORMAL,
        ));
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
