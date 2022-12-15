import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/modules/common/widgets/simlk_snackbar.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/helper/snackbar_state_enum.dart';

class CoordinatorCounselorAssignController
    extends BaseListController<Konselor> {
  late int resId;
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
        debugPrint(onError);
        finishLoadData(errorMessage: onError);
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
        finishLoadData();
        Get.showSnackbar(SIMLKSnackbar(
          snackbarMessage: 'Konselor Telah Ditugaskan',
          snackbarStateEnum: SnackbarStateEnum.POSITIVE,
        ));
      }).handleError((onError) {
        debugPrint(onError);
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
