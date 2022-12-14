import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/koordinator/koordinator.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CoordinatorHomeController
    extends BaseListController<ReservationSchedule> {
  final RxInt notificationCount = 0.obs;

  @override
  void onInit() async {
    getOngoingSchedule();
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getOngoingSchedule();
  }

  void goToNotification() {
    Get.toNamed(PageName.notificationCoordinator);
  }

  void goToDetail({required int id}) {
    Get.toNamed('/coordinator/reservation/$id');
  }

  void goToCompleteProfile() {
    Get.toNamed(PageName.profileCompleteCoordinator);
  }

  Koordinator get localUserData =>
      Koordinator.fromJson(StorageManager().get(StorageName.KOORDINATOR));

  Future<void> getOngoingSchedule() async {
    loadingState();
    await client().then((value) {
      value.fetchKoordinatorOngoingReservation().validateStatus().then((data) {
        dataList.clear();
        setFinishCallbacks(data.data?.reversed.toList() ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
