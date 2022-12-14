import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/modules/home/controller/coordinator_home_controller.dart';
import 'package:simlk_app/src/modules/reservation/controller/coordinator_reservation_detail_controller.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';

class CoordinatorCounselorAssignController
    extends BaseListController<Konselor> {
  late int resId;
  final RxBool isReservationAssigned = false.obs;

  @override
  void onInit() {
    resId = int.parse(Get.parameters['id'].toString());
    getCounselorAvailable(resId);
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getCounselorAvailable(resId);
  }

  Future<void> getCounselorAvailable(int resId) async {
    loadingState();
    await client().then((value) {
      value
          .fetchKonselorAvailable(reservationId: resId)
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

  Future<void> setKonselorToReservation({
    required int reservationId,
    required int konselorId,
  }) async {
    loadingState();
    await client().then((value) {
      value
          .assignKonselorToReservation(
              reservationId: reservationId, konselorId: konselorId)
          .validateStatus()
          .then((data) {
        Get.find<CoordinatorHomeController>().getOngoingSchedule();
        Get.find<CoordinatorReservationDetailController>().isActionTaken(true);
        isReservationAssigned(true);
        finishLoadData();
        Get.showSnackbar(SIMLKSnackbar(
          snackbarMessage: 'Konselor Telah Ditugaskan',
          snackbarStateEnum: SnackbarStateEnum.POSITIVE,
        ));
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
