import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:simlk_app/src/data/model/notification/notification.dart';
import 'package:simlk_app/src/modules/home/controller/counselor_home_controller.dart';
import 'package:simlk_app/src/services/api/api_services.dart';
import 'package:simlk_app/src/services/base/base_list_controller.dart';
import 'package:simlk_app/src/services/errorhandler/error_handler.dart';
import 'package:simlk_app/src/utils/routes/page_name.dart';

class CounselorNotificationController extends BaseListController<Notification> {
  final RxInt badgeNumber = 0.obs;

  @override
  void loadNextPage() {
    // TODO: implement loadNextPage
  }

  @override
  void refreshPage() {
    getAllNotifications();
  }

  Future<void> goToDetail({
    required int id,
    required int status,
  }) async {
    if (status < 4) {
      Get.toNamed('${PageName.reservationKonselor}/$id');
    } else {
      Get.toNamed('/konselor/history/$id');
    }
  }

  Future<void> getAllNotifications() async {
    loadingState();
    await client().then((value) {
      value.fetchAllNotifications().validateStatus().then((data) {
        final notifUnreadCount =
            data.data?.where((element) => element.isRead == 0).length;

        Get.find<CounselorHomeController>().badgeNumber(notifUnreadCount);

        dataList.clear();
        setFinishCallbacks(data.data?.reversed.toList() ?? []);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> markReadNotificationById(
      {required int id, int? status, int? reservationId}) async {
    loadingState();
    await client().then((value) {
      value
          .markNotificationById(notificationId: id, isRead: 1)
          .validateStatus()
          .then((data) {
        finishLoadData();
        getAllNotifications();
        goToDetail(id: reservationId ?? 0, status: status ?? 1);
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }

  Future<void> markReadAllNotifications() async {
    loadingState();
    await client().then((value) {
      value.markAllNotifications().validateStatus().then((data) {
        finishLoadData();
        getAllNotifications();
      }).handleError((onError) {
        debugPrint(onError.toString());
        finishLoadData(errorMessage: onError.toString());
      });
    });
  }
}
