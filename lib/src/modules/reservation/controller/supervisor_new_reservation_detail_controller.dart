import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/modules/reservation/controller/supervisor_new_reservation_controller.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_object_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class SupervisorNewReservationDetailController
    extends BaseObjectController<ReservationSchedule> {
  final counselingLocationController = TextEditingController();
  final counselingFinalReportController = TextEditingController();
  final RxBool isActionTaken = false.obs;

  @override
  void onInit() {
    id = Get.parameters['id'].toString();
    getReservationDetail(
        id: int.tryParse(Get.parameters['id'].toString()) ?? 0);
    super.onInit();
  }

  void refreshNewReservationList() {
    Get.find<SupervisorNewReservationController>().getOngoingReservations();
  }

  void goToCounselorReservationDetail(int id) {
    Get.offNamed('${PageName.reservationSupervisor}/$id');
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

  Future<void> handleAsCounselor({required int id}) async {
    loadingState();
    await client().then((value) {
      value
          .setReservationSupervisorHandle(reservationId: id)
          .validateStatus()
          .then((data) {
        isActionTaken(true);
        finishLoadData();
        refreshNewReservationList();
        Get.showSnackbar(SIMLKSnackbar(
          snackbarMessage: 'Anda akan menangani reservasi ini sebagai konselor',
          snackbarStateEnum: SnackbarStateEnum.NORMAL,
        ));
        goToCounselorReservationDetail(id);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> assignToPeerCounselor({required int id}) async {
    loadingState();
    await client().then((value) {
      value
          .assignReservationToPeerCounselor(reservationId: id)
          .validateStatus()
          .then((data) {
        isActionTaken(true);
        finishLoadData();
        refreshNewReservationList();
        Get.showSnackbar(SIMLKSnackbar(
          snackbarMessage:
              'Reservasi telah berhasil diteruskan kepada koordinator konselor',
          snackbarStateEnum: SnackbarStateEnum.POSITIVE,
        ));
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
