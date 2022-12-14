import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';

class SupervisorNewReservationDetailController
    extends BaseObjectController<ReservationSchedule> {
  final counselingLocationController = TextEditingController();
  final counselingFinalReportController = TextEditingController();

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
        counselingLocationController.text = data.data?.location ?? "";
        setFinishCallbacks(data.data);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> setReservationStatus(
      {required int id, required int status}) async {
    loadingState();
    await client().then((value) {
      Get.showSnackbar(SIMLKSnackbar(
        snackbarMessage:
            'Berhasil mengubah status reservasi: ${status == 2 ? 'DALAM PROSES' : status == 3 ? 'PENANGANAN' : 'SELESAI'}',
        snackbarStateEnum: SnackbarStateEnum.POSITIVE,
      ));
    });
  }
}
