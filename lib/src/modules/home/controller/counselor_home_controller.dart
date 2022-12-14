import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/konselor/konselor.dart';
import 'package:simlk_app/src/data/model/reservation/reservation_schedule.dart';
import 'package:simlk_app/src/data/storage/storage_constants.dart';
import 'package:simlk_app/src/data/storage/storage_manager.dart';
import 'package:simlk_app/src/modules/notification/controllers/counselor_notification_controller.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorHomeController extends BaseListController<ReservationSchedule> {
  Konselor get localUserData {
    return Konselor.fromJson(StorageManager().get(StorageName.KONSELOR));
  }

  @override
  void onReady() {
    Get.find<CounselorNotificationController>().getAllNotifications();
    super.onReady();
  }

  @override
  void onInit() {
    getOngoingReservations();
    super.onInit();
  }

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getOngoingReservations();
  }

  void goToCompleteProfile() {
    Get.toNamed(PageName.profileCompleteCounselor);
  }

  void goToDetail({required int id}) {
    Get.toNamed('${PageName.reservationKonselor}/$id');
  }

  Future<void> getOngoingReservations() async {
    loadingState();
    await client().then((value) {
      value
          .fetchReservationByKonselorId(konselorId: localUserData.id)
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
